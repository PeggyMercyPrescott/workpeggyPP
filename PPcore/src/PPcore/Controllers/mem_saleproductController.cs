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
    public class mem_saleproductController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public mem_saleproductController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        // GET: mem_saleproduct
        public IActionResult Index(string memberId, string v)
        {
            //return View(await _context.mem_saleproduct.ToListAsync());

            List<ViewModels.mem_saleproduct.mem_saleproductViewModel> mem_saleproductViewModels = new List<ViewModels.mem_saleproduct.mem_saleproductViewModel>();
            var member = _context.member.Single(m => m.id == new Guid(memberId));
            var mem_saleproducts = _context.mem_saleproduct.Where(m => m.member_code == member.member_code).ToList();
            foreach (var mp in mem_saleproducts)
            {
                var mem_saleproductViewModel = new ViewModels.mem_saleproduct.mem_saleproductViewModel();
                mem_saleproductViewModel.mem_saleproduct = mp;
                
                var saleproduct = _context.saleproduct.Single(p => p.saleproduct_code == mp.saleproduct_code);
                mem_saleproductViewModel.saleproduct = saleproduct;
                mem_saleproductViewModel.saleproduct_group_desc = _context.product_group.SingleOrDefault(p => p.product_group_code == saleproduct.saleproduct_group_code).product_group_desc;
                mem_saleproductViewModel.saleproduct_type_desc = _context.product_type.SingleOrDefault(p => (p.product_type_code == saleproduct.saleproduct_type_code) && (p.product_group_code == saleproduct.saleproduct_group_code)).product_type_desc;
                mem_saleproductViewModels.Add(mem_saleproductViewModel);
            }
            ViewBag.memberId = memberId;
            //ViewBag.course_grade = new SelectList(_context.course_grade, "cgrade_code", "cgrade_desc");(x.Body.Scopes.Count > 5) && (x.Foo == "test")
            if (!String.IsNullOrEmpty(v)) { ViewBag.isViewOnly = 1; } else { ViewBag.isViewOnly = 0; }
            return View(mem_saleproductViewModels.OrderBy(me => me.saleproduct.saleproduct_desc));

        }

        // GET: mem_saleproduct/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mem_saleproduct = await _context.mem_saleproduct.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            if (mem_saleproduct == null)
            {
                return NotFound();
            }

            return View(mem_saleproduct);
        }

        // GET: mem_saleproduct/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: mem_saleproduct/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("saleproduct_code,member_code,advance_order_condition,capacity_per_day,capacity_per_month,contact_email,contact_other,contact_telephone,delivery_bus,delivery_other,delivery_post,delivery_train,distribution_channels,id,product_detail,product_life,rec_no,retail_price,rowversion,saleproduct_unit_code,store_quantity,wholesale_condition,wholesale_price,x_log,x_note,x_status")] mem_saleproduct mem_saleproduct)
        {
            if (ModelState.IsValid)
            {
                _context.Add(mem_saleproduct);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(mem_saleproduct);
        }

        // GET: mem_saleproduct/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mem_saleproduct = await _context.mem_saleproduct.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            if (mem_saleproduct == null)
            {
                return NotFound();
            }
            return View(mem_saleproduct);
        }

        // POST: mem_saleproduct/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("saleproduct_code,member_code,advance_order_condition,capacity_per_day,capacity_per_month,contact_email,contact_other,contact_telephone,delivery_bus,delivery_other,delivery_post,delivery_train,distribution_channels,id,product_detail,product_life,rec_no,retail_price,rowversion,saleproduct_unit_code,store_quantity,wholesale_condition,wholesale_price,x_log,x_note,x_status")] mem_saleproduct mem_saleproduct)
        {
            if (id != mem_saleproduct.saleproduct_code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(mem_saleproduct);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!mem_saleproductExists(mem_saleproduct.saleproduct_code))
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
            return View(mem_saleproduct);
        }

        // GET: mem_saleproduct/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mem_saleproduct = await _context.mem_saleproduct.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            if (mem_saleproduct == null)
            {
                return NotFound();
            }

            return View(mem_saleproduct);
        }

        // POST: mem_saleproduct/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var mem_saleproduct = await _context.mem_saleproduct.SingleOrDefaultAsync(m => m.saleproduct_code == id);
            _context.mem_saleproduct.Remove(mem_saleproduct);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool mem_saleproductExists(string id)
        {
            return _context.mem_saleproduct.Any(e => e.saleproduct_code == id);
        }
    }
}
