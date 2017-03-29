using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Newtonsoft.Json;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Http;
using Microsoft.Net.Http.Headers;
using System.IO;

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
                msps.ref_image = "std-blank.jpg";
                msps.x_status = "Y";
                _context.Add(msps);
                await _context.SaveChangesAsync();

                return Json(new { result = "success" });

            }




        }

        public IActionResult DetailsAsJson(string memberId, string saleproduct_code)
        {
            member member = _context.member.Single(m => m.id == new Guid(memberId));
            var mspss = _context.mem_saleproduct_standard.Where(m => (m.member_code == member.member_code) && (m.saleproduct_code == saleproduct_code) && (m.x_status == "Y")).ToList();

            List<PPcore.ViewModels.mem_saleproduct_standard.mem_saleproduct_standardViewModel> vs = new List<ViewModels.mem_saleproduct_standard.mem_saleproduct_standardViewModel>();

            if (mspss != null)
            {
                foreach(var ms in mspss)
                {
                    var v = new PPcore.ViewModels.mem_saleproduct_standard.mem_saleproduct_standardViewModel();
                    v.member_code = ms.member_code;
                    v.saleproduct_code = ms.saleproduct_code;
                    v.saleproduct_standard_code = ms.saleproduct_standard_code;
                    v.x_status = ms.x_status;
                    v.ref_image = ms.ref_image;
                    v.id = ms.id;

                    var sps = _context.saleproduct_standard.SingleOrDefault(s => s.saleproduct_standard_code == ms.saleproduct_standard_code);
                    v.saleproduct_standard_desc_eng = sps.saleproduct_standard_desc_eng;
                    v.saleproduct_standard_desc_thai = sps.saleproduct_standard_desc_thai;

                    vs.Add(v);
                }


                string pjson = JsonConvert.SerializeObject(vs);
                return Json(pjson);
            } else
            {
                return Json("");
            }


        }

        [HttpPost]
        public async Task<IActionResult> uploadImage(ICollection<IFormFile> fileImage, string member_code, string saleproduct_code, string saleproduct_standard_code) {
            var fileName = ""; var fileExt = "";
            foreach (var file in fileImage)
            {
                if (file.Length > 0)
                {
                    fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    fileExt = Path.GetExtension(fileName);

                    fileName = fileName.Substring(0, fileName.Length - fileExt.Length);
                    fileName = fileName.Substring(0, (fileName.Length <= (50 - fileExt.Length) ? fileName.Length : (50 - fileExt.Length))) + fileExt;

                    pic_image m = new pic_image();
                    m.image_code = "MSTD" + DateTime.Now.ToString("yyMMddhhmmssfffffff") + fileExt;
                    m.x_status = "Y";
                    m.image_name = fileName;
                    string base64String = "";

                    using (var SourceStream = file.OpenReadStream())
                    {
                        using (System.Drawing.Image image = System.Drawing.Image.FromStream(SourceStream))
                        {
                            using (MemoryStream mem = new MemoryStream())
                            {
                                image.Save(mem, image.RawFormat);
                                byte[] imageBytes = mem.ToArray();
                                base64String = Convert.ToBase64String(imageBytes);
                            }
                        }
                    }

                    m.image_file = base64String;
                    m.ref_doc_type = "mem_saleproduct_standard";
                    m.ref_doc_code = saleproduct_standard_code;
                    fileName = m.image_code;
                    _context.pic_image.Add(m);

                    var msps = _context.mem_saleproduct_standard.SingleOrDefault(u => u.member_code == member_code && u.saleproduct_code == saleproduct_code && u.saleproduct_standard_code == saleproduct_standard_code);
                    msps.ref_image = fileName;
                    _context.Update(msps);

                    await _context.SaveChangesAsync();
                }
            }
            return Json(new { result = "success", fileName = fileName });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(string member_code, string saleproduct_code, string saleproduct_standard_code)
        {
            var msps = _context.mem_saleproduct_standard.SingleOrDefault(m => (m.member_code == member_code) && (m.saleproduct_code == saleproduct_code) && (m.saleproduct_standard_code == saleproduct_standard_code));
            _context.Remove(msps);
            await _context.SaveChangesAsync();

            return Json(new { result = "success" });
        }








    }
}
