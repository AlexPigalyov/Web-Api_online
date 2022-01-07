using Microsoft.AspNetCore.Http;
using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Middlewares
{
    public class ExceptionHandlerMiddleware
    {
        private RequestDelegate _next;
        private ExceptionsRepository _exceptionsRepository;

        public ExceptionHandlerMiddleware(RequestDelegate next,
            ExceptionsRepository exceptionsRepository)
        {
            _next = next;
            _exceptionsRepository = exceptionsRepository;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next.Invoke(context);
            }
            catch (Exception ex)
            {
                var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);
                var exeption = new ExceptionTableModel()
                {
                    UserId = userId,
                    Value = ex.Message,
                    StackTrace = ex.StackTrace,
                };
                await _exceptionsRepository.CreateExceptionAsync(exeption);
                await _next.Invoke(context);
            }
        }
    }
}
