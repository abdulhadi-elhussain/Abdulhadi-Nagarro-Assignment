using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AbdulhadiNagarroAssignment.Domain.Models;
using AbdulhadiNagarroAssignment.DTOs;
using AbdulhadiNagarroAssignment.Infrastructure.Persistence.Repositories;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace AbdulhadiNagarroAssignment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class StatementController : ControllerBase
    {
        private readonly ILogger<StatementController> _logger;
        private readonly IMapper _mapper;
        private readonly IStatementRepository _statementRepository;

        public StatementController(ILogger<StatementController> logger, IStatementRepository statementRepository, IMapper mapper)
        {
            _logger = logger;
            _statementRepository = statementRepository;
            _mapper = mapper;
        }

        // GET: api/Statement/5
        [HttpGet("{id}", Name = "Get")]
        public async Task<ActionResult> Get(int id)
        {
            try
            {
                var statement = await _statementRepository.GetStatement(id, DateTime.Now.AddMonths(-3), DateTime.Now);
                if (statement == null)
                {
                    return NotFound();
                }
                var result = _mapper.Map<List<StatementResponse>>(statement);
                _logger.LogInformation($"Successfull get statement for account: {id}");

                return Ok(result);
            }
            
            catch (Exception ex)
            {
                _logger.LogTrace(ex, $"Exception occured during get statement for account: {id}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        // GET: api/Statement/
        [HttpGet]
        [Authorize(Roles = "Administrator")]
        public async Task<ActionResult> Get([FromQuery] StatementRequest request)
        {

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                _logger.LogError($"Request validation error during Get Statement for account: {request.AccountId}", errors);
                return BadRequest(modelState: ModelState);
            }
            if (request.FromAmount > request.ToAmount || request.FromDate > request.ToDate)
            {
                _logger.LogError($"Request validation error during Get Statement for account: {request.AccountId}", "Invalid range");
                return BadRequest("Invalid range");
            }
            try
            {
                List<Statement> statement = new List<Statement>();
                bool isNullAmountRange = request.FromAmount == null || request.ToAmount == null;
                bool isNullDateRange = request.FromDate == null || request.ToDate == null;

                if (isNullDateRange && isNullAmountRange)
                {
                    statement = await _statementRepository.GetStatement(request.AccountId, DateTime.Now.AddMonths(-3), DateTime.Now);
                }
                if (isNullDateRange && !isNullAmountRange)
                {
                    statement = await _statementRepository.GetStatement(request.AccountId, DateTime.Now.AddMonths(-3), DateTime.Now, (decimal)request.FromAmount, (decimal)request.ToAmount);
                }
                if (!isNullDateRange && isNullAmountRange)
                {
                    statement = await _statementRepository.GetStatement(request.AccountId, request.FromDate, request.ToDate);
                }
                if (!isNullDateRange && !isNullAmountRange)
                {
                    statement = await _statementRepository.GetStatement(request.AccountId, request.FromDate, request.ToDate, (decimal)request.FromAmount, (decimal)request.ToAmount);
                }
                var result = _mapper.Map<List<StatementResponse>>(statement);
                _logger.LogInformation($"Successfull get statement for account: {request.AccountId}");

                return Ok(result);
            }
            
            catch (Exception ex)
            {
                _logger.LogTrace(ex, $"Exception occured during get statement for account: {request.AccountId}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

    }
}
