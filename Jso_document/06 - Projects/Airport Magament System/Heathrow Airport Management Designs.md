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
	1. Show a list of all current planes have assigned contract
		+ Flight number (VS3642)
		+ Airplane type (B747)
		+ Airplane Name (Virgin Atlantic)
		+ State
		+ Stand
		+ Actual Revenue
		+ Handling Limit
		+ Contract ID
		+ Contract expiration date
	2. Sort airplane by state
		Show list of state user can enter
		+ Arrival
		+ On Stand
		+ Departure
		Enter state that user want to sort (State must be match the given state)
		If the result match and not be empty, show the list of airplanes that have the enterd state status 
		If not match system will send an error message
	3. Assign stands for arrival planes
		+ Enter Flight number user want to assign stand
		+ If flight number exist, list all available stands (If the current airplane is for passenger boarding list the stand with type passenger only and reverse)
			+ Stand ID
			+ Stand Type (For passenger, For cargo)
			+ Stand classes (A B C D E F G)
		+ Enter stand ID that available
		+ If everthing sucess system will send a success assign stand for that flight
		+ Or else user have to do the process again (From enter flight number to enter stand id)
	4. Assign arrival runway for airplanes
		+ Enter Flight number user want to assign runway
		+ If flight number exist, list all available runways 
			+ Runway ID
			+ Runway Name
		+ Enter runway name for assigning runway
		+ If everything sucess, set the landing status for that flight to ready to land, system will send a success message 
		+ Or else user have to do the process again (From enter flight number to enter runway name)
	5. Landing and takeoff action
		1. Landing
			+ Enter flight number want to approve for landing
			+ if current flight has been assigned to stand and runway, then set the landing status landing, set timer for taxing to terminal stand (01m left to reach terminal stand). After taxing timer runs out then system will send a success landing and taxing to terminal stand, then set landing status to landed and taxied
			+ Or else flight cannot able to land on the airport, system will send a notification says flight with number VN12324 cannot be landing since flight currently not assigned to stand or runway
		2. TakeOff
			+ Enter flight number want to approve for takeoff
			+ Check if are there any airplanes are taking off and check if current flight number finished handling ground service, if there are no airplane are taking off and current flight has finished ground handle so takeoff will be approved for that flight and set takeoff timer (01m left to fully takeoff). After take off success set take off status for that flight to took off. System will send a success message
			+ Or else takeoff not approve, system will send an error message
	6. Assign ground service for arrival planes
		+ Enter Flight number user want to assign ground service
		+ Check if enter flight has been landed or not
		+ If landing status is false then the flight hasn't landed yet so cannot assign ground service
		+ Or else assign ground service for airplane then, set timer for ground handing (1h52m left to finish handing ground service). After finish ground hadling, set ground handling status to finished. Each airplane require some of these services:
			+ Boarding
			+ Baggage
			+ Cleaning
			+ Cargo
			+ Catering
			+ Fuel
			+ Lavatory
			+ Water
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
			+ Contract fees (currency format # ### ###)
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
4. **Services Management**
	1. Ground Service Management
		1. List all ground services
			Each ground service have maximum 90 available slot capacity
			+ Each ground service contain:
				+ Service ID
				+ Service Name
				+ Available
				+ Working 
				+ Purchased
				+ Price to get
		2. Take on more ground service worker
			+ Enter Service ID user want to take on
			+ Enter number of worker (price will increase with the number of worker)
			+ Check if total price lower than total airport revenue if that's true then user able to purchase it 
			+ Or else cannot purchase since current airport revenue not meet the standard
			+ System will show confirm message 
		3. Cancel ground service worker
			+ Enter service ID user want to cancel (Entered ID must match the requirement)
			+ Check if service ID exist, if true user have to enter number of ground service worker want to be cancel, if not exist system will send a notification say service not found in system
	2. Handling Crew Management
		1. List all Handling Crew services
			+ Show max handling crew that the airport can handle
			+ Show number of handling crew that the airport currently have 
		2. Take on more handling crew service worker
			+ Enter number of worker user want to take on
			+ Check if entered number is valid (Number of enter worker cannot bigger than the total of max handling crew in the airport)
			+ If valid then add more handling crew to current handling crew then send a success notification added more crew to user else send a failed to add notification
5. **Logs Management**
	1. Contracts Logs
		The contracts log should show all contract activities
		+ The format should look like this:
			`[Time_User_Make_Activity] - actions when user interact`
			`[2023-12-03] - User1 assign a contract with ID 92SD123`
	2. Airplane Logs
		The Airplane log should show all activities of that plane
		+ The format should look like this:
			`[Time_Airplane_Make_Activity] - airplaneName + airplane flight number + airplane type actions`
			`[2024-12-03] - VietNamAirline/VNJ1233/A320 landing successfully`
	3. Activity Logs
		The activity log show all activites that user make in the airport
		+ The format should look like this:
			`[Time_User_Make_Activity] - User2 has assign a stand for flight number VNJ1234`
			`[2025-12-03] - User3 has assign landing runway 27L for flight number QA1232`

### Use Case Diagram

### Feature Graph