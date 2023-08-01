using System;
using System.Data;

namespace AbdulhadiNagarroAssignment.Domain.Models
{
	public class UserRole : BaseModel
    {
        public virtual User User { get; set; }
        public int UserId { get; set; }
        public virtual Role Role { get; set; }
        public int RoleId { get; set; }
    }

}

