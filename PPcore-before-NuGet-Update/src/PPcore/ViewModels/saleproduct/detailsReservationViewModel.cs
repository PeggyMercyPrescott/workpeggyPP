using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.saleproduct
{
    public class detailsReservationViewModel
    {
        public string saleproduct_code { get; set; }
        [Display(Name = "ชื่อผลิตภัณฑ์")]
        public string saleproduct_desc { get; set; }
        [Display(Name = "จำนวน")]
        public int store_quantity { get; set; }
        [Display(Name = "จำนวนจอง")]
        public int reservation_amount { get; set; }
        [Display(Name = "คงเหลือ")]
        public int left_in_stock { get; set; }
        [Display(Name = "หน่วย")]
        public string saleproduct_unit { get; set; }
    }
}
