using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.Helpers
{
    public static class HtmlHelpers
    {
        public static SelectList x_status_SelectList(this IHtmlHelper htmlHelper)
        {
            return new SelectList(new[] { new { Value = "Y", Text = "ใช้งานอยู่" }, new { Value = "N", Text = "ไม่ใช้แล้ว" } }, "Value", "Text", "Y");
        }

        public static string x_status_text(this IHtmlHelper htmlHelper, string v)
        {
            if (v == "Y") { return "ใช้งานอยู่"; }
            else if (v == "N") { return "ไม่ใช้แล้ว"; }
            return "not identified";
        }

        public static string education_degree_text(this IHtmlHelper htmlHelper, string v)
        {
            string res = "";
            switch (v)
            {
                case "340": res = "ปริญญาเอก"; break;
                case "330": res = "ปริญญาโท"; break;

                case "320": res = "ปริญญาตรี"; break;
                case "310": res = "อนุปริญญา"; break;
                case "240": res = "ปวส"; break;
                case "230": res = "ปวช"; break;
                case "220": res = "มัธยมศึกษาตอนปลาย"; break;
                case "210": res = "มัธยมศึกษาตอนต้น"; break;
                case "101": res = "ประถมศึกษา"; break;
            }
            return res;

        }

    }
}
