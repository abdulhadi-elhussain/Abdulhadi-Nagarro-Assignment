using System;
using System.ComponentModel.DataAnnotations;

namespace AbdulhadiNagarroAssignment.DTOs
{
	public record AuthenticateUserRequest
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
    }
}

