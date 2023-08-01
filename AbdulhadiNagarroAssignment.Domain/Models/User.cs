using System;
namespace AbdulhadiNagarroAssignment.Domain.Models
{
	public class User : BaseModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string EmailAddress { get; set; }
        public string DisplayName { get; set; }
        public virtual ICollection<UserRole> Roles { get; set; }
    }
}

