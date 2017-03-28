using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Net.Http.Headers;
using System.IO;
using Newtonsoft.Json;

namespace PPcore.Controllers
{
    public class mem_saleproduct_imageController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public mem_saleproduct_imageController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        [HttpPost]
        public async Task<IActionResult> uploadImage(ICollection<IFormFile> fileImage, string memberId, string saleproduct_code)
        {
            member member = _context.member.SingleOrDefault(mm => mm.id == new Guid(memberId));
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
                    m.image_code = "MSP" + DateTime.Now.ToString("yyMMddhhmmssfffffff") + fileExt;
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
                    m.ref_doc_type = "mem_saleproduct_image";
                    m.ref_doc_code = saleproduct_code;
                    fileName = m.image_code;
                    _context.pic_image.Add(m);

                    var mspi = new mem_saleproduct_image();
                    mspi.member_code = member.member_code;
                    mspi.saleproduct_code = saleproduct_code;
                    mspi.saleproduct_image_code = fileName;
                    _context.Add(mspi);

                    await _context.SaveChangesAsync();
                }
            }
            return Json(new { result = "success", fileName = fileName });
        }

        public IActionResult DetailsAsJson(string memberId, string saleproduct_code)
        {
            member member = _context.member.Single(m => m.id == new Guid(memberId));
            var mspis = _context.mem_saleproduct_image.Where(m => (m.member_code == member.member_code) && (m.saleproduct_code == saleproduct_code)).ToList();

            string pjson = JsonConvert.SerializeObject(mspis);
            return Json(pjson);
            

        }

        [HttpPost]
        public async Task<IActionResult> Delete(string member_code, string saleproduct_code, string saleproduct_image_code)
        {
            var mspi = _context.mem_saleproduct_image.SingleOrDefault(m => (m.member_code == member_code) && (m.saleproduct_code == saleproduct_code) && (m.saleproduct_image_code == saleproduct_image_code));

            var pi = _context.pic_image.SingleOrDefault(p => p.image_code == mspi.saleproduct_image_code);
            _context.Remove(pi);

            _context.Remove(mspi);
            await _context.SaveChangesAsync();

            return Json(new { result = "success" });
        }

    }
}
