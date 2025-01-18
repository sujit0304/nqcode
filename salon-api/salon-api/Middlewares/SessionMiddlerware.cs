using Microsoft.AspNetCore.Builder.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using System;
using System.Linq;
using Microsoft.AspNetCore.Routing;
using System.IO;
using MySql.Data.MySqlClient;
using salon_api.Helper;
using System.Data.Common;
using System.Data;
using Microsoft.Extensions.Configuration;
using salon_api.Models.Utils;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data.SqlClient;



namespace CMMSAPIs.Middlewares
{
    public class SessionMiddlerware
    {
        private readonly RequestDelegate _next;

        public CorsMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            context.Response.Headers.Add("Access-Control-Allow-Origin", "http://localhost:8100");
            context.Response.Headers.Add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
            context.Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, Authorization");
            if (context.Request.Method == "OPTIONS")
            {
                context.Response.StatusCode = 204; // No Content
                return;
            }
            await _next(context);
        }
    }
}
