using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace salon_api.Models
{
    public class login
    {
        public int id { get; set; }
        public string full_name { get; set; }
        public string user_name { get; set; }
        public int role_id { get; set; }
        public string role_name { get; set; }
        public string contact_no { get; set; }
        
    }
    public class UserToken
    {
        public string token { get; set; }
        public userDetails user_detail { get; set; }

        public UserToken(string _token, userDetails _user_detail)
        {
            token = _token;
            user_detail = _user_detail;
        }
    }
    public class userDetails 
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string gender { get; set; }
        public string mobile { get; set; }
    }


}
