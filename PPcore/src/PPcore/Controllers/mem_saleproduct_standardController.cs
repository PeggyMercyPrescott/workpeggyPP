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
    public class mem_saleproduct_standardController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public mem_saleproduct_standardController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        [HttpPost]
        public async Task<IActionResult> Create(string memberId, string saleproduct_code, string saleproduct_standard_code)
        {
            member member = _context.member.Single(m => m.id == new Guid(memberId));
            var mspsC = _context.mem_saleproduct_standard.Where(m => (m.member_code == member.member_code) && (m.saleproduct_code == saleproduct_code) && (m.saleproduct_standard_code == saleproduct_standard_code)).Count();
            if (mspsC != 0)
            {
                return Json(new { result = "duplicate" });
            } else {
                var msps = new mem_saleproduct_standard();
                msps.member_code = member.member_code;
                msps.saleproduct_code = saleproduct_code;
                msps.saleproduct_standard_code = saleproduct_standard_code;

                _context.Add(msps);
                await _context.SaveChangesAsync();

                return Json(new { result = "success" });

            }




        }
    }
}
