using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Newtonsoft.Json;

namespace PPcore.Controllers
{
    public class mem_saleproductController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        private async Task<IActionResult> clearTempData()
        {
            var d = DateTime.Now.AddDays(-1);
            var dFormat = "SP" + d.ToString("yyMMddHHmmssfffffff");
            var saleproducts = _context.saleproduct.Where(ssp => ssp.x_status == "T" && ssp.saleproduct_code.CompareTo(dFormat) < 0).ToList();
            foreach (var sp in saleproducts)
            {
                var mss = _context.mem_saleproduct.Where(mms => mms.saleproduct_code == sp.saleproduct_code).ToList();
                foreach (var ms in mss)
                {
                    _context.mem_saleproduct.Remove(ms);
                }

                var mspps = _context.mem_saleproduct_plan.Where(mmspp => mmspp.saleproduct_code == sp.saleproduct_code).ToList();
                foreach (var mspp in mspps)
                {
                    _context.mem_saleproduct_plan.Remove(mspp);
                }
                var mspss = _context.mem_saleproduct_standard.Where(mmsps => mmsps.saleproduct_code == sp.saleproduct_code).ToList();
                foreach (var msps in mspss)
                {
                    var pi = _context.pic_image.SingleOrDefault(ppi => ppi.image_code == msps.ref_image);
                    if (pi.image_code != "std-blank.jpg") { _context.pic_image.Remove(pi); }
                    _context.mem_saleproduct_standard.Remove(msps);
                }
                var mspis = _context.mem_saleproduct_image.Where(mmspi => mmspi.saleproduct_code == sp.saleproduct_code).ToList();
                foreach(var mspi in mspis)
                {
                    var pi = _context.pic_image.SingleOrDefault(ppi => ppi.image_code == mspi.saleproduct_image_code);
                    _context.pic_image.Remove(pi);
                    _context.mem_saleproduct_image.Remove(mspi);
                }


                _context.saleproduct.Remove(sp);
            }
            //foreach (var sp in saleproducts)
            //{
            //    _context.saleproduct.Remove(sp);
            //}
            await _context.SaveChangesAsync();
            return null;
        }

        private void prepareViewBag(string member_code)
        {
            //ViewBag.mem_title = new SelectList(new[] { new { Value = "0", Text = "" }, new { Value = "นาย", Text = "นาย" }, new { Value = "นาง", Text = "นาง" }, new { Value = "นางสาว", Text = "นางสาว" } }, "Value", "Text", "0");

            //var ml = _context.mem_level.OrderBy(tt => tt.mlevel_code).Select(tt => new { Value = tt.mlevel_code, Text = tt.mlevel_desc }).ToList();
            //ml.Insert(0, (new { Value = "0", Text = "" }));
            //ViewBag.mem_level = new SelectList(ml.AsEnumerable(), "Value", "Text", "0");

        }
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


                var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(msp => msp.member_code == member.member_code && msp.saleproduct_code == mp.saleproduct_code);
                var sum_estimate_qty = 0; var count_period = 0;
                foreach (var msp in mem_saleproduct_plans)
                {
                    count_period++;
                    sum_estimate_qty += msp.estimate_qty;
                }
                mem_saleproductViewModel.amount = sum_estimate_qty;
                mem_saleproductViewModel.amountOfPeriod = count_period;

                var saleproduct_unit = _context.saleproduct_unit.Single(u => u.saleproduct_unit_code == mp.saleproduct_unit_code);
                mem_saleproductViewModel.unit = saleproduct_unit.saleproduct_unit_desc_thai;

