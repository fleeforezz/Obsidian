---
banner: https://www.oracle.com/node/oce/storyhub/prod/api/v1.1/assets/CONTAF74F9FA8AFE4E14ADA52D8634069974/native/heathrow-airport-hero-banner3.jpg
banner-display: cover
banner-x: 48
banner-y: 20
banner-fade: "-205"
content-start: "270"
---
We'll cover the following
+ System Requirement
+ Use Case Diagram
+ Features Graph
+ Activity Diagram
+ DataSource

Heathrow Airport Management System (Heathrow AMS) is a comprehensive software platform designed to oversee and streamline all operational facts of an airport - from the moment an aircraft lands until it departs again. Unlike airline-focused systems, an AMS manages both landside and airside process.

### System Requirements

We will focus on the following set of requirements while designing Heathrow Airport Management System:

#### Register Function

1. User should be able to login or signup before using the app
	1. Login
		+ User enter email or username
			+ Email must match regex (example@test.com)
		+ User enter password
			+ Password must match the old one
		+ Prompt to signup if user don't have account yet
	2. SignUp
		+ User enter email
			+ Email must match regex (example@test.com)
		+ User enter username
			+ No requirement for enter username
		+ User enter password
			+ Password must meet requirement (password length 8-12 character, password must have 1 special character and uppercase letters)
		+ User confirm password
2. User should be able to signout after done using the app

#### Main Function

1. **Overview of an airport**
	User should be able to see overview of an airport before showing others action:
	+ Airport Code
	+ Airport Name
	+ Country Code
	+ Airport Weather
	+ Number of Stands
		+ Stands for passenger
		+ Stands for cargo
	+ Number of Runways (Show runway code like 27L or 16R)
	+ Number of active Runways
	+ Total of money Airport has earned (Currency dollar)
2. **Contract Management**
	1. Show contracts information:
		+ Show contact capacity that airport can handle
			+ Active Contracts
			+ Free slots
		+ Show current available contracts
			User should be able to see a list of available contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract fees
		+ Show all contract that airport has assigned and active
			User should be able to see a list of assigned and active contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract fees
		+ Show all contract that airport has been cancel
			User should be able to see a list of canceled and unactive contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract fees
	2.  Assign a contract:
		User should be able to assign a contract by enter Contract ID that user want to assign to
		+ Show all available contract (Show only basic info of an contract)
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract fees
		+ Input ID of a contract want to assign
		+ The system will popup a message to confirm assign contract
		+ If confirmed assign the system will through a success message, else cancel message
		+ Return to contract menu
	3. Cancel a contract
	4. UnActive a contract
	5. Return to main menu
3. **Employes Management**
	1. Ground Service Management
	2. Tower Service Management
	3. Handling Crew Management
4. 
5. User should be able to assign passengers to an existen flight
6. User 

### Use Case Diagram

### Feature Graph