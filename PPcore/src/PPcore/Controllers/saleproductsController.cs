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
                cStd += "<label class='checkbox-inline text-left'><input id='std_"+std.saleproduct_standard_code+"' type='checkbox' />"+std.saleproduct_standard_desc_thai+"</label><br />";
            }
            ViewBag.standard = cStd;

            return View();
        }

        [HttpPost]
        public IActionResult Search(string searchword)
        {
            List<saleproduct> sps;
            if (String.IsNullOrEmpty(searchword)) {
                sps = _context.saleproduct.Where(ssp => ssp.x_status == "Y").OrderBy(ssp => ssp.saleproduct_desc).ToList();
            } else {
                sps = _context.saleproduct.Where(ssp => ssp.x_status == "Y" && ssp.saleproduct_desc.Contains(searchword)).OrderBy(ssp => ssp.saleproduct_desc).ToList();
            }
            

            List<PPcore.ViewModels.saleproduct.SearchResultViewModel> sr = new List<ViewModels.saleproduct.SearchResultViewModel>();

            if (sps != null)
            {
                foreach (var sp in sps)
                {
                    var s = new PPcore.ViewModels.saleproduct.SearchResultViewModel();
                    s.saleproduct_code = sp.saleproduct_code;
                    s.saleproduct_desc = sp.saleproduct_desc;
                    
                    var msp = _context.mem_saleproduct.SingleOrDefault(mmsp => mmsp.saleproduct_code == sp.saleproduct_code);

                    var p = msp.retail_price;
                    var n =  p - Math.Truncate(p);
                    if (n > 0)
                    {
                        s.retail_price = String.Format("{0:n}", msp.retail_price);
                    }
                    else
                    {
                        s.retail_price = String.Format("{0:n0}", msp.retail_price);
                    }

                    var msis = _context.mem_saleproduct_image.Where(mmsi => mmsi.saleproduct_code == sp.saleproduct_code).OrderBy(mmsi => mmsi.saleproduct_code).ToList();
                    if (msis.Count() != 0) {
                        var msi = msis.First();
                        s.image_code = msi.saleproduct_image_code;
                    }
                    else
                    {
                        s.image_code = "MSTD6003090948370167483.jpg"; //std-blank.jpg
                    }


                    sr.Add(s);
                }


                string pjson = JsonConvert.SerializeObject(sr);
                return Json(pjson);
            }
            else
            {
                return Json("");
            }


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
    }
}
