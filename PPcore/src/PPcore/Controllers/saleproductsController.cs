using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc.Routing;
using System.Globalization;
using System.Threading;

namespace PPcore.Controllers
{
    public class saleproductsController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public saleproductsController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        [HttpGet]
        public IActionResult Search()
        {
            var pg = _context.product_group.Where(g => g.x_status == "Y").Select(g => new { Value = g.product_group_code, Text = g.product_group_desc }).ToList();
            pg.Insert(0, (new { Value = "0", Text = "<ทั้งหมด>" }));
            ViewBag.product_group = new SelectList(pg.AsEnumerable(), "Value", "Text", "0");

            var stds = _context.saleproduct_standard.Where(ss => ss.x_status == "Y").OrderBy(ss => ss.saleproduct_standard_desc_thai);
            var cStd = "";
            foreach (var std in stds)
            {
                cStd += "<label class='checkbox-inline text-left' onclick='stdClick();'><input id='std_" + std.saleproduct_standard_code+"' type='checkbox' />"+std.saleproduct_standard_desc_thai+"</label><br />";
            }
            ViewBag.standard = cStd;

            return View();
        }

        [HttpPost]
        public IActionResult Search(string searchword, string saleproduct_group_code, string saleproduct_type_code,
            string minPrice, string maxPrice,
            bool delivery_post, bool delivery_bus, bool delivery_train, bool delivery_other, string std
            )
        {

            bool requireAdd = false;
            decimal dMinPrice = 0; decimal dMaxPrice = 9999999;
            if (!String.IsNullOrEmpty(minPrice))
            {
                dMinPrice = decimal.Parse(minPrice);
            }
            if (!String.IsNullOrEmpty(maxPrice))
            {
                dMaxPrice = decimal.Parse(maxPrice);
            }
            if (dMinPrice > dMaxPrice) { var temp = dMinPrice; dMinPrice = dMaxPrice; dMaxPrice = temp; }

            string dpost = delivery_post ? "Y" : "N";
            string dbus = delivery_bus? "Y" : "N";
            string dtrain = delivery_train ? "Y" : "N";
            string dother = delivery_other ? "Y" : "N";


            IQueryable<saleproduct> sps = null;
            if (String.IsNullOrEmpty(searchword)) {
                sps = _context.saleproduct.Where(ssp => ssp.x_status == "Y");
            } else {
                sps = _context.saleproduct.Where(ssp => ssp.x_status == "Y" && ssp.saleproduct_desc.Contains(searchword)).OrderBy(ssp => ssp.saleproduct_desc);
            }
            if (saleproduct_group_code != "0") sps = sps.Where(ssp => ssp.saleproduct_group_code == saleproduct_group_code);
            if (saleproduct_type_code != "0") sps = sps.Where(ssp => ssp.saleproduct_type_code == saleproduct_type_code);

            List<saleproduct> spss = sps.OrderBy(ssp => ssp.saleproduct_desc).ToList();

            List<PPcore.ViewModels.saleproduct.SearchResultViewModel> sr = new List<ViewModels.saleproduct.SearchResultViewModel>();
            if (sps != null)
            {
                foreach (var sp in spss)
                {
                    requireAdd = false;

                    var msp = _context.mem_saleproduct.SingleOrDefault(mmsp => mmsp.saleproduct_code == sp.saleproduct_code);
                    if (msp.retail_price >= dMinPrice && msp.retail_price <= dMaxPrice) {

                        if (dbus == "Y" && dpost == "Y" && dtrain == "Y" && dother == "Y")
                        {
                            requireAdd = true;
                        } else if ((dbus == "N" && dpost == "N" && dtrain == "N" && dother == "N")) {
                            if ((String.IsNullOrEmpty(msp.delivery_bus) || (msp.delivery_bus == "N")) && (String.IsNullOrEmpty(msp.delivery_post) || (msp.delivery_post == "N")) && (String.IsNullOrEmpty(msp.delivery_train) || (msp.delivery_train == "N")) && (String.IsNullOrEmpty(msp.delivery_other)) )
                            {
                                requireAdd = true;
                            }
                        }
                        else
                        {
                            if ((dbus == "Y") && (msp.delivery_bus == "Y")) { requireAdd = true; }
                            else if ((dpost == "Y") && (msp.delivery_post == "Y")) { requireAdd = true; }
                            else if ((dtrain == "Y") && (msp.delivery_train == "Y")) { requireAdd = true; }
                            else if ((dother == "Y" && !String.IsNullOrEmpty(msp.delivery_other))) { requireAdd = true; }
                        }

                        if (requireAdd)
                        {
                            requireAdd = false;
                            if (!String.IsNullOrEmpty(std))
                            {
                                std = std.Remove(std.Length - 1);
                                string[] aStd = std.Split('|');
                                var countAllStd = _context.saleproduct_standard.Count();
                                var countSelectStd = aStd.Count();
                                if (countAllStd != countSelectStd)
                                {
                                    foreach (string s in aStd)
                                    {
                                        var r = _context.mem_saleproduct_standard.SingleOrDefault(ss => ss.x_status == "Y" && ss.saleproduct_code == msp.saleproduct_code && ss.saleproduct_standard_code == s);
                                        if (r != null)
                                        {
                                            requireAdd = true;
                                        }
                                    }
                                }
                                else
                                {
                                    requireAdd = true;
                                }
                            }
                            else
                            {
                                var r = _context.mem_saleproduct_standard.Where(ss => ss.x_status == "Y" && ss.saleproduct_code == msp.saleproduct_code).Count();
                                if (r == 0)
                                {
                                    requireAdd = true;
                                }
                            }

                        }


                        if (requireAdd)
                        {
                            var s = new PPcore.ViewModels.saleproduct.SearchResultViewModel();
                            s.saleproduct_code = sp.saleproduct_code;
                            s.saleproduct_desc = sp.saleproduct_desc;

                            var p = msp.retail_price;
                            var n = p - Math.Truncate(p);
                            if (n > 0)
                            {
                                s.retail_price = String.Format("{0:n}", msp.retail_price);
                            }
                            else
                            {
                                s.retail_price = String.Format("{0:n0}", msp.retail_price);
                            }

                            var msis = _context.mem_saleproduct_image.Where(mmsi => mmsi.saleproduct_code == sp.saleproduct_code).OrderBy(mmsi => mmsi.saleproduct_code).ToList();
                            if (msis.Count() != 0)
                            {
                                var msi = msis.First();
                                s.image_code = msi.saleproduct_image_code;
                            }
                            else
                            {
                                s.image_code = "MSTD6003090948370167483.jpg"; //std-blank.jpg
                            }


                            sr.Add(s);
                        }
                    }






                }


                string pjson = JsonConvert.SerializeObject(sr);
                return Json(pjson);
            }
            else
            {
                return Json("");
            }


        }

