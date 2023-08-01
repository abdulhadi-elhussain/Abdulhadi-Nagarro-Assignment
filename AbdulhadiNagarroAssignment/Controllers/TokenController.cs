using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net.Mime;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AbdulhadiNagarroAssignment.Domain.Models;
using AbdulhadiNagarroAssignment.DTOs;
using AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using System.Globalization;

namespace AbdulhadiNagarroAssignment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private IConfiguration _config;
        private readonly IMapper _mapper;
        private readonly IUserRepository _userRepository;
        private readonly ILogger<TokenController> _logger;
        public TokenController(IConfiguration config, IUserRepository userRepository, IMapper mapper, ILogger<TokenController> logger)
        {
            _userRepository = userRepository;
            _config = config;
            _mapper = mapper;
            _logger = logger;
        }

        [Consumes(MediaTypeNames.Application.Json)]
        [HttpPost]
        [Route("login")]
        public async Task<IActionResult> AuthenticateUserAsync([FromBody] AuthenticateUserRequest request)
        {

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                _logger.LogError($"Request validation error during login for user: {request.Username}", errors);
                return BadRequest(modelState: ModelState);
            }
            try
            {

                User? result = await _userRepository.GetUser(request.Username, request.Password);
                if (result == null)
                {
                    return Unauthorized("Invalid Credentials");
                }
                var lastSesstion = await _userRepository.GetLatestSession(result.Id);
                if (lastSesstion != null && lastSesstion.ExpiryTime > DateTime.Now)
                {
                    return Forbid();
                }
                var authenticateUserResponse = _mapper.Map<AuthenticateUserResponse>(result);
                _userRepository.AddSession(new Session { UserId = result.Id, StartTime = DateTime.Now, ExpiryTime = DateTime.Now.AddMinutes(int.Parse(_config["Jwt:Expiry"])) });
                _logger.LogInformation($"Successfull login for user: {request.Username}");
                return Ok(GenerateToken(authenticateUserResponse));
            }
            catch (Exception ex)
            {
                _logger.LogTrace(ex, $"Exception occured during login for user: {request.Username}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }


        private string GenerateToken(AuthenticateUserResponse userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var tokenExpiry = int.Parse(_config["Jwt:Expiry"]);
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new List<Claim>{
            new Claim(JwtRegisteredClaimNames.Sub, _config["Jwt:Subject"]),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
            new Claim("UserId", userInfo.Id.ToString()),
            new Claim("DisplayName", userInfo.DisplayName),
            new Claim("UserName", userInfo.UserName),
        };
            userInfo.Roles.ForEach(x =>
            {
                claims.Add(new Claim(ClaimTypes.Role, x));
            });
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(tokenExpiry),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
