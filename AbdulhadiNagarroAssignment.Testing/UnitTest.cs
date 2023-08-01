using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using AbdulhadiNagarroAssignment.DTOs;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Shouldly;
using Xunit.Abstractions;

namespace AbdulhadiNagarroAssignment.Testing
{
    public class UnitTest :
        IClassFixture<CustomWebApplicationFactory>

    {
        ITestOutputHelper _output;
        private readonly HttpClient _client;
        private readonly CustomWebApplicationFactory _factory;

        public UnitTest(
            CustomWebApplicationFactory factory, ITestOutputHelper output)
        {
            _output = output;
            _factory = factory;
            _client = _factory.CreateClient(new WebApplicationFactoryClientOptions
            {
                AllowAutoRedirect = false,

            });
        }

        [Fact]
        public async Task GetStatementReturnSuccessAndCorrectContent()
        {
            // Login First


            var loginPayload = new StringContent("{\"password\":\"admin\",\"username\":\"admin\"}", Encoding.UTF8, "application/json");
            string _jwt = _client.PostAsync("api/Token/login", loginPayload).Result.Content.ReadAsStringAsync().Result;

            // Arrange

            string queryString = $"AccountId=1&FromDate=2000-12-17&ToDate=2023-12-17&FromAmount=50&ToAmount=200";
            string url = "https://localhost/api/Statement?" + queryString;

            var client = _factory.CreateClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", _jwt);
            var response = await client.GetAsync(url);
            var result = await response.Content.ReadAsStringAsync();
            response.EnsureSuccessStatusCode();
            var statement = JsonConvert.DeserializeObject<List<StatementResponse>>(result);
            // Assert
            statement.ShouldNotBeEmpty();
            statement[0].Amount.ShouldBeGreaterThan(50);
        }

        [Fact]
        public async Task LoginReturnSuccess()
        {
            // Arrange
            var loginPayload = new StringContent("{\"password\":\"user\",\"username\":\"user\"}", Encoding.UTF8, "application/json");

            var client = _factory.CreateClient();
            var response = await client.PostAsync("api/Token/login", loginPayload);
            var result = await response.Content.ReadAsStringAsync();
            response.EnsureSuccessStatusCode();
            // Assert
            result.ShouldNotBeNullOrEmpty();
            response.StatusCode.ShouldBe(HttpStatusCode.OK);
        }


        [Fact]
        public async Task LoginReturnFailure()
        {
            // Arrange
            var loginPayload = new StringContent("{\"password\":\"admin\",\"username\":\"dfd\"}", Encoding.UTF8, "application/json");

            var client = _factory.CreateClient();
            var response = await client.PostAsync("api/Token/login", loginPayload);
            // Assert
            response.StatusCode.ShouldBe(HttpStatusCode.Unauthorized);
        }


        [Fact]
        public async Task LoginTwiceReturnFailure()
        {
            // Arrange
            var loginPayload = new StringContent("{\"password\":\"user\",\"username\":\"user1\"}", Encoding.UTF8, "application/json");

            var client = _factory.CreateClient();
            var response1 = await client.PostAsync("api/Token/login", loginPayload);
            var response2 = await client.PostAsync("api/Token/login", loginPayload);
            // Assert
            response1.StatusCode.ShouldBe(HttpStatusCode.OK);
            response2.StatusCode.ShouldBe(HttpStatusCode.Forbidden);
        }


    }
}

