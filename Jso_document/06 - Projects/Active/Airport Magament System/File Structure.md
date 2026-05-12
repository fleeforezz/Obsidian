## 🏗️ **Architecture Layers**

### **Domain Layer** (`AirportManagement.Domain`)

- **Pure business logic** - No dependencies on external frameworks
- **Entities, Value Objects, Enums** - Core business models
- **Domain Events** - For decoupled communication
- **Specifications** - Business rule encapsulation
- **Custom Exceptions** - Domain-specific error handling

### **Application Layer** (`AirportManagement.Application`)

- **Service Interfaces & Implementations** - Business use cases
- **DTOs** - Data transfer objects for requests/responses
- **Validators** - Input validation logic
- **Mappings** - Object-to-object mappings

### **Infrastructure Layer** (`AirportManagement.Infrastructure`)

- **Repository Implementations** - Data access logic
- **External Services** - Third-party integrations
- **Caching, Security, Monitoring** - Cross-cutting concerns

### **Console Layer** (`AirportManagement.Console`)

- **Menu System** - User interface components
- **UI Components** - Tables, progress bars, formatters
- **Configuration** - App settings and themes

### **Shared Layer** (`AirportManagement.Shared`)

- **Common utilities** - Extensions, helpers, constants
- **Cross-cutting models** - Used across multiple layers

## 🎯 **Key Benefits**

### **1. Maintainability**

- Each class has a single responsibility
- Clear dependency flow (Domain ← Application ← Infrastructure)
- Easy to locate and modify specific functionality

### **2. Testability**

- Comprehensive test structure for each layer
- Mocking-friendly interfaces
- Integration test scenarios

### **3. Scalability**

- Easy to add new features without affecting existing code
- Plugin architecture for extending functionality
- Clear boundaries between layers

### **4. Team Collaboration**

- Organized by feature and layer
- Consistent naming conventions
- Clear project dependencies

## 🚀 **Getting Started Steps**

1. **Create the solution structure** using the provided layout
2. **Start with Domain layer** - Define your core entities first
3. **Build Application layer** - Implement business services
4. **Add Infrastructure** - Create repository implementations
5. **Develop Console UI** - Build the user interface
6. **Write Tests** - Add comprehensive test coverage

## 📦 **Project Dependencies**

```
Console → Application → Domain
Console → Infrastructure → Application
Infrastructure → Domain
Shared → (Referenced by all)
```

## Project Structure Overview
```
AirportManagementSystem/
├── src/
│   ├── AirportManagement.Domain/
│   ├── AirportManagement.Application/
│   ├── AirportManagement.Infrastructure/
│   ├── AirportManagement.Console/
│   └── AirportManagement.Shared/
├── tests/
│   ├── AirportManagement.Domain.Tests/
│   ├── AirportManagement.Application.Tests/
│   ├── AirportManagement.Infrastructure.Tests/
│   └── AirportManagement.Integration.Tests/
├── docs/
├── scripts/
├── .gitignore
├── README.md
├── AirportManagementSystem.sln
└── Directory.Build.props
```

## Detailed Project Structure
#### 1. Domain Layer (`AirportManagement.Domain`)

