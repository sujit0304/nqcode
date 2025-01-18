using salon_api.Helper;
using salon_api.Models;
using salon_api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace salon_api.BS
{
    public interface IShopListBS
    {
        //Task<shoplist> GetShopList(string location, string pincode);
        Task<List<shoplist>> GetShopList(string location, string pincode);
        Task<List<shoplist>> GetServiceDetails(int shopId);
        Task<List<shoplist>> GetSlotMaster();
        Task<List<shoplist>> GetUserAppoinment(int userId);
        Task<List<shoplist>> AddShop(int userId);
        Task<List<shoplist>> BookAppoinment(int userId);
        Task<List<shoplist>> UpdateShopStatus(int userId);
        Task<List<shoplist>> GetShopStatus(int userId);
        Task<List<shoplist>> VerifyAppoinment(int userId);
        Task<List<shoplist>> CancleAppoinment(int userId);

        Task<List<shoplist>> RescheduleAppoinment(int userId);
        Task eQry(string qry);
    }
    public class ShopListBS : IShopListBS
    {
        private readonly DatabaseProvider databaseProvider;
        private MYSQLDBHelper getDB => databaseProvider.SqlInstance();
        public ShopListBS(DatabaseProvider dbProvider)
        {
            databaseProvider = dbProvider;
        }
     
        public async Task<List<shoplist>> GetShopList(string location, string pincode)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.GetShopList(location, pincode);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> GetServiceDetails(int shopId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.GetServiceDetails(shopId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> GetSlotMaster()
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.GetSlotMaster();

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> GetUserAppoinment(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.GetUserAppoinment(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> AddShop(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.AddShop(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> BookAppoinment(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.BookAppoinment(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> UpdateShopStatus(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.UpdateShopStatus(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> GetShopStatus(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.GetShopStatus(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> VerifyAppoinment(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.VerifyAppoinment(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> CancleAppoinment(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.CancleAppoinment(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<List<shoplist>> RescheduleAppoinment(int userId)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.RescheduleAppoinment(userId);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<int> eQry(string qry)
        {
            try
            {
                using (var repos = new ShopListRepository(getDB))
                {
                    return await repos.eQry(qry);

                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        Task IShopListBS.eQry(string qry)
        {
            throw new NotImplementedException();
        }
    }
}
