## Heathrow Airport Management System

## Technical Documentation v1.0

---

## Table of Contents

1. [System Overview](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#system-overview)
2. [Architecture Design](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#architecture-design)
3. [Domain Models](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#domain-models)
4. [Repository Pattern Implementation](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#repository-pattern-implementation)
5. [Service Layer](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#service-layer)
6. [Business Rules and Validation](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#business-rules-and-validation)
7. [Console UI Framework](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#console-ui-framework)
8. [Data Management](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#data-management)
9. [Error Handling Strategy](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#error-handling-strategy)
10. [Security Implementation](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#security-implementation)
11. [Testing Strategy](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#testing-strategy)
12. [Performance Considerations](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#performance-considerations)
13. [Deployment Guide](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#deployment-guide)
14. [Future Enhancements](https://claude.ai/chat/be2e32ae-b449-4e89-8956-c965fb6e536b#future-enhancements)

---

## System Overview

### Project Description

The Heathrow Airport Management System is a comprehensive console-based application built in C# that manages airport operations including flight scheduling, contract management, resource allocation, and ground services. The system implements clean architecture principles with Repository pattern and extensive OOP practices.

### Key Features

- **User Authentication**: Secure login/signup with password requirements
- **Airport Overview**: Real-time dashboard with key metrics and notifications
- **Flight Management**: Complete flight lifecycle from arrival to departure
- **Contract Management**: Full contract lifecycle with detailed economics
- **Resource Management**: Stand and runway allocation with conflict resolution
- **Ground Services**: Worker management and service scheduling
- **Activity Logging**: Comprehensive audit trail for all operations

### Technology Stack

- **Language**: C# (.NET 6.0 or higher)
- **Architecture**: Clean Architecture with Repository Pattern
- **Data Storage**: In-memory collections (extensible to databases)
- **UI Framework**: Enhanced Console Application
- **Testing**: xUnit with Moq for mocking
- **Logging**: Serilog for structured logging

---

## Architecture Design

### System Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────── │
│  │   Console UI    │  │   Menu System   │  │   Validation   │
│  └─────────────────┘  └─────────────────┘  └─────────────── │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                    Application Layer                         │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────── │
│  │  Flight Service │  │ Contract Service│  │  Auth Service  │
│  └─────────────────┘  └─────────────────┘  └─────────────── │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────── │
│  │Resource Service │  │  Ground Service │  │  Timer Service │
│  └─────────────────┘  └─────────────────┘  └─────────────── │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                      Domain Layer                           │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────── │
│  │    Entities     │  │  Value Objects  │  │  Domain Events │
│  └─────────────────┘  └─────────────────┘  └─────────────── │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                   Infrastructure Layer                       │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────── │
│  │  Repositories   │  │   Unit of Work  │  │    Logging     │
│  └─────────────────┘  └─────────────────┘  └─────────────── │
└─────────────────────────────────────────────────────────────┘
```

### Design Patterns Used

1. **Repository Pattern**: Data access abstraction
2. **Unit of Work**: Transaction management
3. **Factory Pattern**: Object creation
4. **Strategy Pattern**: Business rule validation
5. **Observer Pattern**: Event notifications
6. **Command Pattern**: User actions
7. **State Pattern**: Flight state management

### SOLID Principles Implementation

- **Single Responsibility**: Each class has one reason to change
- **Open/Closed**: Extensible through interfaces
- **Liskov Substitution**: Proper inheritance hierarchies
- **Interface Segregation**: Focused, specific interfaces
- **Dependency Inversion**: Depend on abstractions, not concretions

---

## Domain Models

### Core Entities Structure

#### Base Entity

```csharp
public abstract class Entity
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    
    protected virtual void OnUpdated()
    {
        UpdatedAt = DateTime.UtcNow;
    }
}
```

#### Flight Entity (Extended)

```csharp
public class Flight : Entity
{
    // Basic Properties
    public string FlightNumber { get; set; } = string.Empty;
    public string AirlineName { get; set; } = string.Empty;
    public AircraftType AircraftType { get; set; }
    public FlightStatus Status { get; set; }
    
    // Resource Assignments
    public string? AssignedStandId { get; set; }
    public string? AssignedRunwayId { get; set; }
    
    // Financial
    public decimal ActualRevenue { get; set; }
    public int HandlingLimit { get; set; }
    
    // Contract Information
    public string ContractId { get; set; } = string.Empty;
    public DateTime ContractExpiration { get; set; }
    
    // Service Status
    public bool IsGroundServiceCompleted { get; set; }
    public Dictionary<ServiceType, bool> ServiceStatus { get; set; } = new();
    
    // Timing Information
    public DateTime? ScheduledArrival { get; set; }
    public DateTime? ActualArrival { get; set; }
    public DateTime? ScheduledDeparture { get; set; }
    public DateTime? ActualDeparture { get; set; }
    
    // Navigation Properties
    public Stand? AssignedStand { get; set; }
    public Runway? AssignedRunway { get; set; }
    public Contract Contract { get; set; } = null!;
    public List<GroundServiceAssignment> ServiceAssignments { get; set; } = new();
    
    // Business Methods
    public bool CanAssignStand() => Status == FlightStatus.Arrival && string.IsNullOrEmpty(AssignedStandId);
    public bool CanAssignRunway() => Status == FlightStatus.AssignedStand && string.IsNullOrEmpty(AssignedRunwayId);
    public bool CanLand() => Status == FlightStatus.ReadyToLand && HasRequiredAssignments();
    public bool CanTakeOff() => Status == FlightStatus.ReadyForDeparture && IsGroundServiceCompleted;
    
    private bool HasRequiredAssignments() => !string.IsNullOrEmpty(AssignedStandId) && !string.IsNullOrEmpty(AssignedRunwayId);
}
```

### Value Objects

```csharp
public record FlightNumber
{
    public string Value { get; }
    
    public FlightNumber(string value)
    {
        if (string.IsNullOrWhiteSpace(value) || !IsValidFormat(value))
            throw new ArgumentException("Invalid flight number format");
        Value = value.ToUpper();
    }
    
    private static bool IsValidFormat(string value) => 
        System.Text.RegularExpressions.Regex.IsMatch(value, @"^[A-Z]{2,3}\d{3,4}$");
}

public record EmailAddress
{
    public string Value { get; }
    
    public EmailAddress(string value)
    {
        if (!IsValidEmail(value))
            throw new ArgumentException("Invalid email format");
        Value = value.ToLower();
    }
    
    private static bool IsValidEmail(string email) =>
        System.Text.RegularExpressions.Regex.IsMatch(email, 
            @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
}

public record Password
{
    public string HashedValue { get; }
    
    public Password(string plainText)
    {
        if (!IsValidPassword(plainText))
            throw new ArgumentException("Password doesn't meet requirements");
        HashedValue = BCrypt.Net.BCrypt.HashPassword(plainText);
    }
    
    private static bool IsValidPassword(string password) =>
        password.Length >= 8 && password.Length <= 12 &&
        password.Any(char.IsUpper) &&
        password.Any(char.IsDigit) &&
        password.Any(c => !char.IsLetterOrDigit(c));
}
```

---

## Repository Pattern Implementation

### Generic Repository Interface

```csharp
public interface IRepository<T> where T : Entity
{
    Task<T?> GetByIdAsync(string id);
    Task<IEnumerable<T>> GetAllAsync();
    Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate);
    Task<T> AddAsync(T entity);
    Task UpdateAsync(T entity);
    Task DeleteAsync(string id);
    Task<bool> ExistsAsync(string id);
    Task<int> CountAsync();
    Task<IEnumerable<T>> GetPagedAsync(int page, int pageSize);
}
```

### Specialized Repository Interfaces

```csharp
public interface IFlightRepository : IRepository<Flight>
{
    Task<Flight?> GetByFlightNumberAsync(string flightNumber);
    Task<IEnumerable<Flight>> GetByStatusAsync(FlightStatus status);
    Task<IEnumerable<Flight>> GetArrivingFlightsAsync();
    Task<IEnumerable<Flight>> GetDepartingFlightsAsync();
    Task<IEnumerable<Flight>> GetFlightsRequiringStandAsync();
    Task<IEnumerable<Flight>> GetFlightsRequiringRunwayAsync();
    Task<bool> IsFlightNumberAvailableAsync(string flightNumber);
    Task<IEnumerable<Flight>> GetFlightsByContractAsync(string contractId);
    Task<IEnumerable<Flight>> GetOverdueFlightsAsync();
}
```

### Implementation Example

```csharp
public class InMemoryFlightRepository : IFlightRepository
{
    private readonly ConcurrentDictionary<string, Flight> _flights = new();
    private readonly ILogger<InMemoryFlightRepository> _logger;
    
    public InMemoryFlightRepository(ILogger<InMemoryFlightRepository> logger)
    {
        _logger = logger;
    }
    
    public async Task<Flight?> GetByFlightNumberAsync(string flightNumber)
    {
        _logger.LogDebug("Retrieving flight with number: {FlightNumber}", flightNumber);
        
        var flight = _flights.Values.FirstOrDefault(f => 
            f.FlightNumber.Equals(flightNumber, StringComparison.OrdinalIgnoreCase));
            
        return await Task.FromResult(flight);
    }
    
    public async Task<IEnumerable<Flight>> GetByStatusAsync(FlightStatus status)
    {
        _logger.LogDebug("Retrieving flights with status: {Status}", status);
        
        var flights = _flights.Values.Where(f => f.Status == status);
        return await Task.FromResult(flights);
    }
    
    // Thread-safe operations
    public async Task<Flight> AddAsync(Flight flight)
    {
        flight.OnUpdated();
        
        if (!_flights.TryAdd(flight.Id, flight))
        {
            throw new InvalidOperationException($"Flight with ID {flight.Id} already exists");
        }
        
        _logger.LogInformation("Added flight: {FlightNumber}", flight.FlightNumber);
        return await Task.FromResult(flight);
    }
    
    public async Task UpdateAsync(Flight flight)
    {
        flight.OnUpdated();
        
        _flights.AddOrUpdate(flight.Id, flight, (key, existingFlight) => flight);
        
        _logger.LogInformation("Updated flight: {FlightNumber}", flight.FlightNumber);
        await Task.CompletedTask;
    }
}
```

---

## Service Layer

### Core Service Interfaces

```csharp
public interface IFlightService
{
    Task<ServiceResult<Flight>> CreateFlightAsync(CreateFlightRequest request);
    Task<ServiceResult> AssignStandAsync(string flightNumber, string standId);
    Task<ServiceResult> AssignRunwayAsync(string flightNumber, string runwayId);
    Task<ServiceResult> ProcessLandingAsync(string flightNumber);
    Task<ServiceResult> ProcessTakeOffAsync(string flightNumber);
    Task<ServiceResult> AssignGroundServicesAsync(string flightNumber, List<ServiceType> services);
    Task<IEnumerable<Flight>> GetFlightsByStatusAsync(FlightStatus status);
    Task<FlightDetails?> GetFlightDetailsAsync(string flightNumber);
    Task<ServiceResult> UpdateFlightStatusAsync(string flightNumber, FlightStatus newStatus);
}

public interface IContractService
{
    Task<IEnumerable<Contract>> GetAvailableContractsAsync();
    Task<IEnumerable<Contract>> GetActiveContractsAsync();
    Task<IEnumerable<Contract>> GetExpiredContractsAsync();
    Task<ServiceResult> AssignContractAsync(string contractId);
    Task<ServiceResult> CancelContractAsync(string contractId);
    Task<ServiceResult> ReactivateContractAsync(string contractId);
    Task<ContractDetails?> GetContractDetailsAsync(string contractId);
    Task<ContractSummary> GetContractSummaryAsync();
    Task<IEnumerable<Contract>> GetExpiringContractsAsync(int daysThreshold = 7);
}

public interface IResourceService
{
    Task<IEnumerable<Stand>> GetAvailableStandsAsync(StandType? type = null, StandClass? standClass = null);
    Task<IEnumerable<Runway>> GetAvailableRunwaysAsync();
    Task<ServiceResult> ReserveStandAsync(string standId, string flightId);
    Task<ServiceResult> ReleaseStandAsync(string standId);
    Task<ServiceResult> ReserveRunwayAsync(string runwayId, string flightId);
    Task<ServiceResult> ReleaseRunwayAsync(string runwayId);
    Task<ResourceUtilization> GetResourceUtilizationAsync();
}
```

### Service Implementation Example

```csharp
public class FlightService : IFlightService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IResourceService _resourceService;
    private readonly ITimerService _timerService;
    private readonly INotificationService _notificationService;
    private readonly ILogger<FlightService> _logger;
    
    public FlightService(
        IUnitOfWork unitOfWork,
        IResourceService resourceService,
        ITimerService timerService,
        INotificationService notificationService,
        ILogger<FlightService> logger)
    {
        _unitOfWork = unitOfWork;
        _resourceService = resourceService;
        _timerService = timerService;
        _notificationService = notificationService;
        _logger = logger;
    }
    
    public async Task<ServiceResult> AssignStandAsync(string flightNumber, string standId)
    {
        try
        {
            // Validate input
            if (string.IsNullOrWhiteSpace(flightNumber) || string.IsNullOrWhiteSpace(standId))
                return ServiceResult.Failure("Flight number and stand ID are required");
            
            // Get flight
            var flight = await _unitOfWork.Flights.GetByFlightNumberAsync(flightNumber);
            if (flight == null)
                return ServiceResult.Failure($"Flight {flightNumber} not found");
            
            // Check if flight can be assigned a stand
            if (!flight.CanAssignStand())
                return ServiceResult.Failure($"Flight {flightNumber} cannot be assigned a stand in current status: {flight.Status}");
            
            // Check stand availability
            var stand = await _unitOfWork.Stands.GetByStandIdAsync(standId);
            if (stand == null)
                return ServiceResult.Failure($"Stand {standId} not found");
            
            if (!stand.IsAvailable)
                return ServiceResult.Failure($"Stand {standId} is not available");
            
            // Validate stand type compatibility
            var contract = await _unitOfWork.Contracts.GetByIdAsync(flight.ContractId);
            if (contract == null)
                return ServiceResult.Failure("Flight contract not found");
            
            // Business rule: Match stand type with aircraft type
            if (!IsStandCompatible(stand, contract.AircraftType))
                return ServiceResult.Failure($"Stand {standId} is not compatible with aircraft type {contract.AircraftType}");
            
            // Reserve the stand
            var reserveResult = await _resourceService.ReserveStandAsync(standId, flight.Id);
            if (!reserveResult.IsSuccess)
                return reserveResult;
            
            // Update flight
            flight.AssignedStandId = standId;
            flight.Status = FlightStatus.AssignedStand;
            await _unitOfWork.Flights.UpdateAsync(flight);
            
            // Log activity
            await _unitOfWork.ActivityLogs.LogActivityAsync(
                "system", // In real app, get from current user context
                $"Assigned stand {standId} to flight {flightNumber}",
                $"Stand assignment completed successfully",
                LogType.Activity);
            
            await _unitOfWork.SaveChangesAsync();
            
            // Send notification
            await _notificationService.NotifyStandAssignedAsync(flight, stand);
            
            _logger.LogInformation("Successfully assigned stand {StandId} to flight {FlightNumber}", standId, flightNumber);
            
            return ServiceResult.Success($"Stand {standId} successfully assigned to flight {flightNumber}");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error assigning stand {StandId} to flight {FlightNumber}", standId, flightNumber);
            return ServiceResult.Failure("An error occurred while assigning the stand");
        }
    }
    
    private bool IsStandCompatible(Stand stand, AircraftType aircraftType)
    {
        // Business logic for stand compatibility
        var largeAircraft = new[] { AircraftType.A380, AircraftType.B747 };
        var requiredClasses = new[] { StandClass.A, StandClass.B };
        
        if (largeAircraft.Contains(aircraftType))
        {
            return requiredClasses.Contains(stand.Class);
        }
        
        return true; // Smaller aircraft can use any stand
    }
}
```

### Service Result Pattern

```csharp
public class ServiceResult
{
    public bool IsSuccess { get; }
    public string Message { get; }
    public List<string> Errors { get; }
    
    protected ServiceResult(bool isSuccess, string message, List<string>? errors = null)
    {
        IsSuccess = isSuccess;
        Message = message;
        Errors = errors ?? new List<string>();
    }
    
    public static ServiceResult Success(string message = "Operation completed successfully")
        => new(true, message);
    
    public static ServiceResult Failure(string message, List<string>? errors = null)
        => new(false, message, errors);
    
    public static ServiceResult<T> Success<T>(T data, string message = "Operation completed successfully")
        => new(true, message, data);
    
    public static ServiceResult<T> Failure<T>(string message, List<string>? errors = null)
        => new(false, message, default(T), errors);
}

public class ServiceResult<T> : ServiceResult
{
    public T? Data { get; }
    
    internal ServiceResult(bool isSuccess, string message, T? data, List<string>? errors = null)
        : base(isSuccess, message, errors)
    {
        Data = data;
    }
}
```

---

## Business Rules and Validation

### Validation Framework

```csharp
public interface IValidator<T>
{
    ValidationResult Validate(T item);
}

public class ValidationResult
{
    public bool IsValid { get; }
    public List<ValidationError> Errors { get; }
    
    public ValidationResult(bool isValid, List<ValidationError>? errors = null)
    {
        IsValid = isValid;
        Errors = errors ?? new List<ValidationError>();
    }
}

public class ValidationError
{
    public string PropertyName { get; set; } = string.Empty;
    public string ErrorMessage { get; set; } = string.Empty;
    public string ErrorCode { get; set; } = string.Empty;
}
```

### Flight Validation Example

```csharp
public class FlightValidator : IValidator<Flight>
{
    private readonly IFlightRepository _flightRepository;
    private readonly IContractRepository _contractRepository;
    
    public FlightValidator(IFlightRepository flightRepository, IContractRepository contractRepository)
    {
        _flightRepository = flightRepository;
        _contractRepository = contractRepository;
    }
    
    public ValidationResult Validate(Flight flight)
    {
        var errors = new List<ValidationError>();
        
        // Flight number validation
        if (string.IsNullOrWhiteSpace(flight.FlightNumber))
        {
            errors.Add(new ValidationError
            {
                PropertyName = nameof(flight.FlightNumber),
                ErrorMessage = "Flight number is required",
                ErrorCode = "FLIGHT_NUMBER_REQUIRED"
            });
        }
        else if (!IsValidFlightNumberFormat(flight.FlightNumber))
        {
            errors.Add(new ValidationError
            {
                PropertyName = nameof(flight.FlightNumber),
                ErrorMessage = "Flight number format is invalid. Expected format: AA1234",
                ErrorCode = "FLIGHT_NUMBER_INVALID_FORMAT"
            });
        }
        
        // Contract validation
        if (string.IsNullOrWhiteSpace(flight.ContractId))
        {
            errors.Add(new ValidationError
            {
                PropertyName = nameof(flight.ContractId),
                ErrorMessage = "Contract ID is required",
                ErrorCode = "CONTRACT_ID_REQUIRED"
            });
        }
        
        // Business rule validations
        ValidateBusinessRules(flight, errors);
        
        return new ValidationResult(errors.Count == 0, errors);
    }
    
    private void ValidateBusinessRules(Flight flight, List<ValidationError> errors)
    {
        // Rule: Cannot assign stand before flight arrives
        if (!string.IsNullOrEmpty(flight.AssignedStandId) && flight.Status != FlightStatus.Arrival)
        {
            errors.Add(new ValidationError
            {
                PropertyName = nameof(flight.Status),
                ErrorMessage = "Cannot assign stand to flight that hasn't arrived",
                ErrorCode = "INVALID_STAND_ASSIGNMENT"
            });
        }
        
        // Rule: Cannot take off without ground service completion
        if (flight.Status == FlightStatus.ReadyForDeparture && !flight.IsGroundServiceCompleted)
        {
            errors.Add(new ValidationError
            {
                PropertyName = nameof(flight.IsGroundServiceCompleted),
                ErrorMessage = "Flight cannot depart without completing ground services",
                ErrorCode = "GROUND_SERVICE_INCOMPLETE"
            });
        }
    }
    
    private bool IsValidFlightNumberFormat(string flightNumber) =>
        System.Text.RegularExpressions.Regex.IsMatch(flightNumber, @"^[A-Z]{2,3}\d{3,4}$");
}
```

---

## Console UI Framework

### Menu System Architecture

```csharp
public abstract class BaseMenu
{
    protected readonly IServiceProvider _serviceProvider;
    protected readonly ILogger _logger;
    
    protected BaseMenu(IServiceProvider serviceProvider, ILogger logger)
    {
        _serviceProvider = serviceProvider;
        _logger = logger;
    }
    
    public abstract Task DisplayAsync();
    protected abstract Task HandleUserChoiceAsync(string choice);
    
    protected void DisplayHeader(string title)
    {
        Console.Clear();
        Console.ForegroundColor = ConsoleColor.Cyan;
        Console.WriteLine("╔" + new string('═', title.Length + 2) + "╗");
        Console.WriteLine($"║ {title} ║");
        Console.WriteLine("╚" + new string('═', title.Length + 2) + "╝");
        Console.ResetColor();
        Console.WriteLine();
    }
    
    protected void DisplayError(string message)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine($"❌ Error: {message}");
        Console.ResetColor();
    }
    
    protected void DisplaySuccess(string message)
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine($"✅ {message}");
        Console.ResetColor();
    }
    
    protected void DisplayWarning(string message)
    {
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine($"⚠️  Warning: {message}");
        Console.ResetColor();
    }
    
    protected string GetUserInput(string prompt, bool isRequired = true)
    {
        string input;
        do
        {
            Console.Write($"{prompt}: ");
            input = Console.ReadLine()?.Trim() ?? string.Empty;
            
            if (isRequired && string.IsNullOrWhiteSpace(input))
            {
                DisplayError("This field is required. Please enter a value.");
            }
        } while (isRequired && string.IsNullOrWhiteSpace(input));
        
        return input;
    }
    
    protected bool GetConfirmation(string message)
    {
        Console.Write($"{message} (y/n): ");
        var response = Console.ReadLine()?.Trim().ToLower();
        return response == "y" || response == "yes";
    }
    
    protected void PauseForUser()
    {
        Console.WriteLine("\nPress any key to continue...");
        Console.ReadKey();
    }
}
```

### Data Display Utilities

```csharp
public static class ConsoleTableHelper
{
    public static void DisplayTable<T>(IEnumerable<T> data, string title, params Expression<Func<T, object>>[] columns)
    {
        var items = data.ToList();
        if (!items.Any())
        {
            Console.WriteLine($"No {title.ToLower()} found.");
            return;
        }
        
        Console.ForegroundColor = ConsoleColor.White;
        Console.WriteLine($"\n{title}");
        Console.WriteLine(new string('-', title.Length));
        Console.ResetColor();
        
        // Extract column information
        var columnInfos = columns.Select(col => new
        {
            Header = GetPropertyName(col),
            Accessor = col.Compile()
        }).ToList();
        
        // Calculate column widths
        var columnWidths = columnInfos.Select(col =>
            Math.Max(col.Header.Length, items.Max(item => col.Accessor(item)?.ToString()?.Length ?? 0))
        ).ToArray();
        
        // Display headers
        Console.ForegroundColor = ConsoleColor.Cyan;
        for (int i = 0; i < columnInfos.Count; i++)
        {
            Console.Write(columnInfos[i].Header.PadRight(columnWidths[i] + 2));
        }
        Console.WriteLine();
        Console.WriteLine(new string('-', columnWidths.Sum() + columnWidths.Length * 2));
        Console.ResetColor();
        
        // Display data rows
        foreach (var item in items)
        {
            for (int i = 0; i < columnInfos.Count; i++)
            {
                var value = columnInfos[i].Accessor(item)?.ToString() ?? "N/A";
                Console.Write(value.PadRight(columnWidths[i] + 2));
            }
            Console.WriteLine();
        }
        
        Console.WriteLine($"\nTotal: {items.Count} {title.ToLower()}");
    }
    
    private static string GetPropertyName<T>(Expression<Func<T, object>> expression)
    {
        if (expression.Body is MemberExpression memberExp)
            return memberExp.Member.Name;
        
        if (expression.Body is UnaryExpression unaryExp && 
            unaryExp.Operand is MemberExpression memberExp2)
            return memberExp2.Member.Name;
        
        return "Unknown";
    }
}
```

### Progress Indicator

```csharp
public class ProgressIndicator
{
    private readonly string _message;
    private readonly int _totalSteps;
    private int _currentStep;
    
    public ProgressIndicator(string message, int totalSteps)
    {
        _message = message;
        _totalSteps = totalSteps;
        _currentStep = 0;
    }
    
    public void UpdateProgress(int step)
    {
        _currentStep = step;
        DisplayProgress();
    }
    
    public void IncrementProgress()
    {
        _currentStep++;
        DisplayProgress();
    }
    
    private void DisplayProgress()
    {
        Console.SetCursorPosition(0, Console.CursorTop);
        
        var percentage = (double)_currentStep / _totalSteps * 100;
        var progressBarWidth = 30;
        var filledWidth = (int)(percentage / 100 * progressBarWidth);
        
        var progressBar = "[" + 
                         new string('█', filledWidth) + 
                         new string('░', progressBarWidth - filledWidth) + 
                         "]";
        
        Console.Write($"{_message}: {progressBar} {percentage:F1}%");
        
        if (_currentStep >= _totalSteps)
        {
            Console.WriteLine(" ✅ Complete!");
        }
    }
}
```

---

## Data Management

### Unit of Work Implementation

```csharp
public class UnitOfWork : IUnitOfWork
{
    private readonly Dictionary<Type, object> _repositories = new();
    private readonly ILogger<UnitOfWork> _logger;
    private bool _disposed = false;
    
    // Repository properties
    public IFlightRepository Flights => GetRepository<IFlightRepository>();
    public IContractRepository Contracts => GetRepository<IContractRepository>();
    public IStandRepository Stands => GetRepository<IStandRepository>();
    public IRunwayRepository Runways => GetRepository<IRunwayRepository>();
    public IGroundServiceRepository GroundServices => GetRepository<IGroundServiceRepository>();
    public IUserRepository Users => GetRepository<IUserRepository>();
    public IAirportRepository Airport => GetRepository<IAirportRepository>();
    public IActivityLogRepository ActivityLogs => GetRepository<IActivityLogRepository>();
    
    public UnitOfWork(IServiceProvider serviceProvider, ILogger<UnitOfWork> logger)
    {
        _serviceProvider = serviceProvider;
        _logger = logger;
    }
    
    private T GetRepository<T>() where T : class
    {
        if (_repositories.TryGetValue(typeof(T), out var repository))
            return (T)repository;
            
        var newRepository = _serviceProvider.GetRequiredService<T>();
        _repositories[typeof(T)] = newRepository;
        return newRepository;
    }
    
    public async Task<int> SaveChangesAsync()
    {
        try
        {
            // In a real implementation, this would save all pending changes
            // For in-memory storage, changes are already persisted
            _logger.LogDebug("Saving changes to data store");
            
            // Simulate database save operation
            await Task.Delay(10);
            
            return await Task.FromResult(1); // Return number of affected records
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error saving changes");
            throw;
        }
    }
    
    public async Task BeginTransactionAsync()
    {
        // In a real implementation, this would start a database transaction
        _logger.LogDebug("Beginning transaction");
        await Task.CompletedTask;
    }
    
    public async Task CommitTransactionAsync()
    {
        // In a real implementation, this would commit the database transaction
        _logger.LogDebug("Committing transaction");
        await Task.CompletedTask;
    }
    
    public async Task RollbackTransactionAsync()
    {
        // In a real implementation, this would rollback the database transaction
        _logger.LogDebug("Rolling back transaction");
        await Task.CompletedTask;
    }
    
    public void Dispose()
    {
        if (!_disposed)
        {
            _repositories.Clear();
            _disposed = true;
        }
    }
}
```

### Data Seed Service

```csharp
public class DataSeedService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<DataSeedService> _logger;
    
    public DataSeedService(IUnitOfWork unitOfWork, ILogger<DataSeedService> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }
    
    public async Task SeedDataAsync()
    {
        _logger.LogInformation("Starting data seed process");
        
        await SeedAirportDataAsync();
        await SeedStandsAsync();
        await SeedRunwaysAsync();
        await SeedContractsAsync();
        await SeedGroundServicesAsync();
        await SeedSampleFlightsAsync();
        
        await _unitOfWork.SaveChangesAsync();
        
        _logger.LogInformation("Data seed process completed");
    }
    
    private async Task SeedAirportDataAsync()
    {
        var airport = new Airport
        {
            Code = "LHR",
            Name = "London Heathrow Airport",
            CountryCode = "GB",
            Weather = "Clear, 15°C, Wind: 10kt SW",
            TotalRevenue = 50_000_000m
        };
        
        await _unitOfWork.Airport.AddAsync(airport);
    }
    
    private async Task SeedStandsAsync()
    {
        var stands = new List<Stand>
        {
            new Stand { StandId = "A1", Type = StandType.Passenger, Class = StandClass.A },
            new Stand { StandId = "A2", Type = StandType.Passenger, Class = StandClass.A },
            new Stand { StandId = "B1", Type = StandType.Passenger, Class = StandClass.B },
            new Stand { StandId = "B2", Type = StandType.Passenger, Class = StandClass.B },
            new Stand { StandId = "C1", Type = StandType.Cargo, Class = StandClass.C },
            new Stand { StandId = "C2", Type = StandType.Cargo, Class = StandClass.C }
        };
        
        foreach (var stand in stands)
        {
            await _unitOfWork.Stands.AddAsync(stand);
        }
    }
    
    private async Task SeedRunwaysAsync()
    {
        var runways = new List<Runway>
        {
            new Runway { RunwayId = "09L", Name = "09L/27R", IsActive = true },
            new Runway { RunwayId = "09R", Name = "09R/27L", IsActive = true },
            new Runway { RunwayId = "23", Name = "05/23", IsActive = false } // Closed for maintenance
        };
        
        foreach (var runway in runways)
        {
            await _unitOfWork.Runways.AddAsync(runway);
        }
    }
}
```

---

## Error Handling Strategy

### Custom Exception Hierarchy

```csharp
public abstract class AirportManagementException : Exception
{
    public string ErrorCode { get; }
    public Dictionary<string, object> Context { get; }
    
    protected AirportManagementException(string message, string errorCode, Exception? innerException = null)
        : base(message, innerException)
    {
        ErrorCode = errorCode;
        Context = new Dictionary<string, object>();
    }
    
    public AirportManagementException AddContext(string key, object value)
    {
        Context[key] = value;
        return this;
    }
}

public class FlightNotFoundException : AirportManagementException
{
    public FlightNotFoundException(string flightNumber)
        : base($"Flight {flightNumber} not found", "FLIGHT_NOT_FOUND")
    {
        AddContext("FlightNumber", flightNumber);
    }
}

public class ResourceUnavailableException : AirportManagementException
{
    public ResourceUnavailableException(string resourceType, string resourceId)
        : base($"{resourceType} {resourceId} is not available", "RESOURCE_UNAVAILABLE")
    {
        AddContext("ResourceType", resourceType);
        AddContext("ResourceId", resourceId);
    }
}

public class InvalidFlightStateException : AirportManagementException
{
    public InvalidFlightStateException(string flightNumber, FlightStatus currentStatus, FlightStatus requiredStatus)
        : base($"Flight {flightNumber} is in {currentStatus} status, but {requiredStatus} is required", "INVALID_FLIGHT_STATE")
    {
        AddContext("FlightNumber", flightNumber);
        AddContext("CurrentStatus", currentStatus);
        AddContext("RequiredStatus", requiredStatus);
    }
}

public class BusinessRuleViolationException : AirportManagementException
{
    public BusinessRuleViolationException(string ruleName, string description)
        : base($"Business rule violation: {description}", "BUSINESS_RULE_VIOLATION")
    {
        AddContext("RuleName", ruleName);
    }
}
```

### Global Error Handler

```csharp
public class ErrorHandler
{
    private readonly ILogger<ErrorHandler> _logger;
    
    public ErrorHandler(ILogger<ErrorHandler> logger)
    {
        _logger = logger;
    }
    
    public void HandleException(Exception exception)
    {
        switch (exception)
        {
            case AirportManagementException amEx:
                HandleAirportManagementException(amEx);
                break;
            case ValidationException validationEx:
                HandleValidationException(validationEx);
                break;
            case UnauthorizedAccessException:
                HandleUnauthorizedException();
                break;
            default:
                HandleGenericException(exception);
                break;
        }
    }
    
    private void HandleAirportManagementException(AirportManagementException exception)
    {
        _logger.LogWarning(exception, "Airport management exception occurred: {ErrorCode}", exception.ErrorCode);
        
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine($"❌ Error ({exception.ErrorCode}): {exception.Message}");
        
        if (exception.Context.Any())
        {
            Console.WriteLine("\nAdditional Information:");
            foreach (var context in exception.Context)
            {
                Console.WriteLine($"  {context.Key}: {context.Value}");
            }
        }
        
        Console.ResetColor();
    }
    
    private void HandleValidationException(ValidationException exception)
    {
        _logger.LogWarning(exception, "Validation failed");
        
        Console.ForegroundColor = ConsoleColor.Yellow;
        Console.WriteLine("⚠️  Validation Error:");
        
        foreach (var error in exception.Errors)
        {
            Console.WriteLine($"  • {error}");
        }
        
        Console.ResetColor();
    }
    
    private void HandleUnauthorizedException()
    {
        _logger.LogWarning("Unauthorized access attempt");
        
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine("🔒 Access Denied: Please log in to continue.");
        Console.ResetColor();
    }
    
    private void HandleGenericException(Exception exception)
    {
        _logger.LogError(exception, "Unexpected error occurred");
        
        Console.ForegroundColor = ConsoleColor.DarkRed;
        Console.WriteLine("💥 An unexpected error occurred. Please contact support if this issue persists.");
        Console.WriteLine($"Error ID: {Guid.NewGuid()}");
        Console.ResetColor();
    }
}
```

---

## Security Implementation

### Authentication Service

```csharp
public class AuthenticationService : IAuthenticationService
{
    private readonly IUserRepository _userRepository;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ILogger<AuthenticationService> _logger;
    private User? _currentUser;
    
    public User? CurrentUser => _currentUser;
    public bool IsAuthenticated => _currentUser != null;
    
    public AuthenticationService(
        IUserRepository userRepository,
        IPasswordHasher passwordHasher,
        ILogger<AuthenticationService> logger)
    {
        _userRepository = userRepository;
        _passwordHasher = passwordHasher;
        _logger = logger;
    }
    
    public async Task<ServiceResult<User>> LoginAsync(string emailOrUsername, string password)
    {
        try
        {
            // Find user by email or username
            var user = await FindUserAsync(emailOrUsername);
            if (user == null)
            {
                _logger.LogWarning("Login attempt with invalid email/username: {EmailOrUsername}", emailOrUsername);
                return ServiceResult<User>.Failure("Invalid email/username or password");
            }
            
            // Verify password
            if (!_passwordHasher.VerifyPassword(password, user.PasswordHash))
            {
                _logger.LogWarning("Invalid password attempt for user: {UserId}", user.Id);
                return ServiceResult<User>.Failure("Invalid email/username or password");
            }
            
            // Update last login
            await _userRepository.UpdateLastLoginAsync(user.Id);
            
            // Set current user
            _currentUser = user;
            
            _logger.LogInformation("User {UserId} logged in successfully", user.Id);
            return ServiceResult<User>.Success(user, "Login successful");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during login for {EmailOrUsername}", emailOrUsername);
            return ServiceResult<User>.Failure("An error occurred during login");
        }
    }
    
    public async Task<ServiceResult<User>> RegisterAsync(string email, string username, string password, string confirmPassword)
    {
        try
        {
            // Validate passwords match
            if (password != confirmPassword)
                return ServiceResult<User>.Failure("Passwords do not match");
            
            // Check if email already exists
            var existingUser = await _userRepository.GetByEmailAsync(email);
            if (existingUser != null)
                return ServiceResult<User>.Failure("Email address already registered");
            
            // Check if username already exists (if provided)
            if (!string.IsNullOrWhiteSpace(username))
            {
                var existingUsername = await _userRepository.GetByUsernameAsync(username);
                if (existingUsername != null)
                    return ServiceResult<User>.Failure("Username already taken");
            }
            
            // Create new user
            var user = await _userRepository.CreateUserAsync(email, username, password);
            
            _logger.LogInformation("New user registered: {UserId}", user.Id);
            return ServiceResult<User>.Success(user, "Registration successful");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during registration for {Email}", email);
            return ServiceResult<User>.Failure("An error occurred during registration");
        }
    }
    
    public ServiceResult Logout()
    {
        if (_currentUser == null)
            return ServiceResult.Failure("No user is currently logged in");
        
        var userId = _currentUser.Id;
        _currentUser = null;
        
        _logger.LogInformation("User {UserId} logged out", userId);
        return ServiceResult.Success("Logout successful");
    }
    
    private async Task<User?> FindUserAsync(string emailOrUsername)
    {
        // Try to find by email first
        var user = await _userRepository.GetByEmailAsync(emailOrUsername);
        if (user != null) return user;
        
        // Try to find by username
        return await _userRepository.GetByUsernameAsync(emailOrUsername);
    }
}

public interface IPasswordHasher
{
    string HashPassword(string password);
    bool VerifyPassword(string password, string hashedPassword);
}

public class BCryptPasswordHasher : IPasswordHasher
{
    public string HashPassword(string password)
    {
        return BCrypt.Net.BCrypt.HashPassword(password, BCrypt.Net.BCrypt.GenerateSalt());
    }
    
    public bool VerifyPassword(string password, string hashedPassword)
    {
        return BCrypt.Net.BCrypt.Verify(password, hashedPassword);
    }
}
```

---

## Testing Strategy

### Unit Testing Framework

```csharp
public class FlightServiceTests
{
    private readonly Mock<IUnitOfWork> _mockUnitOfWork;
    private readonly Mock<IResourceService> _mockResourceService;
    private readonly Mock<ITimerService> _mockTimerService;
    private readonly Mock<INotificationService> _mockNotificationService;
    private readonly Mock<ILogger<FlightService>> _mockLogger;
    private readonly FlightService _flightService;
    
    public FlightServiceTests()
    {
        _mockUnitOfWork = new Mock<IUnitOfWork>();
        _mockResourceService = new Mock<IResourceService>();
        _mockTimerService = new Mock<ITimerService>();
        _mockNotificationService = new Mock<INotificationService>();
        _mockLogger = new Mock<ILogger<FlightService>>();
        
        _flightService = new FlightService(
            _mockUnitOfWork.Object,
            _mockResourceService.Object,
            _mockTimerService.Object,
            _mockNotificationService.Object,
            _mockLogger.Object);
    }
    
    [Fact]
    public async Task AssignStandAsync_ValidRequest_ReturnsSuccess()
    {
        // Arrange
        var flightNumber = "BA123";
        var standId = "A1";
        var flight = CreateTestFlight(flightNumber, FlightStatus.Arrival);
        var stand = CreateTestStand(standId, true);
        var contract = CreateTestContract();
        
        _mockUnitOfWork.Setup(u => u.Flights.GetByFlightNumberAsync(flightNumber))
            .ReturnsAsync(flight);
        _mockUnitOfWork.Setup(u => u.Stands.GetByStandIdAsync(standId))
            .ReturnsAsync(stand);
        _mockUnitOfWork.Setup(u => u.Contracts.GetByIdAsync(flight.ContractId))
            .ReturnsAsync(contract);
        _mockResourceService.Setup(r => r.ReserveStandAsync(standId, flight.Id))
            .ReturnsAsync(ServiceResult.Success());
        
        // Act
        var result = await _flightService.AssignStandAsync(flightNumber, standId);
        
        // Assert
        Assert.True(result.IsSuccess);
        Assert.Equal(FlightStatus.AssignedStand, flight.Status);
        Assert.Equal(standId, flight.AssignedStandId);
        
        _mockUnitOfWork.Verify(u => u.Flights.UpdateAsync(flight), Times.Once);
        _mockUnitOfWork.Verify(u => u.SaveChangesAsync(), Times.Once);
        _mockNotificationService.Verify(n => n.NotifyStandAssignedAsync(flight, stand), Times.Once);
    }
    
    [Fact]
    public async Task AssignStandAsync_FlightNotFound_ReturnsFailure()
    {
        // Arrange
        var flightNumber = "INVALID";
        var standId = "A1";
        
        _mockUnitOfWork.Setup(u => u.Flights.GetByFlightNumberAsync(flightNumber))
            .ReturnsAsync((Flight?)null);
        
        // Act
        var result = await _flightService.AssignStandAsync(flightNumber, standId);
        
        // Assert
        Assert.False(result.IsSuccess);
        Assert.Contains("not found", result.Message);
        
        _mockResourceService.Verify(r => r.ReserveStandAsync(It.IsAny<string>(), It.IsAny<string>()), Times.Never);
    }
    
    [Theory]
    [InlineData(FlightStatus.OnStand)]
    [InlineData(FlightStatus.Departure)]
    [InlineData(FlightStatus.AssignedStand)]
    public async Task AssignStandAsync_InvalidFlightStatus_ReturnsFailure(FlightStatus status)
    {
        // Arrange
        var flightNumber = "BA123";
        var standId = "A1";
        var flight = CreateTestFlight(flightNumber, status);
        
        _mockUnitOfWork.Setup(u => u.Flights.GetByFlightNumberAsync(flightNumber))
            .ReturnsAsync(flight);
        
        // Act
        var result = await _flightService.AssignStandAsync(flightNumber, standId);
        
        // Assert
        Assert.False(result.IsSuccess);
        Assert.Contains("cannot be assigned a stand", result.Message);
    }
    
    private Flight CreateTestFlight(string flightNumber, FlightStatus status)
    {
        return new Flight
        {
            Id = Guid.NewGuid().ToString(),
            FlightNumber = flightNumber,
            Status = status,
            ContractId = Guid.NewGuid().ToString(),
            AirlineName = "Test Airline",
            AircraftType = AircraftType.B737
        };
    }
    
    private Stand CreateTestStand(string standId, bool isAvailable)
    {
        return new Stand
        {
            Id = Guid.NewGuid().ToString(),
            StandId = standId,
            IsAvailable = isAvailable,
            Type = StandType.Passenger,
            Class = StandClass.B
        };
    }
    
    private Contract CreateTestContract()
    {
        return new Contract
        {
            Id = Guid.NewGuid().ToString(),
            ContractId = "CT123",
            AircraftType = AircraftType.B737,
            Status = ContractStatus.Active
        };
    }
}
```

### Integration Testing

```csharp
public class FlightManagementIntegrationTests : IClassFixture<TestWebApplicationFactory>
{
    private readonly TestWebApplicationFactory _factory;
    private readonly IServiceScope _scope;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFlightService _flightService;
    
    public FlightManagementIntegrationTests(TestWebApplicationFactory factory)
    {
        _factory = factory;
        _scope = _factory.Services.CreateScope();
        _unitOfWork = _scope.ServiceProvider.GetRequiredService<IUnitOfWork>();
        _flightService = _scope.ServiceProvider.GetRequiredService<IFlightService>();
    }
    
    [Fact]
    public async Task CompleteFlightJourney_FromArrivalToDeparture_Success()
    {
        // Arrange
        await SeedTestDataAsync();
        var flightNumber = "TEST123";
        
        // Act & Assert - Step by step flight journey
        
        // 1. Create flight
        var createRequest = new CreateFlightRequest
        {
            FlightNumber = flightNumber,
            AirlineName = "Test Airlines",
            AircraftType = AircraftType.B737,
            ContractId = "CT001"
        };
        
        var createResult = await _flightService.CreateFlightAsync(createRequest);
        Assert.True(createResult.IsSuccess);
        
        // 2. Assign stand
        var assignStandResult = await _flightService.AssignStandAsync(flightNumber, "A1");
        Assert.True(assignStandResult.IsSuccess);
        
        // 3. Assign runway
        var assignRunwayResult = await _flightService.AssignRunwayAsync(flightNumber, "09L");
        Assert.True(assignRunwayResult.IsSuccess);
        
        // 4. Process landing
        var landingResult = await _flightService.ProcessLandingAsync(flightNumber);
        Assert.True(landingResult.IsSuccess);
        
        // 5. Assign ground services
        var groundServicesResult = await _flightService.AssignGroundServicesAsync(
            flightNumber, 
            new List<ServiceType> { ServiceType.Fuel, ServiceType.Cleaning, ServiceType.Baggage });
        Assert.True(groundServicesResult.IsSuccess);
        
        // 6. Complete ground services (simulate)
        // ... simulate timer completion
        
        // 7. Process takeoff
        var takeoffResult = await _flightService.ProcessTakeOffAsync(flightNumber);
        Assert.True(takeoffResult.IsSuccess);
        
        // Verify final state
        var finalFlight = await _unitOfWork.Flights.GetByFlightNumberAsync(flightNumber);
        Assert.NotNull(finalFlight);
        Assert.Equal(FlightStatus.Departure, finalFlight.Status);
    }
    
    private async Task SeedTestDataAsync()
    {
        // Seed test data for integration tests
        var dataSeeder = _scope.ServiceProvider.GetRequiredService<DataSeedService>();
        await dataSeeder.SeedDataAsync();
    }
    
    public void Dispose()
    {
        _scope?.Dispose();
    }
}
```

---

## Performance Considerations

### Caching Strategy

```csharp
public class CachedFlightRepository : IFlightRepository
{
    private readonly IFlightRepository _inner;
    private readonly IMemoryCache _cache;
    private readonly TimeSpan _cacheDuration = TimeSpan.FromMinutes(5);
    
    public CachedFlightRepository(IFlightRepository inner, IMemoryCache cache)
    {
        _inner = inner;
        _cache = cache;
    }
    
    public async Task<Flight?> GetByFlightNumberAsync(string flightNumber)
    {
        var cacheKey = $"flight_{flightNumber}";
        
        if (_cache.TryGetValue(cacheKey, out Flight? cachedFlight))
        {
            return cachedFlight;
        }
        
        var flight = await _inner.GetByFlightNumberAsync(flightNumber);
        if (flight != null)
        {
            _cache.Set(cacheKey, flight, _cacheDuration);
        }
        
        return flight;
    }
    
    public async Task UpdateAsync(Flight flight)
    {
        await _inner.UpdateAsync(flight);
        
        // Invalidate cache
        var cacheKey = $"flight_{flight.FlightNumber}";
        _cache.Remove(cacheKey);
    }
    
    // Implement other methods...
}
```

### Performance Monitoring

```csharp
public class PerformanceMonitoringService
{
    private readonly ILogger<PerformanceMonitoringService> _logger;
    private readonly ConcurrentDictionary<string, PerformanceMetric> _metrics = new();
    
    public void StartOperation(string operationName)
    {
        var metric = new PerformanceMetric
        {
            OperationName = operationName,
            StartTime = DateTime.UtcNow
        };
        
        _metrics[Thread.CurrentThread.ManagedThreadId + "_" + operationName] = metric;
    }
    
    public void EndOperation(string operationName)
    {
        var key = Thread.CurrentThread.ManagedThreadId + "_" + operationName;
        if (_metrics.TryRemove(key, out var metric))
        {
            metric.EndTime = DateTime.UtcNow;
            metric.Duration = metric.EndTime - metric.StartTime;
            
            if (metric.Duration.TotalMilliseconds > 1000) // Log slow operations
            {
                _logger.LogWarning("Slow operation detected: {OperationName} took {Duration}ms", 
                    operationName, metric.Duration.TotalMilliseconds);
            }
            
            _logger.LogDebug("Operation completed: {OperationName} in {Duration}ms", 
                operationName, metric.Duration.TotalMilliseconds);
        }
    }
}

public class PerformanceMetric
{
    public string OperationName { get; set; } = string.Empty;
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public TimeSpan Duration { get; set; }
}
```

---

## Deployment Guide

### Application Startup Configuration

```csharp
public class Startup
{
    public static async Task Main(string[] args)
    {
        // Configure logging
        Log.Logger = new LoggerConfiguration()
            .WriteTo.Console()
            .WriteTo.File("logs/airport-management-.log", rollingInterval: RollingInterval.Day)
            .CreateLogger();
        
        try
        {
            // Build service container
            var serviceProvider = ConfigureServices();
            
            // Initialize data
            await InitializeDataAsync(serviceProvider);
            
            // Start application
            var app = serviceProvider.GetRequiredService<AirportManagementApplication>();
            await app.RunAsync();
        }
        catch (Exception ex)
        {
            Log.Fatal(ex, "Application terminated unexpectedly");
        }
        finally
        {
            Log.CloseAndFlush();
        }
    }
    
    private static ServiceProvider ConfigureServices()
    {
        var services = new ServiceCollection();
        
        // Logging
        services.AddLogging(builder => builder.AddSerilog());
        
        // Repositories
        services.AddSingleton<IFlightRepository, InMemoryFlightRepository>();
        services.AddSingleton<IContractRepository, InMemoryContractRepository>();
        services.AddSingleton<IStandRepository, InMemoryStandRepository>();
        services.AddSingleton<IRunwayRepository, InMemoryRunwayRepository>();
        services.AddSingleton<IGroundServiceRepository, InMemoryGroundServiceRepository>();
        services.AddSingleton<IUserRepository, InMemoryUserRepository>();
        services.AddSingleton<IAirportRepository, InMemoryAirportRepository>();
        services.AddSingleton<IActivityLogRepository, InMemoryActivityLogRepository>();
        
        // Unit of Work
        services.AddScoped<IUnitOfWork, UnitOfWork>();
        
        // Services
        services.AddScoped<IFlightService, FlightService>();
        services.AddScoped<IContractService, ContractService>();
        services.AddScoped<IResourceService, ResourceService>();
        services.AddScoped<IGroundService, GroundService>();
        services.AddScoped<IAuthenticationService, AuthenticationService>();
        services.AddScoped<ITimerService, TimerService>();
        services.AddScoped<INotificationService, NotificationService>();
        
        // Utilities
        services.AddSingleton<IPasswordHasher, BCryptPasswordHasher>();
        services.AddSingleton<ErrorHandler>();
        services.AddSingleton<DataSeedService>();
        services.AddMemoryCache();
        
        // Application
        services.AddScoped<AirportManagementApplication>();
        
        // Validators
        services.AddScoped<IValidator<Flight>, FlightValidator>();
        services.AddScoped<IValidator<Contract>, ContractValidator>();
        services.AddScoped<IValidator<User>, UserValidator>();
        
        return services.BuildServiceProvider();
    }
    
    private static async Task InitializeDataAsync(ServiceProvider serviceProvider)
    {
        var dataSeeder = serviceProvider.GetRequiredService<DataSeedService>();
        await dataSeeder.SeedDataAsync();
    }
}
```

### Configuration Files

```json
// appsettings.json
{
  "AirportSettings": {
    "AirportCode": "LHR",
    "AirportName": "London Heathrow Airport",
    "MaxStands": 50,
    "MaxRunways": 4,
    "ContractCapacity": 100,
    "Currency": "GBP"
  },
  "SecuritySettings": {
    "PasswordMinLength": 8,
    "PasswordMaxLength": 12,
    "RequireSpecialCharacters": true,
    "RequireUppercase": true,
    "RequireNumbers": true,
    "SessionTimeoutMinutes": 30
  },
  "PerformanceSettings": {
    "CacheDurationMinutes": 5,
    "MaxConcurrentOperations": 10,
    "SlowOperationThresholdMs": 1000
  },
  "Serilog": {
    "MinimumLevel": {
      "Default": "Information",
      "Override": {
        "Microsoft": "Warning",
        "System": "Warning"
      }
    },
    "WriteTo": [
      {
        "Name": "Console",
        "Args": {
          "outputTemplate": "{Timestamp:HH:mm:ss} [{Level:u3}] {Message:lj}{NewLine}{Exception}"
        }
      },
      {
        "Name": "File",
        "Args": {
          "path": "logs/airport-management-.log",
          "rollingInterval": "Day",
          "retainedFileCountLimit": 30
        }
      }
    ]
  }
}
```

---

## Future Enhancements

### Phase 2 Features

1. **Real-time Weather Integration**
    
    - API integration with weather services
    - Weather-based operational decisions
    - Automated runway closure for severe weather
2. **Advanced Scheduling**
    
    - Predictive analytics for delays
    - Automated resource optimization
    - Machine learning for demand forecasting
3. **Multi-Airport Support**
    
    - Support for multiple airport configurations
    - Inter-airport flight transfers
    - Centralized management dashboard
4. **Mobile Integration**
    
    - REST API development
    - Mobile app for ground staff
    - Real-time notifications and alerts
    - QR code scanning for equipment tracking

### Phase 3 Features

1. **Advanced Analytics Dashboard**
    
    - Revenue analytics and forecasting
    - Operational efficiency metrics
    - Resource utilization reports
    - Historical trend analysis
2. **Integration Capabilities**
    
    - RFID baggage tracking
    - Biometric passenger processing
    - External airline systems integration
    - Government regulatory reporting
3. **AI and Machine Learning**
    
    - Predictive maintenance scheduling
    - Intelligent resource allocation
    - Anomaly detection for security
    - Automated decision making

### Database Migration Path

```csharp
public interface IDatabaseMigrationService
{
    Task MigrateToSqlServerAsync();
    Task MigrateToPostgreSqlAsync();
    Task BackupDataAsync(string backupPath);
    Task RestoreDataAsync(string backupPath);
}

// Example Entity Framework implementation
public class DatabaseMigrationService : IDatabaseMigrationService
{
    private readonly IUnitOfWork _inMemoryUnitOfWork;
    private readonly AirportDbContext _dbContext;
    
    public async Task MigrateToSqlServerAsync()
    {
        // Migration logic to SQL Server
        await MigrateEntitiesAsync();
    }
    
    private async Task MigrateEntitiesAsync()
    {
        // Migrate flights
        var flights = await _inMemoryUnitOfWork.Flights.GetAllAsync();
        foreach (var flight in flights)
        {
            _dbContext.Flights.Add(flight);
        }
        
        // Migrate other entities...
        await _dbContext.SaveChangesAsync();
    }
}
```

---

## Appendix

### A. Code Examples

#### Main Application Entry Point

```csharp
public class AirportManagementApplication
{
    private readonly IAuthenticationService _authService;
    private readonly ErrorHandler _errorHandler;
    private readonly ILogger<AirportManagementApplication> _logger;
    
    public AirportManagementApplication(
        IAuthenticationService authService,
        ErrorHandler errorHandler,
        ILogger<AirportManagementApplication> logger)
    {
        _authService = authService;
        _errorHandler = errorHandler;
        _logger = logger;
    }
    
    public async Task RunAsync()
    {
        try
        {
            DisplayWelcomeScreen();
            
            while (true)
            {
                if (!_authService.IsAuthenticated)
                {
                    var loginMenu = new LoginMenu(_serviceProvider, _logger);
                    await loginMenu.DisplayAsync();
                    
                    if (!_authService.IsAuthenticated)
                    {
                        Console.WriteLine("Exiting application...");
                        break;
                    }
                }
                else
                {
                    var mainMenu = new MainMenu(_serviceProvider, _logger);
                    await mainMenu.DisplayAsync();
                    
                    if (!_authService.IsAuthenticated) // User logged out
                        continue;
                }
            }
        }
        catch (Exception ex)
        {
            _errorHandler.HandleException(ex);
        }
    }
    
    private void DisplayWelcomeScreen()
    {
        Console.Clear();
        Console.ForegroundColor = ConsoleColor.Blue;
        Console.WriteLine(@"
    ╔══════════════════════════════════════════════════════════╗
    ║                                                          ║
    ║        🛫 HEATHROW AIRPORT MANAGEMENT SYSTEM 🛬          ║
    ║                                                          ║
    ║              Welcome to LHR Operations Center            ║
    ║                                                          ║
    ╚══════════════════════════════════════════════════════════╝
        ");
        Console.ResetColor();
        Console.WriteLine("\nInitializing system...");
        Thread.Sleep(1000); // Simulate startup time
    }
}
```

#### Sample Menu Implementation

```csharp
public class FlightManagementMenu : BaseMenu
{
    private readonly IFlightService _flightService;
    private readonly IResourceService _resourceService;
    
    public FlightManagementMenu(IServiceProvider serviceProvider, ILogger logger)
        : base(serviceProvider, logger)
    {
        _flightService = serviceProvider.GetRequiredService<IFlightService>();
        _resourceService = serviceProvider.GetRequiredService<IResourceService>();
    }
    
    public override async Task DisplayAsync()
    {
        while (true)
        {
            DisplayHeader("Flight Management");
            
            Console.WriteLine("1. View All Flights");
            Console.WriteLine("2. Sort Flights by Status");
            Console.WriteLine("3. Assign Stand to Flight");
            Console.WriteLine("4. Assign Runway to Flight");
            Console.WriteLine("5. Process Landing");
            Console.WriteLine("6. Process Takeoff");
            Console.WriteLine("7. Assign Ground Services");
            Console.WriteLine("8. Return to Main Menu");
            
            Console.Write("\nSelect an option (1-8): ");
            var choice = Console.ReadLine()?.Trim();
            
            try
            {
                await HandleUserChoiceAsync(choice);
                
                if (choice == "8")
                    break;
                    
                PauseForUser();
            }
            catch (Exception ex)
            {
                var errorHandler = _serviceProvider.GetRequiredService<ErrorHandler>();
                errorHandler.HandleException(ex);
                PauseForUser();
            }
        }
    }
    
    protected override async Task HandleUserChoiceAsync(string choice)
    {
        switch (choice)
        {
            case "1":
                await DisplayAllFlightsAsync();
                break;
            case "2":
                await SortFlightsByStatusAsync();
                break;
            case "3":
                await AssignStandToFlightAsync();
                break;
            case "4":
                await AssignRunwayToFlightAsync();
                break;
            case "5":
                await ProcessLandingAsync();
                break;
            case "6":
                await ProcessTakeoffAsync();
                break;
            case "7":
                await AssignGroundServicesAsync();
                break;
            case "8":
                return; // Return to main menu
            default:
                DisplayError("Invalid option. Please select a number between 1 and 8.");
                break;
        }
    }
    
    private async Task DisplayAllFlightsAsync()
    {
        Console.WriteLine("\nRetrieving all flights...");
        var flights = await _flightService.GetAllFlightsAsync();
        
        if (!flights.Any())
        {
            DisplayWarning("No flights found in the system.");
            return;
        }
        
        ConsoleTableHelper.DisplayTable(flights, "Current Flights",
            f => f.FlightNumber,
            f => f.AirlineName,
            f => f.AircraftType.ToString(),
            f => f.Status.ToString(),
            f => f.AssignedStandId ?? "Not Assigned",
            f => f.ActualRevenue.ToString("C"));
    }
    
    private async Task AssignStandToFlightAsync()
    {
        Console.WriteLine("\n--- Assign Stand to Flight ---");
        
        // Show flights that need stand assignment
        var flightsNeedingStands = await _flightService.GetFlightsByStatusAsync(FlightStatus.Arrival);
        if (!flightsNeedingStands.Any())
        {
            DisplayWarning("No flights currently need stand assignment.");
            return;
        }
        
        Console.WriteLine("\nFlights requiring stand assignment:");
        ConsoleTableHelper.DisplayTable(flightsNeedingStands, "Flights Needing Stands",
            f => f.FlightNumber,
            f => f.AirlineName,
            f => f.AircraftType.ToString());
        
        // Get flight number
        var flightNumber = GetUserInput("Enter flight number to assign stand");
        
        // Get available stands
        var availableStands = await _resourceService.GetAvailableStandsAsync();
        if (!availableStands.Any())
        {
            DisplayError("No stands are currently available.");
            return;
        }
        
        Console.WriteLine("\nAvailable stands:");
        ConsoleTableHelper.DisplayTable(availableStands, "Available Stands",
            s => s.StandId,
            s => s.Type.ToString(),
            s => s.Class.ToString());
        
        // Get stand selection
        var standId = GetUserInput("Enter stand ID to assign");
        
        // Confirm assignment
        if (!GetConfirmation($"Assign stand {standId} to flight {flightNumber}?"))
        {
            DisplayWarning("Stand assignment cancelled.");
            return;
        }
        
        // Process assignment
        var result = await _flightService.AssignStandAsync(flightNumber, standId);
        
        if (result.IsSuccess)
        {
            DisplaySuccess(result.Message);
        }
        else
        {
            DisplayError(result.Message);
        }
    }
}
```

### B. Business Rules Reference

#### Flight State Transitions

```
Arrival → AssignedStand → AssignedRunway → ReadyToLand → Landing → OnStand → 
GroundServiceInProgress → GroundServiceCompleted → ReadyForDeparture → 
TakingOff → Departure
```

#### Resource Allocation Rules

1. **Stand Assignment**
    
    - Large aircraft (A380, B747) require Class A or B stands
    - Cargo aircraft can only use cargo-designated stands
    - Passenger aircraft cannot use cargo stands
    - Only one aircraft per stand at a time
2. **Runway Assignment**
    
    - Only active runways can be assigned
    - Only one aircraft can use a runway for takeoff at a time
    - Landing aircraft have priority over departing aircraft
    - Weather conditions may restrict runway usage
3. **Ground Service Rules**
    
    - Ground services can only be assigned after landing
    - All required services must be completed before departure
    - Service capacity is limited by available workers
    - Service duration varies by aircraft type and service type

#### Contract Management Rules

1. **Contract Assignment**
    
    - Cannot exceed total contract capacity
    - Contract must be available (not already assigned)
    - Contract expiration must be in the future
    - Revenue calculation includes all associated fees
2. **Contract Cancellation**
    
    - Active flights prevent contract cancellation
    - Cancellation may incur penalties
    - Cancelled contracts can be reactivated if still valid

### C. Error Code Reference

| Error Code              | Description                                  | Suggested Action              |
| ----------------------- | -------------------------------------------- | ----------------------------- |
| FLIGHT_NOT_FOUND        | Flight with specified number doesn't exist   | Verify flight number          |
| RESOURCE_UNAVAILABLE    | Requested resource is not available          | Check resource status         |
| INVALID_FLIGHT_STATE    | Flight is not in correct state for operation | Check flight status           |
| BUSINESS_RULE_VIOLATION | Operation violates business rules            | Review operation requirements |
| VALIDATION_ERROR        | Input validation failed                      | Check input format            |
| INSUFFICIENT_FUNDS      | Not enough revenue for operation             | Check airport revenue         |
| CONTRACT_EXPIRED        | Contract has expired                         | Renew or replace contract     |
| CAPACITY_EXCEEDED       | Operation would exceed capacity limits       | Check capacity constraints    |

### D. Performance Benchmarks

|Operation|Target Time|Acceptable Time|Action Required|
|---|---|---|---|
|Flight Search|< 100ms|< 500ms|> 500ms investigate|
|Stand Assignment|< 200ms|< 1s|> 1s investigate|
|Contract Loading|< 150ms|< 750ms|> 750ms investigate|
|Report Generation|< 1s|< 5s|> 5s investigate|
|Data Export|< 2s|< 10s|> 10s investigate|

### E. Troubleshooting Guide

#### Common Issues and Solutions

1. **"Flight cannot land" Error**
    
    - Verify flight has assigned stand and runway
    - Check flight status is "ReadyToLand"
    - Ensure runway is available and active
2. **Stand Assignment Fails**
    
    - Verify stand is available
    - Check stand type compatibility with aircraft
    - Ensure flight is in "Arrival" status
3. **Ground Service Assignment Issues**
    
    - Confirm flight has landed
    - Check service worker availability
    - Verify sufficient budget for service costs
4. **Performance Issues**
    
    - Check system memory usage
    - Review log files for slow operations
    - Consider implementing caching for frequently accessed data

---

## Conclusion

This technical documentation provides a comprehensive foundation for building the Heathrow Airport Management System. The architecture emphasizes:

- **Clean Code Principles**: Separation of concerns, SOLID principles, and maintainable design
- **Scalability**: Repository pattern and service layer for easy extension
- **Reliability**: Comprehensive error handling and validation
- **Testability**: Dependency injection and mocking-friendly design
- **User Experience**: Enhanced console interface with clear feedback

The system is designed to be production-ready while remaining educational and demonstrating best practices in C# application development.