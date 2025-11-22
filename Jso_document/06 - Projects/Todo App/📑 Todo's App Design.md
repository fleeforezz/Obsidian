
We'll cover the following

+ [🎯 Project Overview](#🎯-project-overview)
+ [ 🛠️Technology Stack](#🛠️-technology-stack)
+ [🏗️ System Architecture](#🏗️-system-architecture)
+ [🎨 Database Design](#🎨-database-design)
+ [📚 Document References](#📚-document-references)

## 🎯 Project Overview

Todo’s is a lightweight and intuitive task management app designed to help you stay organized every day. With a clean interface and smooth workflow, you can create, edit, and track your tasks effortlessly — staying focused on what really matters.

A Windows desktop application built using WPF (Windows Presentation Foundation) with the MVVM (Model–View–ViewModel) architecture.

![[logo.png]]
## 🛠️ Technology Stack

+ .NET 10.0 - Main Framework
+ WinUI with MVVM architecture - UI
+ Entity Framework Core - ORM
+ MSSQL Server - Database
+ BCrypt.NET - Securely hashing and Verifying passwords
## 🏗️ System Architecture

```
[ WinUi  MVVM Application ]
   ↓
[ Database (MSSQL) ]
   ↓
[ File Storage (Local / S3 / MinIO) ]
```
## 🎨 Database Design

Our system will have total 4 Entities:

+ Users: User management and authorization
+ Tasks: Store tasks for each user
+ Tags: Store tags for each task
+ Importants: Store the which task is important

```mermaid
erDiagram
    %% === Core Entities ===
    Users {
        Gui UserId
        string UserName
        string Password
        string Email
        string CoverImage
        bit IsActive
        datetime CreatedTime
        datetime UpdatedTime
    }

    Tasks {
        Guid TaskId
        Guid UserId
        Guid TagId
        string Title
        string Description
        bit IsComplete
        bit IsImportant
        bit IsActive
        datetime DueDate
        datetime CreatedTime
        datetime UpdatedTime
    }

    Tags {
        Guid TagId
        Guid UserId
        string TagName
        datetime CreatedTime
        datetime UpdatedTime
    }

    %% === Relationships ===
    Users ||--o{ Tasks : "creates"
    Users ||--o{ Tags : "creates"

    Tasks ||--o{ Tags : "has"

```

## 📑 Flowchart
### 1. Create Task Flow

```mermaid
flowchart TD
    A[User Opens App] --> B[Click 'Add Todo']
    B --> C[Enter Todo Title & Description]
    C --> D[Select Tags]
    D --> E[Set Priority / Important?]
    E --> F[Choose Reminder Time]
    F --> G[Click Save]
  
    G --> H{Valid Input?}
    H -->|No| I[Show Error Message]
    I --> C

    H -->|Yes| J[Create Task in Database]
    J --> K[Attach Tags]
    K --> L[Attach Important Flag]
    L --> M[Schedule Reminder]
    M --> N[Return Success]

    N --> O[Show Task in List]
```

### 2. Reminder Scheduling Flow

```mermaid
flowchart TD
    A[User Sets Reminder Time] --> B[Convert Reminder to UTC]
    B --> C[Create Reminder Record in Database]
    C --> D[Register Reminder Job]
    D --> E{Is using background scheduler?}

    E -->|Yes| F[Store job in Scheduler Service]
    E -->|No| G[Use System Notifications API]

    F --> H[Wait Until Time Reached]
    G --> H

    H --> I[Trigger Notification]
    I --> J[Mark Reminder as Sent]
```

## State Machine Diagram
```mermaid
stateDiagram-v2
    [*] --> Draft : Start Creating Todo
    Draft --> Editing : User enters details
    Editing --> Validating : User clicks Save
    Validating --> Error : Missing data
    Error --> Editing : User corrects input

    Validating --> Saved : Valid Todo

    Saved --> Scheduled : Reminder time set
    Saved --> Completed : User marks Done

    Scheduled --> ReminderTriggered : Time reached
    ReminderTriggered --> Completed : User completes after notification

    Completed --> Archived : User archives Todo
```

## Sequence Diagram
```mermaid
sequenceDiagram
    actor User
    participant UI as WinUI/WPF UI
    participant VM as ViewModel
    participant BLL as Business Logic
    participant DAL as Data Access Layer
    participant SCH as Reminder Scheduler

    User ->> UI: Click "Add Todo"
    UI ->> VM: Open CreateTodo form
    User ->> VM: Enter details + reminder
    VM ->> BLL: Validate Todo
    BLL -->> VM: Valid/Invalid

    VM ->> BLL: Save Todo
    BLL ->> DAL: Insert Todo into DB
    DAL -->> BLL: TodoId returned
    BLL -->> VM: Todo saved successfully

    alt Reminder Set
        VM ->> BLL: Register reminder
        BLL ->> SCH: Schedule reminder job
        SCH -->> BLL: Reminder scheduled
    end

    VM -->> UI: Show success message
    UI -->> User: Todo created!

```
## 📚 Document References
### Project Documentation
+ [⚙️ Project Main Flow](MAIN_FLOW.md)
+ [📰 Features](FEATURE.MD)
+ [🗄️ Database Overview](DATABASE.md)