        [HttpPost]
        public IActionResult Details(string saleproduct_code)
        {
            var sp = _context.saleproduct.SingleOrDefault(ssp => ssp.saleproduct_code == saleproduct_code);
            var spg = _context.product_group.SingleOrDefault(sspg => sspg.product_group_code == sp.saleproduct_group_code);
            var spt = _context.product_type.SingleOrDefault(sspt => sspt.product_group_code == sp.saleproduct_group_code && sspt.product_type_code == sp.saleproduct_type_code);
            var msp = _context.mem_saleproduct.SingleOrDefault(mmsp => mmsp.saleproduct_code == sp.saleproduct_code);

            var d = new ViewModels.saleproduct.detailsViewModel();
            d.breadcrumb = "<li>"+spg.product_group_desc+"</li><li>"+spt.product_type_desc+"</li><li class='active'>"+sp.saleproduct_desc+"</li>";

            d.total_quantity = String.Format("{0:n0}", _context.mem_saleproduct_plan.Where(m => m.saleproduct_code == sp.saleproduct_code && m.x_status == "Y").Sum(m => m.estimate_qty));

            var rp = msp.retail_price;
            var n = rp - Math.Truncate(rp);
            if (n > 0)
            {
                d.retail_price = String.Format("{0:n}", msp.retail_price);
            }
            else
            {
                d.retail_price = String.Format("{0:n0}", msp.retail_price);
            }

            var wp = msp.wholesale_price;
            n = wp - Math.Truncate(wp);
            if (n > 0)
            {
                d.wholesale_price = String.Format("{0:n}", msp.wholesale_price);
            }
            else
            {
                d.wholesale_price = String.Format("{0:n0}", msp.wholesale_price);
            }

            d.wholesale_condition = !String.IsNullOrEmpty(msp.wholesale_condition)? msp.wholesale_condition:"-";

            d.advance_order_condition = !String.IsNullOrEmpty(msp.advance_order_condition) ? msp.advance_order_condition : "-";
            d.store_quantity = String.Format("{0:n0}", msp.store_quantity);

            d.product_life = !String.IsNullOrEmpty(msp.product_life) ? msp.product_life : "-";
            d.capacity_per_day = !String.IsNullOrEmpty(msp.capacity_per_day) ? msp.capacity_per_day : "-";
            d.capacity_per_month = !String.IsNullOrEmpty(msp.capacity_per_month) ? msp.capacity_per_month : "-";

            d.distribution_channels = !String.IsNullOrEmpty(msp.distribution_channels) ? msp.distribution_channels : "-";

            var delivery = "";
            if (!String.IsNullOrEmpty(msp.delivery_post) && msp.delivery_post == "Y")
            {
                delivery += "ไปรษณีย์, ";
            }
            if (!String.IsNullOrEmpty(msp.delivery_bus) && msp.delivery_bus == "Y")
            {
                delivery += "รถทัวร์, ";
            }
            if (!String.IsNullOrEmpty(msp.delivery_train) && msp.delivery_train == "Y")
            {
                delivery += "รถไฟ, ";
            }
            if (!String.IsNullOrEmpty(msp.delivery_other))
            {
                delivery += msp.delivery_other + ", ";
            }

            d.delivery = !String.IsNullOrEmpty(delivery)?delivery.Substring(0, delivery.Length - 2):"-";

            d.contact_telephone = !String.IsNullOrEmpty(msp.contact_telephone) ? msp.contact_telephone : "-";
            d.contact_email = !String.IsNullOrEmpty(msp.contact_email) ? msp.contact_email : "-";
            d.contact_other = !String.IsNullOrEmpty(msp.contact_other) ? msp.contact_other : "-";

            d.product_detail = !String.IsNullOrEmpty(msp.product_detail) ? msp.product_detail : "-";
            d.x_note = !String.IsNullOrEmpty(msp.x_note) ? msp.x_note : "-";

            var stdUl = "<ul>";
            var msps = _context.mem_saleproduct_standard.Where(mmsps => mmsps.saleproduct_code == sp.saleproduct_code && mmsps.x_status == "Y").ToList();
            foreach(var m in msps)
            {
                var s = _context.saleproduct_standard.SingleOrDefault(ss => ss.saleproduct_standard_code == m.saleproduct_standard_code);
                stdUl += "<li>" + s.saleproduct_standard_desc_thai + "</li>";
            }
            stdUl += "</ul>";

            d.standardUL = stdUl;

            var spu = _context.saleproduct_unit.SingleOrDefault(sspu => sspu.saleproduct_unit_code == msp.saleproduct_unit_code);
            d.saleproduct_unit = spu.saleproduct_unit_desc_thai;



            var mspi = _context.mem_saleproduct_image.Where(mmspi => mmspi.saleproduct_code == sp.saleproduct_code).OrderBy(mmspi => mmspi.saleproduct_image_code).ToList();

            d.images = ""; 

            if (mspi.Count() != 0)
            {
                foreach (var m in mspi)
                {
                    d.images += m.saleproduct_image_code + "|";
                }
            }
            else
            {
                d.images = "std-blank.jpg" + "|";
            }

            d.saleproduct_desc = sp.saleproduct_desc;

            string pjson = JsonConvert.SerializeObject(d);
            return Json(pjson);
        }

