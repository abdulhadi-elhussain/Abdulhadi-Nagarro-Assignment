using System;
using AbdulhadiNagarroAssignment.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
    public class StatementRepository : GenericRepository, IStatementRepository
    {
        public StatementRepository(AccountsManagerContext context) : base(context)
        {
        }


        public async Task<List<Statement>> GetStatement(int accountId, DateTime? fromDate, DateTime? toDate, decimal fromAmount, decimal toAmount)
        {
            return await context.Statements.Where(s => s.AccountId == accountId &&
                            Convert.ToDateTime(s.StatementDate) >= fromDate &&
                            Convert.ToDateTime(s.StatementDate) <= toDate &&
                            Convert.ToDecimal(s.Amount) >= fromAmount &&
                            Convert.ToDecimal(s.Amount) <= toAmount).ToListAsync();

        }

        public async Task<List<Statement>> GetStatement(int accountId, DateTime? fromDate, DateTime? toDate)
        {
            return await context.Statements.Where(s => s.AccountId == accountId &&
                            Convert.ToDateTime(s.StatementDate) >= fromDate &&
                            Convert.ToDateTime(s.StatementDate) <= toDate).ToListAsync();
        }
    }
}

