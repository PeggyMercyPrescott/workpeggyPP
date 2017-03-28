using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PPcore.Models
{
    public partial class mem_saleproduct_image
    {
        public string member_code { get; set; }
        public string saleproduct_code { get; set; }
        public string saleproduct_image_code { get; set; }
    }
}
