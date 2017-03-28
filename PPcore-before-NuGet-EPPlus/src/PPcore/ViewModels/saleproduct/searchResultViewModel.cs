using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.saleproduct
{
    public class SearchResultViewModel
    {
        public string image_code { get; set; }

        public string saleproduct_code { get; set; }
        public string saleproduct_desc { get; set; }

        public string retail_price { get; set; }
    }
}
