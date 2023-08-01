using System;
namespace NagarroAssignment.Domain.Models
{
	public class Statement
	{
		public int StatementID { get; set; }
		public virtual Account Account { get; set; }
		public int AccountID { get; set; }
		public string StatementDate { get; set; }
		public string Amount { get; set; }
	}
}

