### Question 1: Lean Software Development (LSD) for EMS Project

I agree with using Lean Software Development for this EMS project. This model is appropriate because the project has a short timeline, evolving requirements, a skilled development team, and strong support from various departments.

Model Characteristics:

Customer involvement:  
Lecturers, students, and exam staff are actively involved during development. Lean supports continuous feedback, which fits the real-time usage and improvement of EMS during exams.

Requirement characteristics:  
Some functions are already defined (e.g., attendance, schedule, requests), but many may change. Lean allows flexibility and is well-suited for projects with evolving requirements.

Team’s skill and experience:  
FU has an experienced IT department. Lean is most effective with skilled teams that are capable of self-management and continuous improvement.

Project deliverables:  
The EMS must release an MVP in 3 months and complete the full system in 9 months. Lean supports early delivery and iterative development, allowing for constant refinement.

Top management commitment:  
FU leadership is fully committed and has assigned cross-functional staff to the project. Lean benefits from such support and cross-team collaboration.

Software development model match:  
Lean focuses on delivering quality, flexibility, and speed. The EMS project goals—performance, usability, and security—are aligned with Lean principles.

  

### Question 2: Types and Stages of Testing

Functional Testing:  
Tests whether the system features behave correctly, such as displaying exam timetables, check-in/check-out, and handling requests.

Non-functional Testing:  
Evaluates system performance, reliability, and ease of use, including handling high loads and being accessible for different user groups.

Testing Stages:

Unit Testing:  
Tests individual components like login or request forms.  
Performed by: Developers.

Integration Testing:  
Tests how modules work together, such as login + schedule.  
Performed by: QA team.

System Testing:  
Tests the complete EMS system with all functionalities.  
Performed by: QA team.

User Acceptance Testing (UAT):  
Validates the system with real users in exam-like conditions.  
Performed by: Lecturers, students, and exam staff.

  

### Question 3: 

Functional Requirements:

1. Lecturers can view the examination timetable.  
      
    
2. Students can check out after exams.  
      
    
3. Exam staff can create exam schedules.  
      
    
4. Users can submit requests (WiFi reset, MAC address change).  
      
    
5. Users can log in via FU Gmail accounts.  
      
    

Performance Requirements:

1. The system can handle large datasets efficiently.  
      
    
2. The system uses memory and CPU effectively.  
      
    
3. The system performs reliably under high user load.  
      
    

Usability Requirements:

1. Users can operate the system without formal training.  
      
    
2. A basic manual is enough for users to understand and use the system.  
      
    

  

### Question 4:

1. As a lecturer, I want to view the list of students assigned to my exam room so that I can prepare and monitor them effectively.  
      
    
2. As a student, I want to confirm my identity and check in at the beginning of the exam so that my attendance is recorded.  
      
    
3. As an exam staff, I want to track how many exam hours each lecturer has monitored so that I can generate reports accurately.  
      
    
4. As a student, I want to submit a WiFi password reset request during the exam so that I can reconnect quickly if I lose connection.  
      
    
5. As a lecturer, I want to generate an attendance summary at the end of the session so that I can submit it for reporting.
    

  
  

  

### Question 5: 

LCOM (Lack of Cohesion in Methods):  
Measures how related the methods within a class are. Lower LCOM indicates higher cohesion and a well-focused class.

CBO (Coupling Between Objects):  
Shows how many other classes a class depends on. Lower coupling improves modularity and reduces maintenance complexity.

Cyclomatic Complexity:  
Measures the number of decision paths in the code. Lower complexity results in easier testing and higher code maintainability.

Code Coverage:  
Indicates the percentage of code executed during automated testing. Higher coverage reflects better-tested and more reliable software.

Depth of Inheritance Tree (DIT):  
Represents the number of class inheritance levels. Lower DIT indicates simpler class structures and easier debugging.

### Story Map – Student Exam Attendance Management

  

#### A. Core Activities and User Tasks

1. Attendance Management

- 1.1 Retrieve student roster for each exam session  
      
    
- 1.2 Register student check-in manually  
      
    
- 1.3 Register student check-out manually  
      
    
- 1.4 View full attendance logs (check-in/check-out records)  
      
    
- 1.5 Support attendance automation using student ID scan  
      
    

2. Live Session Monitoring

- 2.1 Track real-time exam room attendance status  
      
    
- 2.2 Handle incoming support requests (WiFi, MAC address)  
      
    

---

#### B. Feature Releases

Release Phase 1

- 1.1.1 Load list of students scheduled for the exam  
      
    
- 1.2.1 Manually check-in students upon arrival  
      
    
- 1.3.1 Manually check-out students post exam  
      
    
- 1.4.1 Provide session-specific attendance records  
      
    
- 2.1.1 Enable real-time exam participation overview  
      
    
- 2.2.1 Present request feed from students and lecturers  
      
    

Release Phase 2

- 1.5.1 Activate automatic check-in via student card scanning  
      
    
- 1.2.2 Allow batch check-in for multiple students  
      
    
- 1.3.2 Allow batch check-out for multiple students  
      
    
- 2.2.2 Allow direct request handling by staff from dashboard view  
      
    

  
**