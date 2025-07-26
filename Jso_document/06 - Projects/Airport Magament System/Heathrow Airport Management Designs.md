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
	+ The system will popup a message to confirm SignOut
	+ If confirmed signout the system will throw a success message, else cancel message
	+ Return to contract menu

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
	+ Notification of which contract is about to expired
2. **Airport Mangement**
	User should be able to control over terminal, runway, assign gate:
	1. Show a list of all arriving airplanes
	2. Show a list of all airplanes on airport
	3. Show a list of departing airplane
	4. Show a list of requiring action
		+ 
3. **Contract Management**
	1. Show contracts information:
		+ Show contact capacity that airport can handle
			+ Active Contracts
			+ Free slots
		+ Show current available contracts
			User should be able to see a list of available contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name (Virgin Atlantic)
			+ Contract Type (Internation, Regional, Local)
			+ Contract expiration date (date time format 1d 20h)
			+ Contract fees (currentcy format # ### ###)
		+ Show all contract that airport has assigned and active
			User should be able to see a list of assigned and active contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Stand class
			+ Contract Type (Internation, Regional, Local)
			+ Contract expiration date (date time format 1d 20h)
			+ Contract fees (currentcy format # ### ###)
		+ Show all contract that airport has been cancel
			User should be able to see a list of canceled and unactive contracts
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract expiration date (date time format 1d 20h)
			+ Contract fees (currentcy format # ### ###)
		+ Show detail of a contract
			User should be able to see detail of a contract
			+ Enter ID of a contract that want to show detail (ID must match the requirement and cannot be null)
			+ Economy
				+ Lading fee
				+ Departure fee
				+ Refueling 
				+ Handling Services fee
				+ Other Fees (CO2, Crew, ATC)
				+ Shipping & Transport
				+ Total
				+ Contract Total
				+ Requested services: (Only show the service that the airplane need to request)
					+ Boarding out 
					+ Unload
					+ Fuel
					+ Water
					+ Lavatory
					+ Cleaning
					+ Catering
					+ Load
					+ Boarding in
					+ Deicing
				+ Handling limits
			+ Contract
				+ Airline name
				+ Flight number
				+ Airline (Korean Airline)
				+ Destination airport (Airport code | Airport name)
				+ Destination country (Country name)
				+ Roundtrip duration (Datetime format 02h 39m)
				+ Destination distance (1020km)
			+ Airplane info
				+ Airplane name and Airplane type (Antonov | A124)
				+ Aircrew (8 Crew)
				+ Max range
				+ Cruise speed (500 km/h)
				+ Approach speed (165 km/h)
	2.  Assign a contract:
		User should be able to assign a contract by enter Contract ID that user want to assign to
		+ Show all available contract (Show only basic info of an contract)
			+ Contract ID
			+ Country ID
			+ Airplane type (B747)
			+ Airplane Name
			+ Contract Type (Internation, Regional, Local)
			+ Contract fees
		+ Enter ID of a contract that want to assign
		+ The system will popup a message to confirm assign contract
		+ If confirmed assign the system will throw a success message, else cancel assign message
		+ Return to contract menu
	3. Cancel a contract
		User should be able to cancel a contract if no longer needed
		+ Show all contract that airport has assigned and active (Some basic info of the contract)
		+ Enter ID of a contract that want to be cancelled (ID must match requirement and cannot be null)
		+ If entered Contract ID found, system will prompt detail of that contract and send confirm cancel message
		+ After Cancel a contract successfully return to Contract Management menu
	4. Activate a contract
		User should be able to activate a contract again
		+ Show all contract that airport has assigned and unactive (Some basic info of the contract)
		+ Enter ID of a contract that want to be activate again (ID must match requirement and cannot be null)
		+ If entered Contract ID found, system will prompt detail of that contract and send confirm activate message
		+ After activate successfully return to Contract Management menu
	5. DeActive a contract
	    User should be able to deactivate a contract 
		+ Show all contract that airport has assigned and active (Some basic info of the contract)
		+ Enter ID of a contract that want to be cancelled (ID must match requirement and cannot be null)
		+ If entered Contract ID found, system will prompt detail of that contract and send confirm Deactivate message
		+ After Deactivate successfully return to Contract Management menu
	6. Return to main menu
4. **Employes Management**
	1. Ground Service Management
	2. Tower Service Management
	3. Handling Crew Management
5. **Logs Management**
	1. Contracts Logs
	2. Passengers Logs

### Use Case Diagram

### Feature Graph