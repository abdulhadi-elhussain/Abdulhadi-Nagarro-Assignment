
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
using Xunit;
using Xunit.Abstractions;

namespace IntegrationTest;

public class ApiTest :
    IClassFixture<CustomWebApplicationFactory>

{
    ITestOutputHelper _output;
    private readonly HttpClient _client;
    private readonly string _jwt;
    private readonly CustomWebApplicationFactory
        _factory;
    public ApiTest(
        CustomWebApplicationFactory factory, ITestOutputHelper output)
    {
        _output = output;
        _factory = factory;
        _client = _factory.CreateClient(new WebApplicationFactoryClientOptions
        {
            AllowAutoRedirect = false,

        });
        var logincContent = new StringContent("{\"password\":\"admin\",\"username\":\"admin\"}", Encoding.UTF8, "application/json");
        _jwt = _client.PostAsync("api/Token/login", logincContent).Result.Content.ReadAsStringAsync().Result;
    }

    [Fact]
    public async Task GetStatementReturnSuccessAndCorrectContent()
    {
        // Arrange

        string queryString = $"AccountId=1&FromDate=2000-12-17&ToDate=2023-12-17&FromAmount=50&ToAmount=200";
        string url = "https://localhost/api/Statement?" + queryString;

        var client = _factory.CreateClient();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", _jwt);
        var response = await client.GetAsync(url);
        var result = await response.Content.ReadAsStringAsync();
        response.EnsureSuccessStatusCode();
        Assert.Equal("application/json; charset=utf-8",
            response.Content.Headers.ContentType.ToString());
        var statement = JsonConvert.DeserializeObject<List<StatementResponse>>(result);
        // Assert
        statement.ShouldNotBeEmpty();
        statement[0].Amount.ShouldBeGreaterThan(50);
    }


}