```
AirportManagement.Domain/
├── Entities/
│   ├── Base/
│   │   ├── Entity.cs
│   │   ├── AggregateRoot.cs
│   │   └── IAuditable.cs
│   ├── Airport/
│   │   ├── Airport.cs
│   │   ├── Stand.cs
│   │   └── Runway.cs
│   ├── Flight/
│   │   ├── Flight.cs
│   │   ├── FlightRoute.cs
│   │   └── FlightSchedule.cs
│   ├── Contract/
│   │   ├── Contract.cs
│   │   ├── ContractEconomy.cs
│   │   ├── ContractDetails.cs
│   │   └── AircraftInfo.cs
│   ├── Service/
│   │   ├── GroundService.cs
│   │   ├── GroundServiceAssignment.cs
│   │   └── HandlingCrew.cs
│   ├── User/
│   │   ├── User.cs
│   │   └── UserSession.cs
│   └── Logging/
│       └── ActivityLog.cs
├── ValueObjects/
│   ├── FlightNumber.cs
│   ├── EmailAddress.cs
│   ├── Password.cs
│   ├── Money.cs
│   ├── PhoneNumber.cs
│   └── AirportCode.cs
├── Enums/
│   ├── FlightStatus.cs
│   ├── StandType.cs
│   ├── StandClass.cs
│   ├── ContractType.cs
│   ├── ContractStatus.cs
│   ├── ServiceType.cs
│   ├── AircraftType.cs
│   └── LogType.cs
├── Events/
│   ├── Base/
│   │   ├── IDomainEvent.cs
│   │   └── DomainEvent.cs
│   ├── FlightEvents/
│   │   ├── FlightCreatedEvent.cs
│   │   ├── FlightLandedEvent.cs
│   │   ├── FlightDepartedEvent.cs
│   │   ├── StandAssignedEvent.cs
│   │   └── RunwayAssignedEvent.cs
│   ├── ContractEvents/
│   │   ├── ContractAssignedEvent.cs
│   │   ├── ContractCancelledEvent.cs
│   │   └── ContractExpiringEvent.cs
│   └── ServiceEvents/
│       ├── GroundServiceStartedEvent.cs
│       └── GroundServiceCompletedEvent.cs
├── Exceptions/
│   ├── Base/
│   │   └── AirportManagementException.cs
│   ├── FlightNotFoundException.cs
│   ├── ResourceUnavailableException.cs
│   ├── InvalidFlightStateException.cs
│   ├── BusinessRuleViolationException.cs
│   ├── ContractNotFoundException.cs
│   └── InsufficientFundsException.cs
├── Specifications/
│   ├── Base/
│   │   ├── ISpecification.cs
│   │   ├── Specification.cs
│   │   └── CompositeSpecification.cs
│   ├── FlightSpecifications/
│   │   ├── FlightByStatusSpecification.cs
│   │   ├── FlightRequiringStandSpecification.cs
│   │   └── FlightReadyForDepartureSpecification.cs
│   ├── ContractSpecifications/
│   │   ├── ActiveContractSpecification.cs
│   │   ├── ExpiredContractSpecification.cs
│   │   └── AvailableContractSpecification.cs
│   └── ResourceSpecifications/
│       ├── AvailableStandSpecification.cs
│       └── CompatibleStandSpecification.cs
├── Interfaces/
│   ├── Repositories/
│   │   ├── Base/
│   │   │   └── IRepository.cs
│   │   ├── IFlightRepository.cs
│   │   ├── IContractRepository.cs
│   │   ├── IStandRepository.cs
│   │   ├── IRunwayRepository.cs
│   │   ├── IGroundServiceRepository.cs
│   │   ├── IUserRepository.cs
│   │   ├── IAirportRepository.cs
│   │   ├── IActivityLogRepository.cs
│   │   └── IUnitOfWork.cs
│   └── Services/
│       ├── IDomainEventDispatcher.cs
│       └── IDateTimeProvider.cs
├── Constants/
│   ├── ValidationConstants.cs
│   ├── BusinessConstants.cs
│   └── SystemConstants.cs
└── AirportManagement.Domain.csproj
```

#### 2. Application Layer (`AirportManagement.Application`)

