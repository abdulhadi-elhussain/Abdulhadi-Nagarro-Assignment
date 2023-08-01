using System;
namespace AbdulhadiNagarroAssignment.Domain.Models
{
	public class Session : BaseModel
	{
		public virtual User User { get; set; }
		public int UserId { get; set; }
		public DateTime StartTime { get; set; }
		public DateTime ExpiryTime { get; set; }

	}
}

