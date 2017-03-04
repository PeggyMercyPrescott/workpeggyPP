using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PPcore.Models
{
    public partial class mem_saleproduct
    {
        public string member_code { get; set; }
        public string saleproduct_code { get; set; }

        [Display(Name = "หน่วยนับ")]
        public string saleproduct_unit_code { get; set; }
        [Display(Name = "พร้อมจัดส่ง")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public int store_quantity { get; set; }
        [Display(Name = "ราคาขายปลีก")]
        public decimal retail_price { get; set; }
        [Display(Name = "ราคาขายส่ง")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public decimal wholesale_price { get; set; }
        [Display(Name = "เงื่อนไขสินค้าราคาส่ง")]
        public string wholesale_condition { get; set; }
        [Display(Name = "ระยะเวลาในการเก็บรักษา")]
        public string product_life { get; set; }
        [Display(Name = "กำลังการผลิตต่อวัน")]
        public string capacity_per_day { get; set; }
        [Display(Name = "กำลังการผลิตต่อเดือน")]
        public string capacity_per_month { get; set; }
        [Display(Name = "สั่งล่วงหน้า")]
        public string advance_order_condition { get; set; }
        [Display(Name = "ช่องทางในการจำหน่าย")]
        public string distribution_channels { get; set; }
        [Display(Name = "โทรศัพท์")]
        public string contact_telephone { get; set; }
        [Display(Name = "อีเมล")]
        public string contact_email { get; set; }
        [Display(Name = "อื่นๆ")]
        public string contact_other { get; set; }
        [Display(Name = "ส่งทางไปรษณีย์")]
        public string delivery_post { get; set; }
        [Display(Name = "ส่งทางรถบัส")]
        public string delivery_bus { get; set; }
        [Display(Name = "ส่งทางรถไฟ")]
        public string delivery_train { get; set; }
        [Display(Name = "ส่งทางอื่น")]
        public string delivery_other { get; set; }
        [Display(Name = "รายละเอียดสินค้า")]
        public string product_detail { get; set; }

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
