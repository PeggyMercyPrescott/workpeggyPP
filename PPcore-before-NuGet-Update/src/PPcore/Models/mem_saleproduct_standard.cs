using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PPcore.Models
{
    public partial class mem_saleproduct_standard
    {
        public string member_code { get; set; }
        public string saleproduct_code { get; set; }
        public string saleproduct_standard_code { get; set; }

        public string ref_image { get; set; }

        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }

        [HiddenInput]
        public byte[] rowversion { get; set; }
    }
}