                mem_saleproductViewModels.Add(mem_saleproductViewModel);



            }
            ViewBag.memberId = memberId;
            //ViewBag.course_grade = new SelectList(_context.course_grade, "cgrade_code", "cgrade_desc");(x.Body.Scopes.Count > 5) && (x.Foo == "test")
            if (!String.IsNullOrEmpty(v)) { ViewBag.isViewOnly = 1; } else { ViewBag.isViewOnly = 0; }
            return View(mem_saleproductViewModels.OrderBy(me => me.saleproduct.saleproduct_desc));

        }

        public async Task<IActionResult> Create(string memberId)
        {
            await clearTempData();

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

            ViewBag.memberId = memberId;
            ViewBag.IsCreate = 1;

            ViewBag.product_group = new SelectList(_context.product_group, "product_group_code", "product_group_desc", "1");

            var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(mspp => mspp.member_code == member.member_code).ToList();
            int aAmount = 0;
            foreach (var mspp in mem_saleproduct_plans)
            {
                aAmount += mspp.estimate_qty;
            }
            ViewBag.aAmount = aAmount;
            ViewBag.aAmount = 0;

            ViewBag.saleproduct_unit = new SelectList(_context.saleproduct_unit, "saleproduct_unit_code", "saleproduct_unit_desc_thai", "1");

            //ViewBag.aYear = new SelectList(new[] { new { Value = "0", Text = "<ทั้งหมด>" } }, "Value", "Text", "0");




            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(string memberId, string saleproduct_code, string saleproduct_desc, string saleproduct_group_code, string saleproduct_type_code, string saleproduct_unit_code,
                    string retail_price, string  wholesale_price, string wholesale_condition, string product_life, string capacity_per_day, string capacity_per_month,
                    string advance_order_condition, string store_quantity, string distribution_channels, string contact_email, string contact_telephone, string contact_other,
                    string delivery_post, string delivery_bus, string delivery_train, string delivery_other, string product_detail, string x_note

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

            msp.delivery_post = delivery_post;
            msp.delivery_bus = delivery_bus;
            msp.delivery_train = delivery_train;
            msp.delivery_other = delivery_other;

            msp.product_detail = product_detail;
            msp.x_note = x_note;

            msp.x_status = "Y";
            _context.Add(msp);



            await _context.SaveChangesAsync();
            //return Json(new { result = "success", rec_no = mpMax, mem_product_id = mp.id, product_group_desc = pgrp.product_group_desc, product_type_desc = ptyp.product_type_desc, product_desc = pd.product_desc });

            return Json(new { result = "success" });

        }

        public IActionResult Edit(string memberId, string mem_saleproduct_id)
        {
            ViewBag.memberId = memberId;
            ViewBag.IsCreate = 0;

            var member = _context.member.Single(m => m.id == new Guid(memberId));
            var mspI = new ViewModels.mem_saleproduct.mem_saleproductInputViewModel();

            var msp = _context.mem_saleproduct.Single(ms => ms.id == new Guid(mem_saleproduct_id));
            mspI.mem_saleproduct = msp;

            var saleproduct = _context.saleproduct.Single(p => p.saleproduct_code == msp.saleproduct_code);
            mspI.saleproduct = saleproduct;

            mspI.saleproduct_type_code_hidden = saleproduct.saleproduct_type_code;
            mspI.aStoreQuantity = msp.store_quantity.ToString();

            mspI.delivery_post_hidden = msp.delivery_post;
            mspI.delivery_bus_hidden = msp.delivery_bus;
            mspI.delivery_train_hidden = msp.delivery_train;
            mspI.delivery_other_hidden = msp.delivery_other;

            mspI.product_detail_hidden = msp.product_detail;

            var mem_saleproduct_plans = _context.mem_saleproduct_plan.Where(mspp => mspp.member_code == member.member_code && mspp.saleproduct_code == msp.saleproduct_code);
            var sum_estimate_qty = 0; var count_period = 0;

            //string lyear = "";
            //List<string> lyearList = new List<string>();
            
            foreach (var mspp in mem_saleproduct_plans)
            {
                count_period++;
                sum_estimate_qty += mspp.estimate_qty;
                //if (!mspp.launch_year.Equals(lyear)) { lyear = mspp.launch_year; lyearList.Add(lyear); }
            }
            mspI.aAmountPerYear = sum_estimate_qty.ToString();
            mspI.aAmountOfPeriod = count_period.ToString();
            

            ViewBag.saleproduct_code = msp.saleproduct_code;
            ViewBag.aAmount = mspI.aAmountPerYear;

            ViewBag.product_group = new SelectList(_context.product_group, "product_group_code", "product_group_desc", saleproduct.saleproduct_group_code);

            ViewBag.saleproduct_unit = new SelectList(_context.saleproduct_unit, "saleproduct_unit_code", "saleproduct_unit_desc_thai", msp.saleproduct_unit_code);


            //lyearList.Sort();

            //List<SelectListItem> lyearSList = new List<SelectListItem>();
            //for(var i = 0; i < lyearList.LongCount(); i++)
            //{
            //    lyearSList.Add(new SelectListItem() { Value = lyearList[i], Text = lyearList[i] });
            //}
            //lyearSList.Insert(0, (new SelectListItem() { Value = "0", Text = "<ทั้งหมด>" }));
            //ViewBag.aYear = new SelectList(lyearSList.AsEnumerable(), "Value", "Text", "0");

            return View(mspI);
        }
    
        [HttpPost]
        public IActionResult Save(string memberId, string IsCreate, string saleproduct_code, string saleproduct_desc, string saleproduct_group_code, string saleproduct_type_code, string saleproduct_unit_code,
            string retail_price, string wholesale_price, string wholesale_condition, string product_life, string capacity_per_day, string capacity_per_month,
            string advance_order_condition, string store_quantity, string distribution_channels, string contact_email, string contact_telephone, string contact_other,
            string delivery_post, string delivery_bus, string delivery_train, string delivery_other, string product_detail, string x_note

        )
        {
            var member = _context.member.Single(m => m.id == new Guid(memberId));

            saleproduct sp = _context.saleproduct.Single(s => s.saleproduct_code == saleproduct_code);
            mem_saleproduct msp;
            if (IsCreate == "1")
            {
                msp = new mem_saleproduct();
                msp.member_code = member.member_code;
                msp.saleproduct_code = sp.saleproduct_code;


            } else
            {
                msp = _context.mem_saleproduct.Single(ms => ms.member_code == member.member_code && ms.saleproduct_code == saleproduct_code);


            }


            sp.saleproduct_desc = saleproduct_desc;
            sp.saleproduct_group_code = saleproduct_group_code;
            sp.saleproduct_type_code = saleproduct_type_code;
            sp.x_status = "Y";
            _context.Update(sp);


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

            msp.delivery_post = delivery_post;
            msp.delivery_bus = delivery_bus;
            msp.delivery_train = delivery_train;
            msp.delivery_other = delivery_other;

            msp.product_detail = product_detail;
            msp.x_note = x_note;

            msp.x_status = "Y";
            


            if (IsCreate == "1")
            {
                _context.Add(msp);
            }
            else
            {
                _context.Update(msp);
            }


            




            _context.SaveChanges();
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
