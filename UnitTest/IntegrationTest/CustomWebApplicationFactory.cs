using System;
using AbdulhadiNagarroAssignment.Infrastructure.Persistence;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.VisualStudio.TestPlatform.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace IntegrationTest
{
    public class CustomWebApplicationFactory : WebApplicationFactory<Program>

    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.ConfigureServices(services =>
            {
                var descriptor = services.SingleOrDefault(
                    d => d.ServiceType ==
                         typeof(DbContextOptions<AccountsManagerContext>));

                services.Remove(descriptor);

                services.AddDbContext<AccountsManagerContext>(options =>
                {
                    options.UseInMemoryDatabase("InMemoryDbForIntegrationTest");
                });

                var sp = services.BuildServiceProvider();

                using (var scope = sp.CreateScope())
                {
                    var scopedServices = scope.ServiceProvider;
                    var db = scopedServices.GetRequiredService<AccountsManagerContext>();
                    var logger = scopedServices
                        .GetRequiredService<ILogger<CustomWebApplicationFactory>>();
                    db.Database.EnsureCreated();

                }
            });
        }


    }
}

