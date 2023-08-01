using System;
using AbdulhadiNagarroAssignment.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
    public class UserRepository : GenericRepository, IUserRepository
    {
        public UserRepository(AccountsManagerContext context) : base(context)
        {
        }

        public async Task<Session> AddSession(Session session)
        {
            var result = await context.Sessions.AddAsync(session);
            await context.SaveChangesAsync();
            return result.Entity;
        }

        public async Task<Session?> GetLatestSession(int userId)
        {
            return await context.Sessions.Where(s => s.UserId == userId)
                .OrderByDescending(s => s.StartTime).FirstOrDefaultAsync(); 
        }

        public async Task<User?> GetUser(string username, string password)
        {
            return await context.Users.SingleOrDefaultAsync(x => x.Username == username && x.Password == password);
        }
    }
}

