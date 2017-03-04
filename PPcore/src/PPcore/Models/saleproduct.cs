using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PPcore.Models
{
    public partial class saleproduct
    {
        //[Key]
        //[DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "รหัสผลิตภัณฑ์")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_code { get; set; }
        [Display(Name = "ประเภทผลิตภัณฑ์")]
        public string saleproduct_type_code { get; set; }
        [Display(Name = "กลุ่มผลิตภัณฑ์")]
        public string saleproduct_group_code { get; set; }
        [Display(Name = "ชื่อผลิตภัณฑ์")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_desc { get; set; }
        [Display(Name = "ลำดับ")]
        public int rec_no { get; set; }
        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }
        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
