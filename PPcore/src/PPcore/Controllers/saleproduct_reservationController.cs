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

        public IActionResult Create(string saleproduct_code)
        {
            prepareViewBag(saleproduct_code);

            var sp = _context.saleproduct.SingleOrDefault(ssp => ssp.saleproduct_code == saleproduct_code);

            var iv = new PPcore.ViewModels.saleproduct_reservation.inputViewModel();
            iv.reservation_code = "";
            iv.saleproduct_desc = sp.saleproduct_desc;
            iv.CreatedDate = DateTime.Now;
            return View(iv);
        }


        [HttpPost]
        public async Task<IActionResult> Create(ViewModels.saleproduct_reservation.inputViewModel iv)
        {
            var r = new saleproduct_reservation();
            r.reservation_code = "";
            r.reservation_amount = int.Parse(iv.reservation_amount);

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
