using System;
using AbdulhadiNagarroAssignment.Domain.Models;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Numerics;
using System.Reflection.Emit;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace AbdulhadiNagarroAssignment.Infrastructure.Persistence
{
	public class AccountsManagerContext : DbContext
    {

        public AccountsManagerContext(DbContextOptions<AccountsManagerContext> options) : base(options)
        {
        }

        public DbSet<Account> Accounts { get; set; } 
        public DbSet<Statement> Statements { get; set; }
        public DbSet<Role?> Roles { get; set; }
        public DbSet<User?> Users { get; set; }
        public DbSet<UserRole?> UsersRoles { get; set; }
        public DbSet<Session?> Sessions { get; set; }



        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.UseInMemoryDatabase("Nagarro", b => b.EnableNullChecks(false));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            //Identity
            modelBuilder.Entity<User>().Property(u => u.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<Account>().Property(a => a.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<Statement>().Property(s => s.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<Role>().Property(r => r.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<UserRole>().Property(ur => ur.Id).ValueGeneratedOnAdd();

            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

        }
    }
}
