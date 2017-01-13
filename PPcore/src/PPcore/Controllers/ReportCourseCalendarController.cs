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
    public class ReportCourseCalendarController : Controller
    {
        private readonly PalangPanyaDBContext _context;

        public ReportCourseCalendarController(PalangPanyaDBContext context)
        {
            _context = context;    
        }

        // GET: ReportCourseCalendar
        public async Task<IActionResult> Index()
        {
            return View(await _context.project_course.ToListAsync());
        }

        // GET: ReportCourseCalendar/Details/5
        public async Task<IActionResult> Details(string? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project_course = await _context.project_course.SingleOrDefaultAsync(m => m.course_code == id);
            if (project_course == null)
            {
                return NotFound();
            }

            return View(project_course);
        }

        // GET: ReportCourseCalendar/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ReportCourseCalendar/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("course_code,active_member_join,budget,cgroup_code,charge_head,course_approve_date,course_begin,course_date,course_desc,course_end,ctype_code,id,passed_member,passed_score,project_code,project_manager,ref_doc,support_head,target_member_join,x_log,x_note,x_status")] project_course project_course)
        {
            if (ModelState.IsValid)
            {
                _context.Add(project_course);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(project_course);
        }

        // GET: ReportCourseCalendar/Edit/5
        public async Task<IActionResult> Edit(string? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project_course = await _context.project_course.SingleOrDefaultAsync(m => m.course_code == id);
            if (project_course == null)
            {
                return NotFound();
            }
            return View(project_course);
        }

        // POST: ReportCourseCalendar/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("course_code,active_member_join,budget,cgroup_code,charge_head,course_approve_date,course_begin,course_date,course_desc,course_end,ctype_code,id,passed_member,passed_score,project_code,project_manager,ref_doc,support_head,target_member_join,x_log,x_note,x_status")] project_course project_course)
        {
            if (id != project_course.course_code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(project_course);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!project_courseExists(project_course.course_code))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            return View(project_course);
        }

        // GET: ReportCourseCalendar/Delete/5
        public async Task<IActionResult> Delete(string? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var project_course = await _context.project_course.SingleOrDefaultAsync(m => m.course_code == id);
            if (project_course == null)
            {
                return NotFound();
            }

            return View(project_course);
        }

        // POST: ReportCourseCalendar/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var project_course = await _context.project_course.SingleOrDefaultAsync(m => m.course_code == id);
            _context.project_course.Remove(project_course);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool project_courseExists(string id)
        {
            return _context.project_course.Any(e => e.course_code == id);
        }
    }
}
