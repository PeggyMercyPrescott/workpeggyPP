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

        public IActionResult DetailsAsTableList(string memberId, string saleproductCode, string v)
        {
            //var roleId = HttpContext.Session.GetString("roleId");
            //if (roleId != "17822a90-1029-454a-b4c7-f631c9ca6c7d") //Not member
            //{
            //    ViewBag.IsMember = 0;
            //}
            //else //Is member
            //{
            //    ViewBag.IsMember = 1;
            //}
            //ViewBag.product_group = new SelectList(_context.product_group, "product_group_code", "product_group_desc", "1");
            ViewBag.memberId = memberId;
            var member = _context.member.Single(m => m.id == new Guid(memberId));
            if (!String.IsNullOrEmpty(saleproductCode)) {
                if (!String.IsNullOrEmpty(v)) { ViewBag.isViewOnly = 1; } else { ViewBag.isViewOnly = 0; }
                var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(m => m.member_code == member.member_code && m.saleproduct_code == saleproductCode).ToList();
                return View(mem_saleproduct_plans);
            } else {
                ViewBag.isViewOnly = 0;
                return View(new List<mem_saleproduct_plan>());
            }
        }







        // GET: mem_saleproduct_plan
        public async Task<IActionResult> Index()
        {
            return View(await _context.mem_saleproduct_plan.ToListAsync());
        }

        // GET: mem_saleproduct_plan/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mem_saleproduct_plan = await _context.mem_saleproduct_plan.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            if (mem_saleproduct_plan == null)
            {
                return NotFound();
            }

            return View(mem_saleproduct_plan);
        }

        // GET: mem_saleproduct_plan/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: mem_saleproduct_plan/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("saleproduct_code,member_code,launch_date,actual_qty,estimate_qty,id,launch_year,period_no,rowversion,x_log,x_note,x_status")] mem_saleproduct_plan mem_saleproduct_plan)
        {
            if (ModelState.IsValid)
            {
                _context.Add(mem_saleproduct_plan);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(mem_saleproduct_plan);
        }

        // GET: mem_saleproduct_plan/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mem_saleproduct_plan = await _context.mem_saleproduct_plan.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            if (mem_saleproduct_plan == null)
            {
                return NotFound();
            }
            return View(mem_saleproduct_plan);
        }

    }
}
