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

To get started with My Awesome .NET Project, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/my-awesome-dotnet-project.git`
2. Navigate to the project directory: `cd my-awesome-dotnet-project`
3. Build the project: `dotnet build`
4. Run the application: `dotnet run`

## Usage

Here's how you can use My Awesome .NET Project:

```csharp
using System;

public class Program
{
    public static void Main()
    {
        // Your code examples here...
    }
}
