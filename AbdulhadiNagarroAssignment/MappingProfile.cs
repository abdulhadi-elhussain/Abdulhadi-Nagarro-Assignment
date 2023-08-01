using System;
using System.Numerics;
using System.Security.Cryptography;
using System.Text;
using AbdulhadiNagarroAssignment.Domain.Models;
using AbdulhadiNagarroAssignment.DTOs;
using AutoMapper;

namespace AbdulhadiNagarroAssignment
{
	public class MappingProfile : Profile
	{
		public MappingProfile()
		{
            CreateMap<User, AuthenticateUserResponse>()
               .ForMember(dest => dest.Roles, opt => opt.MapFrom(src => src.Roles.Select(x => x.Role.Name).ToList()))
               .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
               .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => src.DisplayName))
               .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Username));


            CreateMap<Statement, StatementResponse>()
               .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
               .ForMember(dest => dest.AccountId, opt => opt.MapFrom(src => ComputeSHA256Hash(src.AccountId.ToString())))
               .ForMember(dest => dest.StatementDate, opt => opt.MapFrom(src => DateTime.Parse(src.StatementDate)))
               .ForMember(dest => dest.Amount, opt => opt.MapFrom(src => decimal.Parse(src.Amount)));
        }

        private string ComputeSHA256Hash(string input)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(input);
                byte[] hashBytes = sha256.ComputeHash(inputBytes);
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hashBytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }
    }
}

