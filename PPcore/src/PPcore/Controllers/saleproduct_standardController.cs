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
    public class saleproduct_standardController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public saleproduct_standardController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.saleproduct_standard.ToListAsync());
        }

        public IActionResult DetailsAsTableList()
        {
            var ss = _context.saleproduct_standard.Where(s => s.x_status == "Y").ToList();
            return View(ss);
            //return View(new saleproduct_standard());
        }

        //[HttpGet]
        //public IActionResult DetailsAsJsonList(string product_group_code, string product_type_code, string pattern)
        //{
        //    if ((product_type_code == null) || (product_group_code == null))
        //    {
        //        return NotFound();
        //    }
        //    var cProd = _context.product.Where(pr => (pr.product_group_code == product_group_code) && (pr.product_type_code == product_type_code) && (pr.x_status == "Y"));
        //    if (pattern != null)
        //    {
        //        pattern = pattern.Trim();
        //        if (pattern != "")
        //        {
        //            cProd = cProd.Where(pr => pr.product_desc.Contains(pattern));
        //        }
        //    }
        //    var products = cProd.OrderBy(pr => pr.rec_no).ToList();
        //    if (products == null)
        //    {
        //        return NotFound();
        //    }
        //    List<productItem> p = new List<productItem>();
        //    foreach (var product in products)
        //    {
        //        p.Add(new productItem { rec_no = product.rec_no, product_code = product.product_code, product_desc = product.product_desc, id = product.id.ToString() });
        //    }
        //    string pjson = JsonConvert.SerializeObject(p);
        //    return Json(pjson);
        //}

        public IActionResult Create()
        {
            return View();
        }

        public IActionResult Edit(string saleproduct_standard_code)
        {
            var sps = _context.saleproduct_standard.SingleOrDefault(s => s.saleproduct_standard_code == saleproduct_standard_code);
            return View(sps);
        }

        [HttpPost]
        public async Task<IActionResult> Save(string saleproduct_standard_code, string saleproduct_standard_desc_thai, string saleproduct_standard_desc_eng)
        {
            if (!String.IsNullOrEmpty(saleproduct_standard_code))
            {
                saleproduct_standard_code = saleproduct_standard_code.Trim(); saleproduct_standard_desc_thai = saleproduct_standard_desc_thai.Trim(); //saleproduct_standard_desc_eng = saleproduct_standard_desc_eng.Trim();
                var sps = _context.saleproduct_standard.SingleOrDefault(s => s.saleproduct_standard_code == saleproduct_standard_code);
                sps.saleproduct_standard_desc_thai = saleproduct_standard_desc_thai;
                sps.saleproduct_standard_desc_eng = !String.IsNullOrEmpty(saleproduct_standard_desc_eng) ? saleproduct_standard_desc_eng : "";
                _context.Update(sps);
                await _context.SaveChangesAsync();
            }
            else
            {
                var sps = new saleproduct_standard();
                sps.saleproduct_standard_code = "SPS" + DateTime.Now.ToString("yyMMddHHmmssfffffff"); ;
                sps.saleproduct_standard_desc_thai = saleproduct_standard_desc_thai;
                sps.saleproduct_standard_desc_eng = !String.IsNullOrEmpty(saleproduct_standard_desc_eng)?saleproduct_standard_desc_eng:"";
                sps.x_status = "Y";
                _context.Add(sps);
                await _context.SaveChangesAsync();

            }



            return Json(new { result = "success" });
        }

    }
}
