using System;
using AbdulhadiNagarroAssignment.Domain.Models;

namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
    public interface IStatementRepository
    {
        public Task<List<Statement>> GetStatement(int accountId, DateTime? fromDate, DateTime? toDate, decimal fromAmount, decimal toAmount);
        public Task<List<Statement>> GetStatement(int accountId, DateTime? fromDate, DateTime? toDate);
    }
}