```
AirportManagement.Application/
├── Services/
│   ├── Interfaces/
│   │   ├── IFlightService.cs
│   │   ├── IContractService.cs
│   │   ├── IResourceService.cs
│   │   ├── IGroundService.cs
│   │   ├── IAuthenticationService.cs
│   │   ├── ITimerService.cs
│   │   ├── INotificationService.cs
│   │   ├── IReportService.cs
│   │   └── IDataSeedService.cs
│   ├── Implementations/
│   │   ├── FlightService.cs
│   │   ├── ContractService.cs
│   │   ├── ResourceService.cs
│   │   ├── GroundService.cs
│   │   ├── AuthenticationService.cs
│   │   ├── TimerService.cs
│   │   ├── NotificationService.cs
│   │   ├── ReportService.cs
│   │   └── DataSeedService.cs
│   └── Base/
│       └── BaseService.cs
├── DTOs/
│   ├── Requests/
│   │   ├── Flight/
│   │   │   ├── CreateFlightRequest.cs
│   │   │   ├── AssignStandRequest.cs
│   │   │   ├── AssignRunwayRequest.cs
│   │   │   └── AssignGroundServiceRequest.cs
│   │   ├── Contract/
│   │   │   ├── AssignContractRequest.cs
│   │   │   └── CancelContractRequest.cs
│   │   ├── Auth/
│   │   │   ├── LoginRequest.cs
│   │   │   ├── RegisterRequest.cs
│   │   │   └── ChangePasswordRequest.cs
│   │   └── Service/
│   │       ├── PurchaseWorkersRequest.cs
│   │       └── CancelWorkersRequest.cs
│   ├── Responses/
│   │   ├── Base/
│   │   │   ├── ServiceResult.cs
│   │   │   ├── ServiceResultT.cs
│   │   │   └── PagedResult.cs
│   │   ├── Flight/
│   │   │   ├── FlightDto.cs
│   │   │   ├── FlightDetailsDto.cs
│   │   │   └── FlightSummaryDto.cs
│   │   ├── Contract/
│   │   │   ├── ContractDto.cs
│   │   │   ├── ContractDetailsDto.cs
│   │   │   └── ContractSummaryDto.cs
│   │   ├── Resource/
│   │   │   ├── StandDto.cs
│   │   │   ├── RunwayDto.cs
│   │   │   └── ResourceUtilizationDto.cs
│   │   ├── Service/
│   │   │   ├── GroundServiceDto.cs
│   │   │   └── ServiceAssignmentDto.cs
│   │   ├── Auth/
│   │   │   ├── LoginResponse.cs
│   │   │   └── UserDto.cs
│   │   └── Report/
│   │       ├── AirportOverviewDto.cs
│   │       ├── RevenueReportDto.cs
│   │       └── OperationalReportDto.cs
│   └── Common/
│       ├── PaginationDto.cs
│       └── FilterDto.cs
├── Validators/
│   ├── Base/
│   │   ├── IValidator.cs
│   │   ├── ValidationResult.cs
│   │   └── ValidationError.cs
│   ├── FlightValidators/
│   │   ├── FlightValidator.cs
│   │   ├── CreateFlightValidator.cs
│   │   └── AssignStandValidator.cs
│   ├── ContractValidators/
│   │   ├── ContractValidator.cs
│   │   └── AssignContractValidator.cs
│   ├── AuthValidators/
│   │   ├── LoginValidator.cs
│   │   ├── RegisterValidator.cs
│   │   └── UserValidator.cs
│   └── ServiceValidators/
│       └── GroundServiceValidator.cs
├── Mappings/
│   ├── FlightMappings.cs
│   ├── ContractMappings.cs
│   ├── ResourceMappings.cs
│   ├── ServiceMappings.cs
│   ├── AuthMappings.cs
│   └── ReportMappings.cs
├── Extensions/
│   ├── ServiceCollectionExtensions.cs
│   ├── EntityExtensions.cs
│   └── ValidationExtensions.cs
├── Helpers/
│   ├── PasswordHelper.cs
│   ├── RevenueCalculationHelper.cs
│   ├── TimeCalculationHelper.cs
│   └── FormatHelper.cs
└── AirportManagement.Application.csproj
```

#### 3. Infrastructure Layer (`AirportManagement.Infrastructure`)

