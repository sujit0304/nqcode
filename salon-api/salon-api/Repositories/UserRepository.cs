using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using salon_api.Helper;
using salon_api.Models;
using salon_api.Models.Authentication;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.IO;


namespace salon_api.Repositories
{
    public class UserRepository: GenericRepository
    {
        private MYSQLDBHelper _conn;
        private readonly IConfiguration _configuration;
        private ErrorLog m_errorLog;
        //private RoleAccessRepository _roleAccessRepo;
        public UserRepository(MYSQLDBHelper sqlDBHelper, IWebHostEnvironment webHostEnvironment = null, IConfiguration configuration = null) : base(sqlDBHelper)
        {
            m_errorLog = new ErrorLog(webHostEnvironment);
            _configuration = configuration;
            _conn = sqlDBHelper;

            //_roleAccessRepo = new RoleAccessRepository(sqlDBHelper);
        }
        internal async Task<UserToken> Authenticate(UserCrentials userCrentials)
        {
            string myQuery = "SELECT id FROM user WHERE userid = '" + userCrentials.user_name + "' AND password = '" + userCrentials.password + "'";
            List<login> _List = await Context.GetData<login>(myQuery).ConfigureAwait(false);
            if (_List.Count == 0)
            {
                return null;
            }
            var user_id = _List[0].id;
            var key = _configuration.GetValue<string>("JwtConfig:Key");
            var keyBytes = Encoding.ASCII.GetBytes(key);

            var tokenHandler = new JwtSecurityTokenHandler();

            var tokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(new Claim[] {
                        new Claim(ClaimTypes.NameIdentifier, ""+user_id)
                    }),
                Expires = DateTime.UtcNow.AddMinutes(Constant.TOKEN_EXPIRATION_TIME),
                SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
            };

            userDetails userDetail = await GetUserDetail(user_id);
            var token = tokenHandler.CreateToken(tokenDescriptor);

            // Update token in db
            string logQuery = $"INSERT INTO user_token(token, tokenIssueTime, tokenExpiryTime, tokenRefreshCount, userid) " +
                $"VALUES ( '{tokenHandler.WriteToken(token)}', '{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}', '{DateTime.Now.AddMinutes((int)Constant.TOKEN_EXPIRATION_TIME).ToString("yyyy-MM-dd HH:mm:ss")}', 0, {user_id});";
            var updateResult = await Context.ExecuteNonQry<int>(logQuery).ConfigureAwait(false);
            //UserToken user_token = new UserToken(tokenHandler.WriteToken(token), userDetail);
            UserToken user_token = new UserToken(tokenHandler.WriteToken(token), userDetail);
            return user_token;
        }
        internal async Task<userDetails> GetUserDetail(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = "+user_id;

            List<userDetails> user_detail = await Context.GetData<userDetails>(qry).ConfigureAwait(false);
            return user_detail[0];
        }
        internal async Task<UserToken> AuthenticateVendor(UserCrentials userCrentials)
        {
            string myQuery = "SELECT id FROM user WHERE userid = '" + userCrentials.user_name + "' AND password = '" + userCrentials.password + "'";
            List<login> _List = await Context.GetData<login>(myQuery).ConfigureAwait(false);
            if (_List.Count == 0)
            {
                return null;
            }
            var user_id = _List[0].id;
            var key = _configuration.GetValue<string>("JwtConfig:Key");
            var keyBytes = Encoding.ASCII.GetBytes(key);

            var tokenHandler = new JwtSecurityTokenHandler();

            var tokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(new Claim[] {
                        new Claim(ClaimTypes.NameIdentifier, ""+user_id)
                    }),
                Expires = DateTime.UtcNow.AddMinutes(Constant.TOKEN_EXPIRATION_TIME),
                SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
            };

            userDetails userDetail = await GetVendorDetail(user_id);
            var token = tokenHandler.CreateToken(tokenDescriptor);

            // Update token in db
            string logQuery = $"INSERT INTO user_token(token, tokenIssueTime, tokenExpiryTime, tokenRefreshCount, userid) " +
                $"VALUES ( '{tokenHandler.WriteToken(token)}', '{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}', '{DateTime.Now.AddMinutes((int)Constant.TOKEN_EXPIRATION_TIME).ToString("yyyy-MM-dd HH:mm:ss")}', 0, {user_id});";
            var updateResult = await Context.ExecuteNonQry<int>(logQuery).ConfigureAwait(false);
            //UserToken user_token = new UserToken(tokenHandler.WriteToken(token), userDetail);
            UserToken user_token = new UserToken(tokenHandler.WriteToken(token), userDetail);
            return user_token;
        }
        internal async Task<userDetails> GetVendorDetail(int user_id)
        {
            // Pending - Include all the property listed in CMUserDetail Model
            string qry = "SELECT firstName,lastName,gender,mobile from user WHERE id = " + user_id;

            List<userDetails> user_detail = await Context.GetData<userDetails>(qry).ConfigureAwait(false);
            return user_detail[0];
        }
        
    }
}