        [HttpGet]
        public IActionResult GetProductTypeAsSelect(string product_group_code)
        {
            if (product_group_code == null)
            {
                return NotFound();
            }
            if (product_group_code == "0")
            {
                return Content("<option value='0'><ทั้งหมด></option>");
            }
            var selectOptions = "";
            var productTypes = _context.product_type.Where(p => p.product_group_code == product_group_code).OrderBy(p => p.product_type_desc).ToList();
            if (productTypes == null)
            {
                return NotFound();
            }
            selectOptions += "<option value='0'><ทั้งหมด></option>";
            foreach (var productType in productTypes)
            {
                selectOptions += "<option value='" + productType.product_type_code + "'>" + productType.product_type_desc + "</option>";
            }

            return Content(selectOptions);
        }

        [HttpGet]
        public IActionResult Calendar()
        {
            var pg = _context.product_group.Where(g => g.x_status == "Y").Select(g => new { Value = g.product_group_code, Text = g.product_group_desc }).ToList();
            pg.Insert(0, (new { Value = "0", Text = "<ทั้งหมด>" }));
            ViewBag.product_group = new SelectList(pg.AsEnumerable(), "Value", "Text", "0");

            return View();
        }

        public IActionResult getCalendarEvents(long cstart, long cend, string saleproduct_group_code, string saleproduct_type_code)
        {
            System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            cstart *= 1000; cend *= 1000;
            DateTime tdate = dtDateTime.AddMilliseconds(cstart);
            DateTime dstart = new DateTime(tdate.Year, tdate.Month, tdate.Day);
            tdate = dtDateTime.AddMilliseconds(cend);
            DateTime dend = new DateTime(tdate.Year, tdate.Month, tdate.Day);

            //var culture = CultureInfo.InvariantCulture;  //CultureInfo.CreateSpecificCulture("en-US");
            //CultureInfo originalCulture = Thread.CurrentThread.CurrentCulture;
            //var culture = Thread.CurrentThread.CurrentCulture;
            var culture = CultureInfo.CreateSpecificCulture("en-US");

            List<calEvent> ces = new List<calEvent>();
            for (var day = dstart; day.Date <= dend; day = day.AddDays(1))
            {
                //var c = _context.saleproduct_reservation.Where(s => s.x_status == "Y" && s.CreatedDate >= day && s.CreatedDate < day.AddDays(1)).Count();
                var c = _context.saleproduct_reservation.Where(s => s.x_status == "Y" && s.CreatedDate.ToShortDateString() == day.ToShortDateString()).Count();
                if (c != 0)
                {
                    calEvent ce = new calEvent();
                    ce.title = c + " รายการ";
                    ce.start = day.ToString("yyyy-MM-dd", culture);
                    ce.end = day.ToString("yyyy-MM-dd", culture); //String.Format("{0:yyyy-MM-dd}", day);
                    ce.url = "#";
                    ces.Add(ce);
                }
            }

            string pjson = JsonConvert.SerializeObject(ces);
            return Json(pjson);
        }

