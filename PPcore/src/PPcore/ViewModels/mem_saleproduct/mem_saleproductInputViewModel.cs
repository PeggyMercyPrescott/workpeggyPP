using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.mem_saleproduct
{
    public class mem_saleproductInputViewModel
    {
        public Models.mem_saleproduct mem_saleproduct { get; set; }
        public Models.saleproduct saleproduct { get; set; }

        [Display(Name = "จำนวน")]
        public string aAmount { get; set; }

        [Display(Name = "พร้อมจัดส่ง")]
        [Required(ErrorMessage = "กรุณากรอกข้อมูล")]
        public string aStoreQuantity { get; set; }

        [Display(Name = "ปี")]
        public string aYear { get; set; }
        [Display(Name = "จำนวนงวด")]
        public string aAmountOfPeriod { get; set; }
        [Display(Name = "จำนวนต่อปี")]
        public string aAmountPerYear { get; set; }
        [Display(Name = "หน่วย")]
        public string aUnit { get; set; }

    }
}
