using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.saleproduct_reservation
{
    public class inputViewModel
    {
        [HiddenInput]
        public string reservation_code { get; set; }
        [HiddenInput]
        public string saleproduct_code { get; set; }
        [Display(Name = "ชื่อผลิตภัณฑ์")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string saleproduct_desc { get; set; }
        [Display(Name = "จำนวนที่จอง")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string reservation_amount { get; set; }
        [Display(Name = "สถานะ")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string reservation_status { get; set; }
        [Display(Name = "จำนวนเงินที่จ่าย")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string down_payment { get; set; }

        public string is_retail_price { get; set; }

        public string is_member { get; set; }



        public string reserving_member_code { get; set; }
        [Display(Name = "ชื่อ")]
        public string fname { get; set; }
        [Display(Name = "นามสกุล")]
        public string lname { get; set; }
        [Display(Name = "เบอร์โทรศัพท์")]
        public string tel { get; set; }



        [Display(Name = "ชื่อสถานที่")]
        public string place_name { get; set; }
        [Display(Name = "อาคาร")]
        public string building { get; set; }
        [Display(Name = "เลขที่ห้อง")]
        public string room { get; set; }
        [Display(Name = "บ้านเลขที่")]
        public string h_no { get; set; }
        [Display(Name = "ถนน")]
        public string street { get; set; }
        [Display(Name = "ตำบล / แขวง")]
        public string subdistrict_code { get; set; }
        [Display(Name = "จังหวัด")]
        public string province_code { get; set; }

        [Display(Name = "ชั้น")]
        public string floor { get; set; }
        [Display(Name = "หมู่บ้าน")]
        public string village { get; set; }
        [Display(Name = "หมู่ที่")]
        public string lot_no { get; set; }
        [Display(Name = "ตรอก / ซอย")]
        public string lane { get; set; }
        [Display(Name = "อำเภอ")]
        public string district_code { get; set; }
        [Display(Name = "รหัสไปรษณีย์")]
        public string zip_code { get; set; }


        [Display(Name = "หมายเหตุ")]
        public string reservation_note { get; set; }

        [Display(Name = "จองโดย")]
        [HiddenInput]
        public Guid CreatedBy { get; set; }

        [Display(Name = "วันที่ทำรายการจอง")]
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
