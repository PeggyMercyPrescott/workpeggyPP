using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PPcore.Models
{
    public partial class saleproduct_unit
    {
        [Display(Name = "หน่วยนับ")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_unit_code { get; set; }
        [Display(Name = "หน่วยนับ (ภาษาไทย)")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_unit_desc_thai { get; set; }
        [Display(Name = "หน่วยนับ (ภาษาอังกฤษ)")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_unit_desc_eng { get; set; }

        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }
        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
