using System;
using AbdulhadiNagarroAssignment.Domain.Models;

namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories
{
    public interface IUserRepository
    {
        public Task<User?> GetUser(string username, string password);
        public Task<Session?> GetLatestSession(int userId);
        public Task<Session?> AddSession(Session session);

    }
}

