using salon_api.Helper;
using salon_api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace salon_api.Repositories
{
    public class ShopListRepository : GenericRepository
    {
        public ShopListRepository(MYSQLDBHelper sqlDBHelper) : base(sqlDBHelper)
        {

        }
      
        internal async Task<List<shoplist>> GetShopList(string location, string pincode)
        {
            string filter = "where ";
            if (location == "")
            {
                filter += "location =" + location;
            }
            if(pincode =="")
            {
                filter += "pincode =" + pincode;
            }
            string qry = "select id,vendor_id,shop_name,shop_address,landmark,pincode,latitude,longitute,shop_status,shop_image,contact_no,alt_contact,email,added_date from shop_list";
            List<shoplist> _ShopList = new List<shoplist>();
            try
            {
                _ShopList = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            }
            catch (Exception e)
            {
                string msg = "Exception due to : " + e.ToString();
                string finalMsg = "";
            }
            return _ShopList;
        }
        internal async Task<List<shoplist>> GetServiceDetails(int shopId)
        {
            
            string qry = "select * from services where vendor_id = "+ shopId;
            List<shoplist> _ShopList = new List<shoplist>();
            try
            {
                _ShopList = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            }
            catch (Exception e)
            {
                string msg = "Exception due to : " + e.ToString();
                string finalMsg = "";
            }
            return _ShopList;
        }
        internal async Task<List<shoplist>> GetSlotMaster()
        {

            string qry = "select * from booking_slot_master" ;
            List<shoplist> _ShopList = new List<shoplist>();
            try
            {
                _ShopList = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            }
            catch (Exception e)
            {
                string msg = "Exception due to : " + e.ToString();
                string finalMsg = "";
            }
            return _ShopList;
        }
        internal async Task<List<shoplist>> GetUserAppoinment(int UserId)
        {

            string qry = "select * from user_appoinments where userid="+UserId ;
            List<shoplist> _ShopList = new List<shoplist>();
            try
            {
                _ShopList = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            }
            catch (Exception e)
            {
                string msg = "Exception due to : " + e.ToString();
                string finalMsg = "";
            }
            return _ShopList;
        }
        internal async Task<List<shoplist>> AddShop(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal async Task<List<shoplist>> BookAppoinment(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }

        internal async Task<List<shoplist>> UpdateShopStatus(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal async Task<List<shoplist>> GetShopStatus(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal async Task<List<shoplist>> VerifyAppoinment(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal async Task<List<shoplist>> CancleAppoinment(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal async Task<List<shoplist>> RescheduleAppoinment(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<shoplist> user_detail = await Context.GetData<shoplist>(qry).ConfigureAwait(false);
            return user_detail;
        }
        internal Task<int> eQry(string qry)
        {
            throw new NotImplementedException();
        }
    }
}
