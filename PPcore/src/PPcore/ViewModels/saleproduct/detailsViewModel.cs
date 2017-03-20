using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PPcore.ViewModels.saleproduct
{
    public class detailsViewModel
    {
        public string breadcrumb { get; set; }
        public string images { get; set; }

        public List<fotoramaData> fotoramaDataList {get; set;}

        public string saleproduct_code { get; set; }
        public string saleproduct_desc { get; set; }

        public string total_quantity { get; set; }
        public string saleproduct_unit { get; set; }

        public string retail_price { get; set; }
        public string wholesale_price { get; set; }
        public string wholesale_condition { get; set; }

        public string advance_order_condition { get; set; }
        public string store_quantity { get; set; }


        public string product_life { get; set; }
        public string capacity_per_day { get; set; }
        public string capacity_per_month { get; set; }
        
        public string distribution_channels { get; set; }
        public string delivery { get; set; }


        public string contact_telephone { get; set; }
        public string contact_email { get; set; }
        public string contact_other { get; set; }

        public string standardUL { get; set; }

        public string product_detail { get; set; }
        public string x_note { get; set; }
    }

    public class fotoramaData
    {
        public string img { get; set; }
        public string thumb { get; set; }
    }
}
