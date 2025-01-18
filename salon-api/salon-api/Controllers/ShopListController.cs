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
    public class ShopListController: ControllerBase
    {
        private readonly IShopListBS _IShopListBs;
        public ShopListController(IShopListBS shopBs)
        {
            _IShopListBs = shopBs;
        }
        [Route("GetShopList")]
        [HttpGet]
        public async Task<IActionResult> GetShopList(string location, string pincode)
        {
            try
            {

                var data = await _IShopListBs.GetShopList(location, pincode);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("GetServiceDetails")]
        [HttpGet]
        public async Task<IActionResult> GetServiceDetails(int shopId)
        {
            try
            {

                var data = await _IShopListBs.GetServiceDetails(shopId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("GetSlotMaster")]
        [HttpGet]
        public async Task<IActionResult> GetSlotMaster()
        {
            try
            {

                var data = await _IShopListBs.GetSlotMaster();
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("GetUserAppoinment")]
        [HttpGet]
        public async Task<IActionResult> GetUserAppoinment(int userId)
        {
            try
            {

                var data = await _IShopListBs.GetUserAppoinment(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("AddShop")]
        [HttpGet]
        public async Task<IActionResult> AddShop(int userId)
        {
            try
            {

                var data = await _IShopListBs.AddShop(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("UpdateShopStatus")]
        [HttpGet]
        public async Task<IActionResult> UpdateShopStatus(int userId)
        {
            try
            {

                var data = await _IShopListBs.UpdateShopStatus(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("GetShopStatus")]
        [HttpGet]
        public async Task<IActionResult> GetShopStatus(int userId)
        {
            try
            {

                var data = await _IShopListBs.GetShopStatus(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("BookAppoinment")]
        [HttpGet]
        public async Task<IActionResult> BookAppoinment(int userId)
        {
            try
            {

                var data = await _IShopListBs.BookAppoinment(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("VerifyAppoinment")]
        [HttpGet]
        public async Task<IActionResult> VerifyAppoinment(int userId)
        {
            try
            {

                var data = await _IShopListBs.VerifyAppoinment(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("CancleAppoinment")]
        [HttpGet]
        public async Task<IActionResult> CancleAppoinment(int userId)
        {
            try
            {

                var data = await _IShopListBs.CancleAppoinment(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
        [Route("BookAppoinment")]
        [HttpGet]
        public async Task<IActionResult> RescheduleAppoinment(int userId)
        {
            try
            {

                var data = await _IShopListBs.RescheduleAppoinment(userId);
                return Ok(data);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [Route("eQry/{qry}")]
        [HttpGet]
        public async Task<IActionResult> eQry(string qry)
        {
            try
            {
                //var data = await _IShopListBs.eQry(qry);
                return null;

            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

    }
}
