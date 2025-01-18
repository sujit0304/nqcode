using salon_api.Helper;
using salon_api.Models.Authentication;
using salon_api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using salon_api.Repositories;

namespace salon_api.BS
{
    public interface IUserAccessBS
    {
        Task<UserToken> Authenticate(UserCrentials userCrentials);
        Task<UserToken> AuthenticateVendor(UserCrentials userCrentials);
    }
    public class UserAccessBS : IUserAccessBS
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly DatabaseProvider databaseProvider;
        private MYSQLDBHelper getDB => databaseProvider.SqlInstance();
        public UserAccessBS(DatabaseProvider dbProvider, IWebHostEnvironment webHostEnvironment, IConfiguration configuration)
        {
            _configuration = configuration;
            _webHostEnvironment = webHostEnvironment;
            databaseProvider = dbProvider;
        }

        public async Task<UserToken> Authenticate(UserCrentials userCrentials)
        {
            try
            {
                using (var repos = new UserRepository(getDB, _webHostEnvironment, _configuration))
                {
                    return await repos.Authenticate(userCrentials);
                }

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<UserToken> AuthenticateVendor(UserCrentials userCrentials)
        {
            try
            {
                using (var repos = new UserRepository(getDB, _webHostEnvironment, _configuration))
                {
                    return await repos.AuthenticateVendor(userCrentials);
                }

            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
   }
