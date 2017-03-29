using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.mem_saleproduct_standard
{
    public class mem_saleproduct_standardViewModel
    {
        public string member_code { get; set; }
        public string saleproduct_code { get; set; }
        public string saleproduct_standard_code { get; set; }

        public string ref_image { get; set; }

        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }
        public byte[] rowversion { get; set; }


        public string saleproduct_standard_desc_thai { get; set; }

        public string saleproduct_standard_desc_eng { get; set; }

    }
}
