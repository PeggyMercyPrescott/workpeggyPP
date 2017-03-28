using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using System.IO;
using System.Text;
using System.Globalization;
using OfficeOpenXml;
using Microsoft.AspNetCore.Hosting;

namespace PPcore.Controllers
{
    public class ReportMembersController : Controller
    {
        private readonly PalangPanyaDBContext _context;
        private IHostingEnvironment _env;

        public ReportMembersController(PalangPanyaDBContext context, IHostingEnvironment env)
        {
            _context = context;
            _env = env;
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
        public IActionResult DetailsAsTable(string mem_testcenter_code, string mem_level_code, string ini_province_code, string startdate, string enddate)
        {
            string sql = "SELECT * FROM member WHERE mem_role_id = {0} AND (x_status <> 'N' OR x_status IS NULL) ";
            if (mem_testcenter_code != "0") { sql += "AND mem_testcenter_code = '" + mem_testcenter_code + "' "; }
            if (mem_level_code != null) { sql += "AND mlevel_code = '" + mem_level_code + "' "; }
            if (ini_province_code != "0") { sql += "AND province_code = '" + ini_province_code + "' "; }

            if (startdate != null) { sql += "AND register_date >= '" + Helpers.Utils.ToSQLDate(startdate) + "' "; }
            if (enddate != null) { sql += "AND register_date <= '" + Helpers.Utils.ToSQLDate(enddate) + "' "; }

            sql += "ORDER BY rowversion DESC";

            var pp = _context.member.FromSql(sql,new Guid("17822a90-1029-454a-b4c7-f631c9ca6c7d")).ToList();

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

        //public FileStreamResult DetailsAsExcel(string mem_testcenter_code, string mem_level_code, string ini_province_code, string startdate, string enddate)
        //{
        //    string sql = "SELECT * FROM member WHERE mem_role_id = {0} AND (x_status <> 'N' OR x_status IS NULL) ";
        //    if (mem_testcenter_code != "0") { sql += "AND mem_testcenter_code = '" + mem_testcenter_code + "' "; }
        //    if (mem_level_code != null) { sql += "AND mlevel_code = '" + mem_level_code + "' "; }
        //    if (ini_province_code != "0") { sql += "AND province_code = '" + ini_province_code + "' "; }

        //    if (startdate != null) { sql += "AND register_date >= '" + Helpers.Utils.ToSQLDate(startdate) + "' "; }
        //    if (enddate != null) { sql += "AND register_date <= '" + Helpers.Utils.ToSQLDate(enddate) + "' "; }

        //    sql += "ORDER BY rowversion DESC";

        //    var pp = _context.member.FromSql(sql, new Guid("17822a90-1029-454a-b4c7-f631c9ca6c7d")).ToList();

        //    ViewBag.countRecords = pp.Count();

        //    List<PPcore.ViewModels.member.MemberIndexViewModel> pl = new List<PPcore.ViewModels.member.MemberIndexViewModel>();
        //    foreach (var p in pp)
        //    {
        //        PPcore.ViewModels.member.MemberIndexViewModel pv = new PPcore.ViewModels.member.MemberIndexViewModel();
        //        pv.age = p.age;
        //        pv.birthdate = p.birthdate;
        //        pv.cid_card = p.cid_card;
        //        pv.email = p.email;
        //        pv.facebook = p.facebook;
        //        pv.fname = p.fname;
        //        pv.id = p.id;
        //        pv.line = p.line;
        //        pv.lname = p.lname;
        //        pv.member_code = p.member_code;
        //        pv.mobile = p.mobile;
        //        pv.rowversion = p.rowversion;
        //        pv.tel = p.tel;
        //        pv.texta_address = p.texta_address;
        //        pv.textb_address = p.textb_address;
        //        pv.textc_address = p.textc_address;
        //        pv.title = p.title;

        //        pl.Add(pv);
        //    }
        //    //return View(pl);


        //    string level = "ทุกระดับ"; string testcenter = "ทั้งหมด"; string province = "ทั้งหมด"; string fromdate = "-"; string todate = "-";
        //    if (mem_testcenter_code != "0") { var mt = _context.mem_testcenter.SingleOrDefault(mtt => mtt.mem_testcenter_code == mem_testcenter_code); testcenter = mt.mem_testcenter_desc; }
        //    if (mem_level_code != null) { var ml = _context.mem_level.SingleOrDefault(mll => mll.mlevel_code == mem_level_code); level = ml.mlevel_desc; }
        //    if (ini_province_code != "0") { var pv = _context.ini_province.SingleOrDefault(pvv => pvv.province_code == ini_province_code); province = pv.pro_desc; }

        //    if (startdate != null) { fromdate = String.Format("{0:d MMMM yyyy}", DateTime.ParseExact(Helpers.Utils.ToSQLDate(startdate),"yyyyMMdd", CultureInfo.InvariantCulture)); }
        //    if (enddate != null) { todate = String.Format("{0:d MMMM yyyy}", DateTime.ParseExact(Helpers.Utils.ToSQLDate(enddate), "yyyyMMdd", CultureInfo.InvariantCulture)); }

        //    string textdata = "รายชื่อผู้สมัครเข้าอบรมโครงการพลังปัญญา " + level + " \n";
        //    textdata += "สนามสอบ: " + testcenter + ",จังหวัด: " + province;
        //    textdata += ",ระหว่างวันที่ "+fromdate+" ถึง "+todate+"\n";
        //    textdata += "จำนวน " + ViewBag.countRecords + " คน\n";
        //    textdata += "ลำดับ,รหัสสมาชิก,คำนำหน้า,ชื่อ-สกุล,อายุ,เลขบัตรประชาชน,ที่อยู่,หมายเลขโทรศัพท์มือถือ,หมายเลขโทรศัพท์บ้าน,อีเมล\n";
        //    int count = 0;
        //    foreach (var p in pl)
        //    {
        //        textdata += ++count + "," + p.member_code + "," + p.title + "," + p.fname + " " + p.lname + "," + p.age + "," + p.cid_card + "," + p.texta_address + " " + p.textb_address + " " + p.textc_address + "," + p.mobile + "," + p.tel + "," + p.email + "\n";
        //    }

        //    byte[] byteRes = Encoding.UTF8.GetBytes(textdata);
        //    var byteResPreamble = Encoding.UTF8.GetPreamble().Concat(byteRes).ToArray();

        //    MemoryStream ms = new MemoryStream(byteResPreamble, 0, byteResPreamble.Length);
        //    //FileStreamResult result = new FileStreamResult(ms, "application/vnd.ms-excel");
        //    FileStreamResult result = new FileStreamResult(ms, "application/csv");
        //    result.FileDownloadName = "member-" + String.Format("{0:yyMMddhhmmssfffffff}", DateTime.Now) + ".csv";
        //    return result;
        //}


        public FileStreamResult DetailsAsExcel(string mem_testcenter_code, string mem_level_code, string ini_province_code, string startdate, string enddate)
        {
            string sql = "SELECT * FROM member WHERE mem_role_id = {0} AND (x_status <> 'N' OR x_status IS NULL) ";
            if (mem_testcenter_code != "0") { sql += "AND mem_testcenter_code = '" + mem_testcenter_code + "' "; }
            if (mem_level_code != null) { sql += "AND mlevel_code = '" + mem_level_code + "' "; }
            if (ini_province_code != "0") { sql += "AND province_code = '" + ini_province_code + "' "; }

            if (startdate != null) { sql += "AND register_date >= '" + Helpers.Utils.ToSQLDate(startdate) + "' "; }
            if (enddate != null) { sql += "AND register_date <= '" + Helpers.Utils.ToSQLDate(enddate) + "' "; }

            sql += "ORDER BY rowversion DESC";

            var pp = _context.member.FromSql(sql, new Guid("17822a90-1029-454a-b4c7-f631c9ca6c7d")).ToList();

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
            //return View(pl);


            string level = "ทุกระดับ"; string testcenter = "ทั้งหมด"; string province = "ทั้งหมด"; string fromdate = "-"; string todate = "-";
            if (mem_testcenter_code != "0") { var mt = _context.mem_testcenter.SingleOrDefault(mtt => mtt.mem_testcenter_code == mem_testcenter_code); testcenter = mt.mem_testcenter_desc; }
            if (mem_level_code != null) { var ml = _context.mem_level.SingleOrDefault(mll => mll.mlevel_code == mem_level_code); level = ml.mlevel_desc; }
            if (ini_province_code != "0") { var pv = _context.ini_province.SingleOrDefault(pvv => pvv.province_code == ini_province_code); province = pv.pro_desc; }

            if (startdate != null) { fromdate = String.Format("{0:d MMMM yyyy}", DateTime.ParseExact(Helpers.Utils.ToSQLDate(startdate), "yyyyMMdd", CultureInfo.InvariantCulture)); }
            if (enddate != null) { todate = String.Format("{0:d MMMM yyyy}", DateTime.ParseExact(Helpers.Utils.ToSQLDate(enddate), "yyyyMMdd", CultureInfo.InvariantCulture)); }

            var reportTemplate = Path.Combine(_env.WebRootPath, "templates/ReportMembers.xlsx");
            FileInfo tpm = new FileInfo(reportTemplate);
            MemoryStream ms;
            using (var package = new ExcelPackage(tpm))
            {
                var worksheet = package.Workbook.Worksheets[1];
                //var worksheet = package.Workbook.Worksheets.Add("รายชื่อผู้สมัครเข้าอบรม");

                worksheet.SetValue(1, 1, "รายชื่อผู้สมัครเข้าอบรมโครงการพลังปัญญา " + level);
                worksheet.SetValue(2, 1, "สนามสอบ: " + testcenter + "  จังหวัด: " + province + "  ระหว่างวันที่ " + fromdate + " ถึง " + todate);
                worksheet.SetValue(3, 1, "จำนวน " + ViewBag.countRecords + " คน");

                int count = 0; int row = 0;
                foreach (var p in pl)
                {
                    count++; row = 4 + count;
                    worksheet.SetValue(row, 1, count);
                    worksheet.SetValue(row, 2, p.member_code);
                    worksheet.SetValue(row, 3, p.title);
                    worksheet.SetValue(row, 4, p.fname + " " + p.lname);
                    worksheet.SetValue(row, 5, p.age);
                    //worksheet.SetValue(row, 6, p.cid_card);
                    worksheet.SetValue(row, 6, p.texta_address + " " + p.textb_address + " " + p.textc_address);
                    worksheet.SetValue(row, 7, p.mobile);
                    worksheet.SetValue(row, 8, p.tel);
                    worksheet.SetValue(row, 9, p.email);
                }

                ms = new MemoryStream(package.GetAsByteArray());
            }

            //new ExcelPackage(()

            FileStreamResult result = new FileStreamResult(ms, "application/vnd.ms-excel");
            //FileStreamResult result = new FileStreamResult(ms, "application/csv");
            result.FileDownloadName = "member-" + String.Format("{0:yyMMddhhmmssfffffff}", DateTime.Now) + ".xlsx";
            return result;
        }



    }
}
