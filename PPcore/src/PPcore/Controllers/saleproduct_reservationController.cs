using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Globalization;

namespace PPcore.Controllers
{
    public class saleproduct_reservationController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public saleproduct_reservationController(PalangPanyaDBContext context)
        {
            _context = context;    
        }
         
        private void prepareViewBag(string saleproduct_code)
        {
            var userId = HttpContext.Session.GetString("memberId");
            ViewBag.userId = userId;
            var mb = _context.member.SingleOrDefault(m => m.id == new Guid(userId));
            ViewBag.userName = mb.mem_username + " <" + (mb.fname + " " + mb.lname).Trim() + ">";

            var msp = _context.mem_saleproduct.SingleOrDefault(sp => sp.saleproduct_code == saleproduct_code);
            var spu = _context.saleproduct_unit.SingleOrDefault(s => s.saleproduct_unit_code == msp.saleproduct_unit_code);
            ViewBag.saleproduct_unit = spu.saleproduct_unit_desc_thai;

            ViewBag.retail_price = msp.retail_price;
            ViewBag.wholesale_price = msp.wholesale_price;

            ViewBag.reservation_status_list = new SelectList(new[] { new { Value = "0", Text = "" }, new { Value = "1", Text = "รอยืนยัน" }, new { Value = "2", Text = "รอโอนเงินจอง" }, new { Value = "3", Text = "โอนเงินจองเรียบร้อยแล้ว" }, new { Value = "4", Text = "ส่งมอบเรียบร้อยแล้ว" } }, "Value", "Text", "0");

            var ip = _context.ini_province.OrderBy(p => p.province_code).Select(p => new { Value = p.province_code, Text = p.pro_desc }).ToList();
            ip.Insert(0, (new { Value = "0", Text = "" }));
            ViewBag.ini_province = new SelectList(ip.AsEnumerable(), "Value", "Text", "0");

        }

        public IActionResult Index()
        {
            ViewBag.countRecords = _context.saleproduct_reservation.Where(sr => sr.x_status=="Y").Count();
            return View();
        }

        [HttpGet]
        public IActionResult DetailsAsTable()
        {
            var ss = _context.saleproduct_reservation.Where(sr => sr.x_status == "Y").OrderBy(sr => sr.reservation_code).ToList();

            List<ViewModels.saleproduct_reservation.detailViewModel> dd = new List<ViewModels.saleproduct_reservation.detailViewModel>();
            foreach(var s in ss)
            {
                var d = new ViewModels.saleproduct_reservation.detailViewModel();
                d.reservation_code = s.reservation_code;
                d.id = s.id;
                d.CreatedDate = String.Format("{0:dd-MM-yyyy}", s.CreatedDate);
                var sp = _context.saleproduct.SingleOrDefault(ssp => ssp.saleproduct_code == s.saleproduct_code);
                d.saleproduct_desc = sp.saleproduct_desc;
                d.reserving_member_code = s.reserving_member_code;
                d.fname = s.fname;
                d.lname = s.lname;
                d.tel = s.tel;
                d.reservation_amount = s.reservation_amount.ToString();

                var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(spp => spp.saleproduct_code == s.saleproduct_code && spp.x_status == "Y");
                var sum_estimate_qty = 0; var count_period = 0;
                foreach (var ms in mem_saleproduct_plans)
                {
                    count_period++;
                    sum_estimate_qty += ms.estimate_qty;
                }
                d.sum_estimate_qty = sum_estimate_qty;
                //amountOfPeriod = count_period;

                var msp = _context.mem_saleproduct.SingleOrDefault(mmsp => mmsp.saleproduct_code == s.saleproduct_code);
                d.store_quantity = msp.store_quantity;

                var spu = _context.saleproduct_unit.SingleOrDefault(sspu => sspu.saleproduct_unit_code == msp.saleproduct_unit_code);
                d.saleproduct_unit = spu.saleproduct_unit_desc_thai;

                var status = s.reservation_status;
                if (!string.IsNullOrEmpty(status))
                {
                    if (status == "1")
                    {
                        d.reservation_status = "รอยืนยัน";
                    } else if (status == "2")
                    {
                        d.reservation_status = "รอโอนเงินจอง";
                    } else if (status == "3")
                    {
                        d.reservation_status = "โอนเงินจองเรียบร้อยแล้ว";
                    } else if (status == "4") {
                        d.reservation_status = "ส่งมอบเรียบร้อยแล้ว";
                    } else {
                        d.reservation_status = status;
                    }
                }
                else
                {
                    d.reservation_status = "";
                }
                dd.Add(d);
            }

            return View(dd);
        }

