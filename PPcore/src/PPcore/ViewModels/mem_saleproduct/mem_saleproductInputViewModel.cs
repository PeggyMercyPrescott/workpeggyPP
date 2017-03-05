using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.mem_saleproduct
{
    public class mem_saleproductInputViewModel
    {
        public int rec_no { get; set; }
        public Models.mem_saleproduct mem_saleproduct { get; set; }
        public Models.saleproduct saleproduct { get; set; }
        [Display(Name = "กลุ่มผลิตภัณฑ์")]
        public string saleproduct_group_desc { get; set; }
        [Display(Name = "ประเภทผลิตภัณฑ์")]
        public string saleproduct_type_desc { get; set; }
        [Display(Name = "จำนวน")]
        public int amount { get; set; }
        [Display(Name = "หน่วย")]
        public string unit { get; set; }
        [Display(Name = "จำนวนงวด")]
        public int amountOfPeriod { get; set; }
    }
}
