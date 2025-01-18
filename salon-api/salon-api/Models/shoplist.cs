using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace salon_api.Models
{
    public class shoplist
    {
        public int id { get; set; }
        public int vendor_id { get; set; }
        public string shop_name { get; set; }
        public string shop_address { get; set; }
        public string landmark { get; set; }
        public int pincode { get; set; }
        public string latitude { get; set; }
        public string longitute { get; set; }
        public int shop_status { get; set; }
        public string shop_image { get; set; }
        public string contact_no { get; set; }
        public string alt_contact { get; set; }
        public string email { get; set; }
        public dynamic added_date { get; set; }

    }
    


}
