using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PPcore.Models;
using Newtonsoft.Json;
using System.Globalization;

namespace PPcore.Controllers
{
    public class ReportCourseCalendarController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public ReportCourseCalendarController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult getCalendarEvents(long cstart, long cend)
        {
            System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            cstart *= 1000; cend *= 1000;
            DateTime tdate = dtDateTime.AddMilliseconds(cstart);
            DateTime dstart = new DateTime(tdate.Year, tdate.Month, tdate.Day);
            tdate = dtDateTime.AddMilliseconds(cend);
            DateTime dend = new DateTime(tdate.Year, tdate.Month, tdate.Day);

            var culture = CultureInfo.CreateSpecificCulture("en-US");

            var pcs = _context.project_course.Where(cc => cc.x_status == "Y" && cc.course_begin <= dend && (cc.course_end >= dstart || cc.course_end == null)).ToList();
            List<calEvent> ces = new List<calEvent>();
            foreach(var pc in pcs)
            {
                calEvent ce = new calEvent();
                ce.title = pc.course_desc;
                ce.start = String.Format(culture,"{0:yyyy-MM-dd}", pc.course_begin);
                DateTime dcend = (pc.course_end.HasValue)?((DateTime)pc.course_end).AddDays(1):((DateTime)pc.course_begin);
                ce.end = dcend.ToString("yyyy-MM-dd", culture);
                ce.url = "#";
                ces.Add(ce);
            }

            string pjson = JsonConvert.SerializeObject(ces);
            return Json(pjson);
        }

        private class calEvent
        {
            public string id { get; set; }
            public string title { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            public string url { get; set; }
        }

    }
}
