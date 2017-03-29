using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PPcore.Models
{
    public partial class saleproduct_reservation
    {
        public string reservation_code { get; set; }

        public string saleproduct_code { get; set; }

        public int reservation_amount { get; set; }

        public string reservation_status { get; set; }

        public decimal down_payment { get; set; }

        public string is_retail_price { get; set; }

        public string is_member { get; set; }

        public string reserving_member_code { get; set; }

        public string reservation_note { get; set; }


        public string fname { get; set; }
        public string lname { get; set; }
        public string tel { get; set; }
        public string place_name { get; set; }
        public string building { get; set; }
        public string room { get; set; }
        public string h_no { get; set; }
        public string street { get; set; }
        public string subdistrict_code { get; set; }
        public string province_code { get; set; }
        public string floor { get; set; }
        public string village { get; set; }
        public string lot_no { get; set; }
        public string lane { get; set; }
        public string district_code { get; set; }
        public string zip_code { get; set; }


        public Guid CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid EditedBy { get; set; }
        public DateTime EditedDate { get; set; }


        public string x_status { get; set; }
        public string x_note { get; set; }
        public string x_log { get; set; }
        public Guid id { get; set; }

        public byte[] rowversion { get; set; }
    }
}
