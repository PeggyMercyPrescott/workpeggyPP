using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PPcore.Models
{
    public partial class mem_saleproduct_plan
    {
        public string member_code { get; set; }
        public string saleproduct_code { get; set; }

        [Display(Name = "วันที่ผลิตผลออกสู่ตลาด")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public DateTime launch_date { get; set; }
        public string launch_year { get; set; }
        [Display(Name = "งวดที่")]
        public int period_no { get; set; }

        [Display(Name = "จำนวนผลิตผล")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public int estimate_qty { get; set; }
        public int actual_qty { get; set; }


        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }

        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
