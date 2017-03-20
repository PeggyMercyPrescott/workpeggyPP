using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;

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
            var msp = _context.mem_saleproduct.SingleOrDefault(sp => sp.saleproduct_code == saleproduct_code);
            var spu = _context.saleproduct_unit.SingleOrDefault(s => s.saleproduct_unit_code == msp.saleproduct_unit_code);
            ViewBag.saleproduct_unit = spu.saleproduct_unit_desc_thai;

            ViewBag.reservation_status_list = new SelectList(new[] { new { Value = "0", Text = "" }, new { Value = "1", Text = "รอยืนยัน" }, new { Value = "2", Text = "รอโอนเงินจอง" }, new { Value = "3", Text = "โอนเงินจองเรียบร้อยแล้ว" }, new { Value = "4", Text = "ส่งมอบเรียบร้อยแล้ว" } }, "Value", "Text", "0");

            var ip = _context.ini_province.OrderBy(p => p.province_code).Select(p => new { Value = p.province_code, Text = p.pro_desc }).ToList();
            ip.Insert(0, (new { Value = "0", Text = "" }));
            ViewBag.ini_province = new SelectList(ip.AsEnumerable(), "Value", "Text", "0");

        }

        public IActionResult Create(string saleproduct_code)
        {
            prepareViewBag(saleproduct_code);
           


            var iv = new PPcore.ViewModels.saleproduct_reservation.inputViewModel();
            return View(iv);
        }





        // GET: saleproduct_reservation
        public async Task<IActionResult> Index()
        {
            return View(await _context.saleproduct_reservation.ToListAsync());
        }

        // GET: saleproduct_reservation/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var saleproduct_reservation = await _context.saleproduct_reservation.SingleOrDefaultAsync(m => m.reservation_code == id);
            if (saleproduct_reservation == null)
            {
                return NotFound();
            }

            return View(saleproduct_reservation);
        }


        // POST: saleproduct_reservation/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("reservation_code,CreatedBy,CreatedDate,EditedBy,EditedDate,down_payment,id,is_member,is_retail_price,reservation_amount,reservation_note,reservation_status,reserving_member_code,rowversion,saleproduct_code,x_log,x_note,x_status")] saleproduct_reservation saleproduct_reservation)
        {
            if (ModelState.IsValid)
            {
                _context.Add(saleproduct_reservation);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(saleproduct_reservation);
        }

        // GET: saleproduct_reservation/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var saleproduct_reservation = await _context.saleproduct_reservation.SingleOrDefaultAsync(m => m.reservation_code == id);
            if (saleproduct_reservation == null)
            {
                return NotFound();
            }
            return View(saleproduct_reservation);
        }

        // POST: saleproduct_reservation/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("reservation_code,CreatedBy,CreatedDate,EditedBy,EditedDate,down_payment,id,is_member,is_retail_price,reservation_amount,reservation_note,reservation_status,reserving_member_code,rowversion,saleproduct_code,x_log,x_note,x_status")] saleproduct_reservation saleproduct_reservation)
        {
            if (id != saleproduct_reservation.reservation_code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(saleproduct_reservation);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!saleproduct_reservationExists(saleproduct_reservation.reservation_code))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            return View(saleproduct_reservation);
        }

        // GET: saleproduct_reservation/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var saleproduct_reservation = await _context.saleproduct_reservation.SingleOrDefaultAsync(m => m.reservation_code == id);
            if (saleproduct_reservation == null)
            {
                return NotFound();
            }

            return View(saleproduct_reservation);
        }

        // POST: saleproduct_reservation/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var saleproduct_reservation = await _context.saleproduct_reservation.SingleOrDefaultAsync(m => m.reservation_code == id);
            _context.saleproduct_reservation.Remove(saleproduct_reservation);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool saleproduct_reservationExists(string id)
        {
            return _context.saleproduct_reservation.Any(e => e.reservation_code == id);
        }
    }
}
