using System;
using System.ComponentModel.DataAnnotations;

namespace AbdulhadiNagarroAssignment.DTOs
{
	public record StatementRequest
	{
		[Required]
		public int AccountId { get; set; }
        public DateTime? FromDate { get; set; }
		public DateTime? ToDate { get; set; }
        public Decimal? FromAmount { get; set; }
		public Decimal? ToAmount { get; set; }
	}
}

