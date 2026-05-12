---
status: active
tags:
  - project
---
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
+ WinUI with MVVM architecture - UI
+ Clean Architechture - Clean code architecture
+ Entity Framework Core - ORM
+ MSSQL Server - Database
+ BCrypt.NET - Securely hashing and Verifying passwords
## 🏗️ System Clean Architecture

Todo's application will be contruct base on clean architechture and DDD (Domain Driven Design):
+ [[Clean Architecture]]
+ [[06 - Projects/On-hold/Todo App/Diagrams/File Structure|File Structure]]

## 🎨 Database Design

Our system will have total 4 Entities:

+ Users: User management and authorization
+ Tasks: Store tasks for each user
+ Tags: Store tags for each task

[[Entity Relationship Diagram (ERD)]]

## 📑 Flowcharts

+ [[Flowcharts]]
+ [[State Machine Diagram]]
+ [[Sequence Diagram]]
## 📚 Document References
### Project Documentation
+ [⚙️ Project Main Flow](MAIN_FLOW.md)
+ [📰 Features](FEATURE.MD)
+ [🗄️ Database Overview](DATABASE.md)
