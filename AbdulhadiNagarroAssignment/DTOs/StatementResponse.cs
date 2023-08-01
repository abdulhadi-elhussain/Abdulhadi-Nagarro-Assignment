using System;
namespace AbdulhadiNagarroAssignment.DTOs
{
	public record StatementResponse
	{
		public int Id { get; set; }
		public decimal Amount { get; set; }
		public DateTime StatementDate { get; set; }
		public string AccountId { get; set; }

	}
}

