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
            var mem_saleproducts = _context.mem_saleproduct.Where(m => m.member_code == member.member_code && m.x_status != "T").ToList();
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

        public IActionResult Create(string memberId)
        {
            var member = _context.member.Single(m => m.id == new Guid(memberId));

            var sp = new saleproduct();
            ViewBag.saleproduct_code = "SP" + DateTime.Now.ToString("yyMMddHHmmssfffffff");
            sp.saleproduct_code = ViewBag.saleproduct_code;
            sp.saleproduct_desc = "T";
            sp.saleproduct_group_code = "T";
            sp.saleproduct_type_code = "T";
            sp.x_status = "T";
            _context.Add(sp);
            _context.SaveChanges();

            ViewBag.IsCreate = 1; //??

            ViewBag.product_group = new SelectList(_context.product_group, "product_group_code", "product_group_desc", "1");

            var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(mspp => mspp.member_code == member.member_code).ToList();
            int aAmount = 0;
            foreach (var mspp in mem_saleproduct_plans)
            {
                aAmount += mspp.estimate_qty;
            }
            ViewBag.aAmount = aAmount;

            ViewBag.saleproduct_unit = new SelectList(_context.saleproduct_unit, "saleproduct_unit_code", "saleproduct_unit_desc_thai", "1");




            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(string memberId, string saleproduct_code, string saleproduct_desc, string saleproduct_group_code, string saleproduct_type_code, string saleproduct_unit_code,
                    string retail_price, string  wholesale_price, string wholesale_condition, string product_life, string capacity_per_day, string capacity_per_month,
                    string advance_order_condition, string store_quantity, string distribution_channels, string contact_email, string contact_telephone, string contact_other


            ) 
            
            //,saleproduct_code,member_code,advance_order_condition,capacity_per_day,capacity_per_month,contact_email,contact_other,contact_telephone,delivery_bus,delivery_other,delivery_post,delivery_train,distribution_channels,id,product_detail,product_life,rec_no,retail_price,rowversion,saleproduct_unit_code,store_quantity,wholesale_condition,wholesale_price,x_log,x_note,x_status")] mem_saleproduct mem_saleproduct)
        {
            var member = _context.member.Single(m => m.id == new Guid(memberId));

            var saleproduct = _context.saleproduct.Single(sp => sp.saleproduct_code == saleproduct_code);
            saleproduct.saleproduct_desc = saleproduct_desc;
            saleproduct.saleproduct_group_code = saleproduct_group_code;
            saleproduct.saleproduct_type_code = saleproduct_type_code;
            saleproduct.x_status = "Y";
            _context.Update(saleproduct);

            var msp = new mem_saleproduct();
            msp.member_code = member.member_code;
            msp.saleproduct_code = saleproduct.saleproduct_code;
            msp.saleproduct_unit_code = saleproduct_unit_code;

            msp.retail_price = decimal.Parse(retail_price);
            msp.wholesale_price = decimal.Parse(wholesale_price);
            msp.wholesale_condition = wholesale_condition;
            msp.product_life = product_life;
            msp.capacity_per_day = capacity_per_day;
            msp.capacity_per_month = capacity_per_month;
            msp.advance_order_condition = advance_order_condition;
            msp.store_quantity = int.Parse(store_quantity);
            msp.distribution_channels = distribution_channels;
            msp.contact_email = contact_email;
            msp.contact_telephone = contact_telephone;
            msp.contact_other = contact_other;



            msp.x_status = "Y";
            _context.Add(msp);



            await _context.SaveChangesAsync();
            //return Json(new { result = "success", rec_no = mpMax, mem_product_id = mp.id, product_group_desc = pgrp.product_group_desc, product_type_desc = ptyp.product_type_desc, product_desc = pd.product_desc });

            return Json(new { result = "success" });

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
