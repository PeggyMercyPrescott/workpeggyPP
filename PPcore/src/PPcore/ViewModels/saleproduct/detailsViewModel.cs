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

        public string retail_price { get; set; }
    }

    public class fotoramaData
    {
        public string img { get; set; }
        public string thumb { get; set; }
    }
}
