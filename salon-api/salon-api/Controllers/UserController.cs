using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using salon_api.BS;
using salon_api.Models.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace salon_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUserAccessBS _userAccessBs;
        public UserController(IUserAccessBS userBs)
        {
            _userAccessBs = userBs;
        }
        [AllowAnonymous]
        [Route("Authenticate")]
        [EnableCors("AllowSpecificOrigin")]
        [HttpPost]
        public async Task<IActionResult> Authenticate([FromForm] UserCrentials credential)
        {
            try
            {
                var data = await _userAccessBs.Authenticate(credential);
                if (data == null)
                    return Unauthorized();
                return Ok(data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error" +ex.ToString());
            }
        }
        [AllowAnonymous]
        [Route("AuthenticateVendor")]
        [HttpPost]
        public async Task<IActionResult> AuthenticateVendor([FromForm] UserCrentials credential)
        {
            try
            {
                var data = await _userAccessBs.AuthenticateVendor(credential);
                if (data == null)
                    return Unauthorized();
                return Ok(data);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
