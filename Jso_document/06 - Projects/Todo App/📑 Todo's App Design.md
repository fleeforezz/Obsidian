
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

+ .NET 9.0 - Main Framework
+ WPF with MVVM architecture - UI
+ Entity Framework Core - ORM
+ MSSQL Server - Datbase
+ BCrypt.NET - Securely hashing and Verifying passwords
## 🏗️ System Architecture

```

[ WPF MVVM Application ]
   ↓
[ Database (MSSQL) ]
   ↓
[ File Storage (Local / S3 / MinIO) ]
```
## 🎨 Database Design

Our system will have total 3 Entities:

+ Users: User management and authorization
+ Todos: Store todos for each user
+ Category: Store category for each todo
## 📚 Document References
### Project Documentation
+ [⚙️ Project Main Flow](MAIN_FLOW.md)
+ [📰 Features](FEATURE.MD)
+ [🗄️ Database Overview](DATABASE.md)


```mermaid
erDiagram
    %% === Core Entities ===
    Users {
        int UserId
        string UserName
        string Password
        string Email
        string PhoneNumber
        string CoverImage
        datetime CreatedTime
    }

    ServiceCenters {
        int ServiceCenterId
        string Name
        string Address
    }

    WarrantyClaims {
        int ClaimId
        int CustomerVehicleId
        int UserId
        datetime ClaimDate
        string Status
    }

    ClaimDetails {
        int ClaimDetailId
        int ClaimId
        string Description
        string IssueType
    }

    ClaimImages {
        int ImageId
        int ClaimId
        string ImagePath
    }

    Customers {
        int CustomerId
        string FullName
        string Email
        string Phone
    }

    CustomerVehicles {
        int VehicleId
        int CustomerId
        string VIN
        string Model
        string Brand
    }

    VehicleParts {
        int VehiclePartId
        int VehicleId
        int PartId
    }

    Parts {
        int PartId
        string PartName
        string PartNumber
    }

    PartItems {
        int PartItemId
        int PartId
        string SerialNumber
    }

    WorkOrders {
        int WorkOrderId
        int ClaimId
        int UserId
        string Description
    }

    Inventories {
        int InventoryId
        int PartId
        int Quantity
    }

    Policies {
        int PolicyId
        int PartId
        string PolicyName
        string Description
    }

    Campaigns {
        int CampaignId
        string CampaignName
        string Description
    }

    Reports {
        int ReportId
        string ReportType
        datetime GeneratedDate
    }

    %% === Relationships ===
    Users ||--o{ WarrantyClaims : "creates"
    Users ||--o{ WorkOrders : "processes"
    Users ||--o{ Campaigns : "creates"
    Users ||--o{ Inventories : "manages"
    Users ||--o{ ServiceCenters : "belongs to"

    ServiceCenters ||--o{ Users : "has"
    Customers ||--o{ CustomerVehicles : "owns"
    CustomerVehicles ||--o{ VehicleParts : "has"
    CustomerVehicles ||--o{ WarrantyClaims : "linked to"

    WarrantyClaims ||--o{ ClaimDetails : "contains"
    WarrantyClaims ||--o{ ClaimImages : "contains"
    WarrantyClaims ||--|| WorkOrders : "assigned"
    WarrantyClaims ||--o{ Reports : "summarized in"

    Parts ||--o{ PartItems : "has"
    Parts ||--o{ Policies : "governed by"
    Parts ||--o{ Inventories : "stored in"
    VehicleParts }o--|| Parts : "includes"
```

