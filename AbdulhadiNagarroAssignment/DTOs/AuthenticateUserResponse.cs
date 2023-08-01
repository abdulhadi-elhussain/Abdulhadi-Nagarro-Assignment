using System;
namespace AbdulhadiNagarroAssignment.DTOs
{
	public record AuthenticateUserResponse
	{

        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? DisplayName { get; set; }
        public List<string>? Roles { get; set; }
    }
}