```
AirportManagement.Infrastructure/
├── Repositories/
│   ├── Base/
│   │   ├── Repository.cs
│   │   └── InMemoryRepository.cs
│   ├── InMemory/
│   │   ├── InMemoryFlightRepository.cs
│   │   ├── InMemoryContractRepository.cs
│   │   ├── InMemoryStandRepository.cs
│   │   ├── InMemoryRunwayRepository.cs
│   │   ├── InMemoryGroundServiceRepository.cs
│   │   ├── InMemoryUserRepository.cs
│   │   ├── InMemoryAirportRepository.cs
│   │   └── InMemoryActivityLogRepository.cs
│   ├── EntityFramework/ (Future enhancement)
│   │   ├── EfFlightRepository.cs
│   │   ├── EfContractRepository.cs
│   │   └── AirportDbContext.cs
│   ├── Cached/
│   │   ├── CachedFlightRepository.cs
│   │   ├── CachedContractRepository.cs
│   │   └── CachedResourceRepository.cs
│   └── UnitOfWork/
│       ├── UnitOfWork.cs
│       └── InMemoryUnitOfWork.cs
├── Services/
│   ├── Security/
│   │   ├── BCryptPasswordHasher.cs
│   │   ├── SecurityService.cs
│   │   └── TokenService.cs
│   ├── Notification/
│   │   ├── ConsoleNotificationService.cs
│   │   ├── EmailNotificationService.cs
│   │   └── SmsNotificationService.cs
│   ├── Timing/
│   │   ├── SystemTimerService.cs
│   │   ├── DateTimeProvider.cs
│   │   └── SchedulingService.cs
│   ├── Caching/
│   │   ├── MemoryCacheService.cs
│   │   └── CacheKeyGenerator.cs
│   └── External/
│       ├── WeatherService.cs
│       └── CurrencyService.cs
├── Data/
│   ├── Seed/
│   │   ├── DataSeeder.cs
│   │   ├── AirportDataSeeder.cs
│   │   ├── FlightDataSeeder.cs
│   │   ├── ContractDataSeeder.cs
│   │   └── UserDataSeeder.cs
│   ├── Configurations/
│   │   ├── AppSettings.cs
│   │   ├── SecuritySettings.cs
│   │   ├── PerformanceSettings.cs
│   │   └── AirportSettings.cs
│   └── Storage/
│       ├── InMemoryStorage.cs
│       ├── FileStorage.cs
│       └── DatabaseStorage.cs
├── Monitoring/
│   ├── PerformanceMonitoringService.cs
│   ├── HealthCheckService.cs
│   └── MetricsCollector.cs
├── Extensions/
│   ├── ServiceCollectionExtensions.cs
│   ├── ConfigurationExtensions.cs
│   └── LoggingExtensions.cs
└── AirportManagement.Infrastructure.csproj
```

#### 4. Console Application Layer (`AirportManagement.Console`)

```
AirportManagement.Console/
├── Program.cs
├── Startup.cs
├── Menus/
│   ├── Base/
│   │   ├── BaseMenu.cs
│   │   ├── IMenu.cs
│   │   └── MenuResult.cs
│   ├── Authentication/
│   │   ├── LoginMenu.cs
│   │   ├── RegisterMenu.cs
│   │   └── AuthenticationMenu.cs
│   ├── Main/
│   │   ├── MainMenu.cs
│   │   ├── AirportOverviewMenu.cs
│   │   └── DashboardMenu.cs
│   ├── Flight/
│   │   ├── FlightManagementMenu.cs
│   │   ├── FlightListMenu.cs
│   │   ├── FlightDetailsMenu.cs
│   │   ├── StandAssignmentMenu.cs
│   │   ├── RunwayAssignmentMenu.cs
│   │   └── GroundServiceMenu.cs
│   ├── Contract/
│   │   ├── ContractManagementMenu.cs
│   │   ├── ContractListMenu.cs
│   │   ├── ContractDetailsMenu.cs
│   │   ├── AssignContractMenu.cs
│   │   └── CancelContractMenu.cs
│   ├── Service/
│   │   ├── ServiceManagementMenu.cs
│   │   ├── GroundServiceManagementMenu.cs
│   │   └── HandlingCrewMenu.cs
│   ├── Reports/
│   │   ├── ReportsMenu.cs
│   │   ├── FlightReportsMenu.cs
│   │   ├── ContractReportsMenu.cs
│   │   └── RevenueReportsMenu.cs
│   └── Logs/
│       ├── LogsMenu.cs
│       ├── ContractLogsMenu.cs
│       ├── AirplaneLogsMenu.cs
│       └── ActivityLogsMenu.cs
├── UI/
│   ├── Components/
│   │   ├── ConsoleTable.cs
│   │   ├── ProgressBar.cs
│   │   ├── StatusIndicator.cs
│   │   ├── InputField.cs
│   │   └── ConfirmationDialog.cs
│   ├── Formatters/
│   │   ├── FlightFormatter.cs
│   │   ├── ContractFormatter.cs
│   │   ├── CurrencyFormatter.cs
│   │   ├── DateTimeFormatter.cs
│   │   └── StatusFormatter.cs
│   ├── Themes/
│   │   ├── ConsoleTheme.cs
│   │   ├── ColorScheme.cs
│   │   └── Symbols.cs
│   └── Utilities/
│       ├── ConsoleHelper.cs
│       ├── InputValidator.cs
│       └── OutputRenderer.cs
├── Configuration/
│   ├── ConsoleConfiguration.cs
│   └── MenuConfiguration.cs
├── Extensions/
│   ├── ConsoleExtensions.cs
│   └── MenuExtensions.cs
├── Assets/
│   ├── welcome.txt
│   └── logo.txt
├── appsettings.json
├── appsettings.Development.json
└── AirportManagement.Console.csproj
```

