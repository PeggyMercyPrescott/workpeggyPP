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
    public class ReportMembersController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public ReportMembersController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        private void prepareViewBag()
        {
            var mtc = _context.mem_testcenter.Where(mtcc => mtcc.x_status != "N").OrderBy(mtcc => mtcc.mem_testcenter_desc).Select(mtcc => new { Value = mtcc.mem_testcenter_code, Text = mtcc.mem_testcenter_desc }).ToList();
            //mtc.Insert(0, (new { Value = "0", Text = "" }));
            mtc.Insert(0, (new { Value = "0", Text = "ทั้งหมด" }));
            ViewBag.mem_testcenter_code = new SelectList(mtc.AsEnumerable(), "Value", "Text", "0");

            var ml = _context.mem_level.OrderBy(tt => tt.mlevel_code).Select(tt => new { Value = tt.mlevel_code, Text = tt.mlevel_desc }).ToList();
            //ml.Insert(0, (new { Value = "0", Text = "ทั้งหมด" }));
            ml.Insert(0, (new { Value = "", Text = "ทั้งหมด" }));
            ViewBag.mem_level = new SelectList(ml.AsEnumerable(), "Value", "Text", "");

            var ip = _context.ini_province.OrderBy(p => p.province_code).Select(p => new { Value = p.province_code, Text = p.pro_desc }).ToList();
            //ip.Insert(0, (new { Value = "0", Text = "ทั้งหมด" }));
            ip.Insert(0, (new { Value = "0", Text = "ทั้งหมด" }));
            ViewBag.ini_province = new SelectList(ip.AsEnumerable(), "Value", "Text", "0");
        }

        // GET: ReportMembers
        public async Task<IActionResult> Index()
        {
            prepareViewBag();
            ViewBag.countRecords = _context.project_course.Where(pc => pc.x_status != "N").Count();
            return View(await _context.member.ToListAsync());
        }

        [HttpGet]
        public IActionResult DetailsAsTable(string cgroup_code, string ctype_code)
        {
            var pp = _context.member.Where(ppp => (ppp.mem_role_id == new Guid("17822a90-1029-454a-b4c7-f631c9ca6c7d")) && (ppp.x_status != "N"))
                .Select(ppp => new { ppp.id, ppp.member_code, ppp.title, ppp.fname, ppp.lname, ppp.birthdate, ppp.age, ppp.cid_card, ppp.texta_address, ppp.textb_address, ppp.textc_address, ppp.tel, ppp.mobile, ppp.email, ppp.facebook, ppp.line, ppp.rowversion })
                .OrderByDescending(ppp => ppp.rowversion).ToList();
            ViewBag.countRecords = pp.Count();

            List<PPcore.ViewModels.member.MemberIndexViewModel> pl = new List<PPcore.ViewModels.member.MemberIndexViewModel>();
            foreach (var p in pp)
            {
                PPcore.ViewModels.member.MemberIndexViewModel pv = new PPcore.ViewModels.member.MemberIndexViewModel();
                pv.age = p.age;
                pv.birthdate = p.birthdate;
                pv.cid_card = p.cid_card;
                pv.email = p.email;
                pv.facebook = p.facebook;
                pv.fname = p.fname;
                pv.id = p.id;
                pv.line = p.line;
                pv.lname = p.lname;
                pv.member_code = p.member_code;
                pv.mobile = p.mobile;
                pv.rowversion = p.rowversion;
                pv.tel = p.tel;
                pv.texta_address = p.texta_address;
                pv.textb_address = p.textb_address;
                pv.textc_address = p.textc_address;
                pv.title = p.title;

                pl.Add(pv);
            }
            return View(pl);
        }


    }
}
