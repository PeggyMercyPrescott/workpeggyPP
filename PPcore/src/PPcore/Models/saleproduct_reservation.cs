using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PPcore.Models
{
    public partial class saleproduct_reservation
    {
        [HiddenInput]
        public string reservation_code { get; set; }

        public string saleproduct_code { get; set; }

        public int reservation_amount { get; set; }

        public string reservation_status { get; set; }

        public decimal down_payment { get; set; }

        public string is_retail_price { get; set; }

        public string is_member { get; set; }

        public string reserving_member_code { get; set; }

        public string reservation_note { get; set; }

        [Display(Name = "สร้างโดย")]
        public Guid CreatedBy { get; set; }

        [Display(Name = "วันที่สร้าง")]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd MMMM yyyy}")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "แก้ไขโดย")]
        public Guid EditedBy { get; set; }

        [Display(Name = "วันที่แก้ไข")]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd MMMM yyyy}")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        public DateTime EditedDate { get; set; }


        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }

        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