        public IActionResult Create(string saleproduct_code)
        {
            prepareViewBag(saleproduct_code);

            var sp = _context.saleproduct.SingleOrDefault(ssp => ssp.saleproduct_code == saleproduct_code);

            var iv = new PPcore.ViewModels.saleproduct_reservation.inputViewModel();
            iv.reservation_code = "";iv.saleproduct_code = sp.saleproduct_code;
            iv.saleproduct_desc = sp.saleproduct_desc;
            iv.CreatedDate = String.Format("{0:dd-MM-yyyy}", DateTime.Now);
            return View(iv);
        }


        [HttpPost]
        public async Task<IActionResult> Create(ViewModels.saleproduct_reservation.inputViewModel iv)
        {
            var r = new saleproduct_reservation();
            r.reservation_code = "R"+DateTime.Now.ToString("yyMMddhhmmssfffffff");
            r.saleproduct_code = iv.saleproduct_code;
            r.reservation_amount = int.Parse(iv.reservation_amount);
            r.reservation_status = iv.reservation_status;
            r.is_retail_price = iv.is_retail_price;
            r.down_payment = decimal.Parse(iv.down_payment);
            r.is_member = iv.is_member;
            r.reserving_member_code = iv.reserving_member_code;
            r.fname = iv.fname;
            r.lname = iv.lname;
            r.tel = iv.tel;
            r.place_name = iv.place_name;
            r.building = iv.building;
            r.floor = iv.floor;
            r.room = iv.room;
            r.village = iv.village;
            r.h_no = iv.h_no;
            r.lot_no = iv.lot_no;
            r.street = iv.street;
            r.lane = iv.lane;
            r.province_code = iv.province_code;
            r.district_code = iv.district_code;
            r.subdistrict_code = iv.subdistrict_code;
            r.zip_code = iv.zip_code;
            r.CreatedBy = iv.CreatedBy;

            //string cdate = iv.CreatedDate.ToString();
            //var cday = cdate.Substring(0, 2);
            //var cmonth = cdate.Substring(3, 2);
            //var cyearint = int.Parse(cdate.Substring(6, 4));
            //var cyear = cyearint > 2500 ? (cyearint - 543).ToString() : cyearint.ToString();
            //DateTime d = Convert.ToDateTime("03/22/2017");
            //DateTime d = Convert.ToDateTime(cmonth + "/" + cday + "/" + cyear);

            r.CreatedDate = DateTime.Now;
            r.reservation_note = iv.reservation_note;
            r.EditedBy = iv.CreatedBy;
            r.EditedDate = DateTime.Now;

            r.x_status = "Y";
            _context.saleproduct_reservation.Add(r);
            await _context.SaveChangesAsync();
            return Json("success");
        }

        public IActionResult getMemberAddress(string member_code)
        {
            var m = _context.member.SingleOrDefault(mm => mm.member_code == member_code && mm.x_status == "Y");
            if (m != null)
            {
                var iv = new ViewModels.saleproduct_reservation.inputViewModel();
                iv.fname = m.fname;
                iv.lname = m.lname;
                iv.tel = m.tel;
                iv.place_name = m.place_name;
                iv.building = m.building;
                iv.floor = m.floor;
                iv.room = m.room;
                iv.village = m.village;
                iv.h_no = m.h_no;
                iv.lot_no = m.lot_no;
                iv.street = m.street;
                iv.lane = m.lane;
                iv.province_code = m.province_code;
                iv.district_code = m.district_code;
                iv.subdistrict_code = m.subdistrict_code;
                iv.zip_code = m.zip_code;

                string pjson = JsonConvert.SerializeObject(iv);
                return Json(pjson);
            }
            else
            {
                return Json("");
            }

        }


        //public async Task<IActionResult> Edit(string id, [Bind("reservation_code,CreatedBy,CreatedDate,EditedBy,EditedDate,down_payment,id,is_member,is_retail_price,reservation_amount,reservation_note,reservation_status,reserving_member_code,rowversion,saleproduct_code,x_log,x_note,x_status")] saleproduct_reservation saleproduct_reservation)


    }
}
