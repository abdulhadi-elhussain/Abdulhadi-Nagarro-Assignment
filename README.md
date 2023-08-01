# AbdulhadiNagarroAssignment .NET Project

Welcome to AbdulhadiNagarroAssignment .NET Project!

## Description

.Net Assignment
Test Pre-requisite:
The following assignment should be done using .Net6
Note: It is a must to use MS Access as the DB!
We care about the Code Quality.
- SonarQube Report must be attached with the assignment. - Object Oriented Design.
- Logging and Exception Handling.
- Code Maintainability, Reusability & Scalability.
- API Security and Session management.
- Unit Test Coverage Report must be attached with the assignment.
- README.md that explains how the code and the test can be run.
- README file should also contain explanation about how this API can be part of microservices
architecture in terms of integrations, dealing and interacting with other microservices,
reusability, etc.
- The source code must be uploaded to GIT and the URL must be shared over e-mail.
Introduction:
The server will handle requests to view statements by performing simple search on date and amount ranges.
- The request should specify the account id.
- The request can specify from date and to date (the date range).
- The request can specify from amount and to amount (the amount range).
- If the request does not specify any parameter, then the search will return three months back
statement.
- If the parameters are invalid a proper error message should be sent to user.
- The account number should be hashed before sent to the user.
- All the exceptions should be handled on the server properly.
Authentication and Security:
The authenticated users are:
User1: Username: admin & Password: admin User2: Username: user & Password: user
Access Control Specifications:
- The ‘admin’ can perform all the requests (specify date and amount range).
- The ‘user’ can only do a request without parameters which will return the three months
back statement.
- When the test user tries to specify any parameter, then HTTP unauthorized (401) access
error will be sent.
- The user cannot login twice (the user should logout before login). - The session time out is 5 minutes.
 Database information:
Database file: accountsdb.accdb is given as part of this assignment Table Specifications:
Account:
- ID: Autonumber
- account_type: Text
- account_number: Text
Statement:
- ID: Autonumber
- account_id: Number
- datefield: Text
- amount: Text
(Note that date field and amount are in text format so applying range cannot be in the database level)

## Installation

This project is developed with .net core 6  
To get started with  this .NET Project, follow these steps:

1. Clone the repository: `git clone https://github.com/abdulhadi-elhussain/Abdulhadi-Nagarro-Assignment.git`
2. Navigate to the project directory: `cd AbdulhadiNagarroAssignment`
3. Build the project: `dotnet build`
4. Run the application: `dotnet run`
Or Using Viusal Studio GUI
For Testing:
1. Navigate to testing project `cd ./AbdulhadiNagarroAssignment.Testing`
2. add the package using `dotnet add package coverlet.collector`
or using Visual Studio

Note: an In-Memory DB is used instead of access DB, since the db wasn't provided and the development enviroment is a Mac with Apple Silicon

* The package used in the solution:
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="6.0.20" />
    <PackageReference Include="AutoMapper.Extensions.Microsoft.DependencyInjection" Version="12.0.1" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="6.0.20" />
    <PackageReference Include="Microsoft.Extensions.DependencyInjection" Version="6.0.1" />
    <PackageReference Include="Microsoft.Extensions.Logging" Version="6.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="6.0.20" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.InMemory" Version="6.0.20" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Proxies" Version="6.0.20" />
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.1.0" />
    <PackageReference Include="xunit" Version="2.4.1" />
    <PackageReference Include="xunit.runner.visualstudio" Version="2.4.3">
    <PackageReference Include="Microsoft.AspNetCore.Mvc.Testing" Version="6.0.20" />
    <PackageReference Include="Shouldly" Version="4.2.1" />
    <PackageReference Include="Swashbuckle.AspNetCore" Version="6.5.0" />
    <PackageReference Include="Microsoft.VisualStudio.Web.CodeGeneration.Design" Version="6.0.15" />

## Usage

The solution is splitted into four projects:
1. AbdulhadiNagarroAssignment: this is the main project which contains the APIs main component such as: controllers, request & responses, configuration, mapping profiles
2. AbdulhadiNagarroAssignment.Domain: this project contains domain related code such as models
3. AbdulhadiNagarroAssignment.Infrastructure: thiis project contains the infrastructure related code such as: EF Code, DB Seeding, and repositories classes to handle interactions with the DB
4. AbdulhadiNagarroAssignment.Testing: this project holds the unit testing code, which can be executed by building the project and then run the test cases from the file `UnitTest.cs`

* In the main project in the the Program.cs file, all dependencies is being injected and application is initiated.
* appsettings.json holds the jwt parameters and session expiry
* a postman collection is also attached in the solution folder which can be imported to easily test the API after

*