        public IActionResult DetailsSaleProductByReservationAsTable(long rdate)
        {
            System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            //rdate *= 1000;
            DateTime tdate = dtDateTime.AddMilliseconds(rdate);
            DateTime drdate = new DateTime(tdate.Year, tdate.Month, tdate.Day);

            var culture = Thread.CurrentThread.CurrentCulture;
            ViewBag.displaydate = drdate.ToString("dd MMMM yyyy", culture);

            //var sprs = _context.saleproduct_reservation.Where(sspr => sspr.x_status == "Y" && sspr.CreatedDate >= drdate && sspr.CreatedDate < drdate.AddDays(1)).OrderBy(sspr => sspr.saleproduct_code).ToList();
            var sprs = _context.saleproduct_reservation.Where(sspr => sspr.x_status == "Y" && sspr.CreatedDate.ToShortDateString() == drdate.ToShortDateString()).OrderBy(sspr => sspr.saleproduct_code).ToList();
            List<ViewModels.saleproduct.detailsReservationViewModel> drs1 = new List<ViewModels.saleproduct.detailsReservationViewModel>();
            if (sprs != null && sprs.Count() != 0)
            {
                foreach(var spr in sprs)
                {
                    var dr = new ViewModels.saleproduct.detailsReservationViewModel();
                    dr.saleproduct_code = spr.saleproduct_code;
                    dr.reservation_amount = spr.reservation_amount;
                    drs1.Add(dr);
                }
            }

            List<ViewModels.saleproduct.detailsReservationViewModel> drs = new List<ViewModels.saleproduct.detailsReservationViewModel>();
            if (drs1 != null && drs1.Count() != 0)
            {
                var sp_code = ""; var sum_reserve = 0;
                foreach(var dr1 in drs1)
                {
                    
                    if (sp_code != dr1.saleproduct_code) {
                        if (sp_code != "")
                        {
                            var dr = new ViewModels.saleproduct.detailsReservationViewModel();
                            dr.saleproduct_code = sp_code;
                            dr.reservation_amount = sum_reserve;
                            drs.Add(dr);
                        }
                        sp_code = dr1.saleproduct_code;
                        sum_reserve = dr1.reservation_amount;
                    }
                    else
                    {
                        sum_reserve += dr1.reservation_amount;
                    }
                }
                var drr = new ViewModels.saleproduct.detailsReservationViewModel();
                drr.saleproduct_code = sp_code;
                drr.reservation_amount = sum_reserve;
                drs.Add(drr);
            }

            if (drs != null && drs.Count() != 0) {
                foreach(var dr in drs) {
                    var sp = _context.saleproduct.SingleOrDefault(ssp => ssp.saleproduct_code == dr.saleproduct_code);
                    dr.saleproduct_desc = sp.saleproduct_desc;
                    var msp = _context.mem_saleproduct.SingleOrDefault(mmsp => mmsp.saleproduct_code == dr.saleproduct_code);
                    dr.store_quantity = msp.store_quantity;
                    dr.left_in_stock = dr.store_quantity - dr.reservation_amount;
                    var u = _context.saleproduct_unit.SingleOrDefault(sspu => sspu.saleproduct_unit_code == msp.saleproduct_unit_code);
                    dr.saleproduct_unit = u.saleproduct_unit_desc_thai;

                }
            }

            return View(drs);
        }

        private class calEvent
        {
            public string id { get; set; }
            public string title { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            public string url { get; set; }
        }

    }

}

