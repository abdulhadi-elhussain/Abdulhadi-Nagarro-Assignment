using System;
namespace AbdulhadiNagarroAssignment.Domain.Models
{
    public class Statement : BaseModel
    {
        public virtual Account Account { get; set; }
        public int AccountId { get; set; }
        public string StatementDate { get; set; }
        public string Amount { get; set; }
    }
}