#### 5. Shared Layer (`AirportManagement.Shared`)

```
AirportManagement.Shared/
├── Constants/
│   ├── ApplicationConstants.cs
│   ├── ErrorMessages.cs
│   ├── ValidationMessages.cs
│   └── SuccessMessages.cs
├── Extensions/
│   ├── StringExtensions.cs
│   ├── DateTimeExtensions.cs
│   ├── DecimalExtensions.cs
│   ├── EnumExtensions.cs
│   └── CollectionExtensions.cs
├── Helpers/
│   ├── ValidationHelper.cs
│   ├── FormatHelper.cs
│   ├── CalculationHelper.cs
│   └── ConversionHelper.cs
├── Models/
│   ├── Common/
│   │   ├── Result.cs
│   │   ├── Error.cs
│   │   └── PagedList.cs
│   └── Configuration/
│       ├── DatabaseConfiguration.cs
│       └── LoggingConfiguration.cs
├── Utilities/
│   ├── FileHelper.cs
│   ├── JsonHelper.cs
│   ├── CryptoHelper.cs
│   └── RandomHelper.cs
└── AirportManagement.Shared.csproj
```

#### 6. Test Projects Structure

##### Unit Tests (`AirportManagement.Domain.Tests`)

```
AirportManagement.Domain.Tests/
├── Entities/
│   ├── FlightTests.cs
│   ├── ContractTests.cs
│   ├── StandTests.cs
│   └── UserTests.cs
├── ValueObjects/
│   ├── FlightNumberTests.cs
│   ├── EmailAddressTests.cs
│   └── PasswordTests.cs
├── Specifications/
│   ├── FlightSpecificationTests.cs
│   └── ContractSpecificationTests.cs
├── Helpers/
│   ├── TestDataBuilder.cs
│   └── EntityFactory.cs
└── AirportManagement.Domain.Tests.csproj
```

##### Application Tests (`AirportManagement.Application.Tests`)

```
AirportManagement.Application.Tests/
├── Services/
│   ├── FlightServiceTests.cs
│   ├── ContractServiceTests.cs
│   ├── ResourceServiceTests.cs
│   └── AuthenticationServiceTests.cs
├── Validators/
│   ├── FlightValidatorTests.cs
│   └── ContractValidatorTests.cs
├── Mappings/
│   ├── FlightMappingTests.cs
│   └── ContractMappingTests.cs
├── Mocks/
│   ├── MockUnitOfWork.cs
│   ├── MockRepositories.cs
│   └── MockServices.cs
└── AirportManagement.Application.Tests.csproj
```

