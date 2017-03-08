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
    public class mem_saleproduct_planController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public mem_saleproduct_planController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        public IActionResult DetailsAsTableList(string memberId, string saleproductCode, string unit, string lyear)
        {
            ViewBag.memberId = memberId;
            ViewBag.spUnit = unit;
            var member = _context.member.Single(m => m.id == new Guid(memberId));
            if (lyear != "-1") {
                List<mem_saleproduct_plan> mm;
                if (lyear != "0")
                {
                    mm = _context.mem_saleproduct_plan.Where(m => m.member_code == member.member_code && m.saleproduct_code == saleproductCode && m.launch_year == lyear).OrderBy(m => m.period_no).ToList();
                }
                else
                {
                    mm = _context.mem_saleproduct_plan.Where(m => m.member_code == member.member_code && m.saleproduct_code == saleproductCode).OrderBy(m => m.period_no).ToList();
                }

                var sum_estimate_qty = 0; var count_period = 0;
                foreach (var m in mm)
                {
                    count_period++;
                    sum_estimate_qty += m.estimate_qty;
                }
                ViewBag.hAmountOfPeriod = count_period;
                ViewBag.hAmountPerYear = sum_estimate_qty;

                return View(mm);
            } else {
                return View(new List<mem_saleproduct_plan>());
            }
        }


        public IActionResult Create()
        {
            ViewBag.planId = "";
            return View();
        }

        public IActionResult Edit(string planId)
        {
            ViewBag.planId = planId;

            var mspp = _context.mem_saleproduct_plan.SingleOrDefault(m => m.id == new Guid(planId));
            ViewBag.estimate_qty = mspp.estimate_qty;
            return View(mspp);
        }

        [HttpPost]
        //public async Task<IActionResult> Save([Bind("saleproduct_code,member_code,launch_date,actual_qty,estimate_qty,id,launch_year,period_no,rowversion,x_log,x_note,x_status")] mem_saleproduct_plan mem_saleproduct_plan)
        public async Task<IActionResult> Save(string id, string memberId, string saleproduct_code, string launch_date, string estimate_qty)
        {
            var member = _context.member.Single(m => m.id == new Guid(memberId));
            saleproduct_code = saleproduct_code.Trim(); launch_date = launch_date.Trim(); estimate_qty = estimate_qty.Trim();
            var ldate = DateTime.Parse(launch_date);
            //var mspp = _context.mem_saleproduct_plan.SingleOrDefault(m => m.member_code == member.member_code && m.saleproduct_code == saleproduct_code && m.launch_date == ldate);
            //if (mspp != null)
            if(id != null)
            {
                var mspp = _context.mem_saleproduct_plan.SingleOrDefault(m => m.id == new Guid(id.Trim()));
                mspp.launch_date = ldate;
                mspp.estimate_qty = int.Parse(estimate_qty);
                _context.Update(mspp);
                await _context.SaveChangesAsync();

            }
            else
            {

                var p = new mem_saleproduct_plan();
                p.member_code = member.member_code;
                p.saleproduct_code = saleproduct_code;
                p.launch_date = ldate;
                p.launch_year = ldate.Year.ToString();
                p.estimate_qty = int.Parse(estimate_qty);

                _context.Add(p);
                await _context.SaveChangesAsync();

            }



            return Json(new { result = "success" });
        }

    }
}
