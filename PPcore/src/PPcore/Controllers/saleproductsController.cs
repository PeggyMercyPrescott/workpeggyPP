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
    public class saleproductsController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public saleproductsController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        public IActionResult Search()
        {
            var pg = _context.product_group.Where(g => g.x_status == "Y").Select(g => new { Value = g.product_group_code, Text = g.product_group_desc }).ToList();
            pg.Insert(0, (new { Value = "0", Text = "<ทั้งหมด>" }));
            ViewBag.product_group = new SelectList(pg.AsEnumerable(), "Value", "Text", "0");

            return View();
        }
    }
}
