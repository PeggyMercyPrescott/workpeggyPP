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

            var d = new ViewModels.saleproduct.detailsViewModel();
            d.breadcrumb = "<li>"+spg.product_group_desc+"</li><li>"+spt.product_type_desc+"</li><li class='active'>"+sp.saleproduct_desc+"</li>";

            var mspi = _context.mem_saleproduct_image.Where(mmspi => mmspi.saleproduct_code == sp.saleproduct_code).OrderBy(mmspi => mmspi.saleproduct_image_code).ToList();

            //List<ViewModels.saleproduct.fotoramaData> fList = new List<ViewModels.saleproduct.fotoramaData>();

            d.images = ""; //string s = "";

            //UrlHelper url;
            //Uri requestUrl = url.RequestContext.HttpContext.Request.Url;

            //string absoluteAction = string.Format("{0}://{1}{2}", requestUrl.Scheme, requestUrl.Authority, url.Action(action, controller));

            if (mspi.Count() != 0)
            {
                foreach (var m in mspi)
                {
                    //d.images += "<a href='"+ Url.Action("image", "pic_image")+"?id="+m.saleproduct_image_code+"'></a>";
                    //d.images += "<img src='" + Url.Action("image", "pic_image", null, Request.url.scheme) + "?id=" + m.saleproduct_image_code + "'>";
                    d.images += m.saleproduct_image_code + "|";

                    //s = Url.Action("image", "pic_image") + "?id=" + m.saleproduct_image_code;
                    //fList.Add(new ViewModels.saleproduct.fotoramaData { img = s, thumb = s });
                }
            }
            else
            {
                d.images = "std-blank.jpg" + "|";
            }

            //d.fotoramaDataList = fList;
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
        public IActionResult DeliveryPlan()
        {
            var pg = _context.product_group.Where(g => g.x_status == "Y").Select(g => new { Value = g.product_group_code, Text = g.product_group_desc }).ToList();
            pg.Insert(0, (new { Value = "0", Text = "<ทั้งหมด>" }));
            ViewBag.product_group = new SelectList(pg.AsEnumerable(), "Value", "Text", "0");

            var stds = _context.saleproduct_standard.Where(ss => ss.x_status == "Y").OrderBy(ss => ss.saleproduct_standard_desc_thai);
            var cStd = "";
            foreach (var std in stds)
            {
                cStd += "<label class='checkbox-inline text-left' onclick='stdClick();'><input id='std_" + std.saleproduct_standard_code + "' type='checkbox' />" + std.saleproduct_standard_desc_thai + "</label><br />";
            }
            ViewBag.standard = cStd;

            return View();
        }

        [HttpGet]
        public IActionResult Reserve()
        {
            var pg = _context.product_group.Where(g => g.x_status == "Y").Select(g => new { Value = g.product_group_code, Text = g.product_group_desc }).ToList();
            pg.Insert(0, (new { Value = "0", Text = "<ทั้งหมด>" }));
            ViewBag.product_group = new SelectList(pg.AsEnumerable(), "Value", "Text", "0");

            var stds = _context.saleproduct_standard.Where(ss => ss.x_status == "Y").OrderBy(ss => ss.saleproduct_standard_desc_thai);
            var cStd = "";
            foreach (var std in stds)
            {
                cStd += "<label class='checkbox-inline text-left' onclick='stdClick();'><input id='std_" + std.saleproduct_standard_code + "' type='checkbox' />" + std.saleproduct_standard_desc_thai + "</label><br />";
            }
            ViewBag.standard = cStd;

            return View();
        }

    }

}