##### Infrastructure Tests (`AirportManagement.Infrastructure.Tests`)

```
AirportManagement.Infrastructure.Tests/
├── Repositories/
│   ├── InMemoryFlightRepositoryTests.cs
│   ├── InMemoryContractRepositoryTests.cs
│   └── UnitOfWorkTests.cs
├── Services/
│   ├── SecurityServiceTests.cs
│   └── CachingServiceTests.cs
├── Data/
│   └── DataSeederTests.cs
└── AirportManagement.Infrastructure.Tests.csproj
```

##### Integration Tests (`AirportManagement.Integration.Tests`)

```
AirportManagement.Integration.Tests/
├── Scenarios/
│   ├── FlightJourneyTests.cs
│   ├── ContractLifecycleTests.cs
│   └── UserWorkflowTests.cs
├── Fixtures/
│   ├── TestApplicationFactory.cs
│   └── DatabaseFixture.cs
└── AirportManagement.Integration.Tests.csproj
```

#### Directory.Build.props

```xml
<Project>
  <PropertyGroup>
    <TargetFramework>net6.0</TargetFramework>
    <LangVersion>10.0</LangVersion>
    <Nullable>enable</Nullable>
    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>
    <WarningsAsErrors />
    <WarningsNotAsErrors>NU1701</WarningsNotAsErrors>
  </PropertyGroup>

  <PropertyGroup>
    <Authors>Airport Management Team</Authors>
    <Company>Heathrow Airport</Company>
    <Product>Airport Management System</Product>
    <Copyright>© 2025 Heathrow Airport. All rights reserved.</Copyright>
    <Version>1.0.0</Version>
  </PropertyGroup>
</Project>
```

#### README.MD

```markdown
# Airport Management System

## Overview
Comprehensive airport management system built with C# following clean architecture principles.

## Getting Started
### Prerequisites
- .NET 6.0 or higher
- Visual Studio 2022 or VS Code

### Installation
1. Clone the repository
2. Restore NuGet packages
3. Build the solution
4. Run the console application

## Project Structure
- **Domain**: Core business logic and entities
- **Application**: Use cases and business services
- **Infrastructure**: Data access and external services
- **Console**: User interface layer
- **Shared**: Common utilities and extensions

## Features
- Flight Management
- Contract Management
- Resource Allocation
- Ground Services
- User Authentication
- Activity Logging

## Testing
- Unit Tests
- Integration Tests
- Performance Tests

## Contributing
Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
```

#### .gitignore

```
## Ignore Visual Studio temporary files, build results, and files generated by add-ons.

# User-specific files
*.rsuser
*.suo
*.user
*.userosscache
*.sln.docstates

# Build results
[Dd]ebug/
[Dd]ebugPublic/
[Rr]elease/
[Rr]eleases/
x64/
x86/
[Aa][Rr][Mm]/
[Aa][Rr][Mm]64/
bld/
[Bb]in/
[Oo]bj/
[Ll]og/
[Ll]ogs/

# .NET Core
project.lock.json
project.fragment.lock.json
artifacts/

# NuGet
*.nuget.props
*.nuget.targets
packages/
!packages/build/

# MSTest test results
TestResults/
[Tt]est[Rr]esult*/
*.coverage
*.coveragexml

# Visual Studio cache files
.vs/

# JetBrains
.idea/

# Application specific
logs/
data/
temp/
*.log
```

## Key Benefits of This Structure:

### 🏗️ **Clean Architecture**

- Clear separation of concerns
- Dependencies point inward
- Easy to test and maintain

### 📁 **Organized by Feature**

- Related files are grouped together
- Easy to navigate and find components
- Scalable structure for team development

### 🧪 **Comprehensive Testing**

- Unit tests for each layer
- Integration tests for workflows
- Mocks and test utilities

### 🔧 **Developer Experience**

- Consistent naming conventions
- Clear project dependencies
- Easy to understand and extend

### 📦 **Production Ready**

- Configuration management
- Logging and monitoring
- Error handling
- Security implementation