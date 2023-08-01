using System;
using AbdulhadiNagarroAssignment.Domain.Models;
using Castle.Core.Resource;
using System.Diagnostics.Metrics;
using AbdulhadiNagarroAssignment.Infrastructure.Persistence;

namespace IntegrationTest
{
    public static class InitDb
    {
        public static async Task InitializeDbForTests(AccountsManagerContext context)
        {
            var adminRole = new Role { Name = "Administrator" };
            var userRole = new Role { Name = "User" };
            Role[] roles = { adminRole, userRole };
            await context.Roles.AddRangeAsync(roles);
            await context.SaveChangesAsync();
            var adminUser = new User
            {
                Username = "admin",
                Password = "admin",
                EmailAddress = "abdulhadi.elhussain@nagarro.com",
                DisplayName = "Abdulhadi Elhussain",
            };
            var userUser = new User
            {
                Username = "user",
                Password = "user",
                EmailAddress = "user@gmail.com",
                DisplayName = "User"
            };
            await context.Users.AddRangeAsync(adminUser, userUser);
            await context.SaveChangesAsync();
            await context.UsersRoles.AddRangeAsync(new UserRole { Role = adminRole, User = adminUser },
                new UserRole { Role = userRole, User = userUser });
            await context.SaveChangesAsync();


            List<Account> accounts = new List<Account>();
            accounts.Add(new Account { AccountNumber = "123", AccountType = "test" });
            accounts.Add(new Account { AccountNumber = "124", AccountType = "test" });
            accounts.Add(new Account { AccountNumber = "125", AccountType = "real" });

            await context.Accounts.AddRangeAsync(accounts);
            await context.SaveChangesAsync();

            await context.Statements.AddRangeAsync(
                new Statement { Account = accounts[0], Amount = "34", StatementDate = "2023-07-02" },
                new Statement { Account = accounts[1], Amount = "54", StatementDate = "2023-07-02" },
                new Statement { Account = accounts[1], Amount = "567", StatementDate = "2023-06-12" },
                new Statement { Account = accounts[2], Amount = "8637", StatementDate = "2023-07-22" },
                new Statement { Account = accounts[0], Amount = "98", StatementDate = "2022-05-02" }
                );

            await context.SaveChangesAsync();
        }

        public static void ReinitializeDbForTests(AccountsManagerContext db)
        {
            InitializeDbForTests(db);
        }


    }
}

