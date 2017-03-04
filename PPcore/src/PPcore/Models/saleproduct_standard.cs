using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PPcore.Models
{
    public partial class saleproduct_standard
    {
        public string saleproduct_standard_code { get; set; }
        [Display(Name = "การรับรองมาตรฐาน (ภาษาไทย)")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_standard_desc_thai { get; set; }
        [Display(Name = "การรับรองมาตรฐาน (ภาษาอังกฤษ)")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_standard_desc_eng { get; set; }

        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }
        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
