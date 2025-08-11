### Question 1:

I agree with using Lean Software Development for this EMS project. This model is suitable because the project has a short timeline, changing requirements, experienced team members, and support from different departments.

Identify model characteristics :  
Customer involvement:  
Users such as lecturers, students, and exam staff are actively involved throughout the development. Lean encourages continuous feedback, which aligns well with how EMS will be used and adjusted in real-time.

Requirement characteristics:  
The EMS has basic features defined but more features may be added or changed. Lean supports flexibility and quick adaptation to new requirements.

Team’s skill and experience:  
The IT team at FU consists of highly skilled developers. Lean works well with experienced teams capable of self-managing and improving processes continuously.

Project deliverables:  
The project requires an MVP in 3 months and full release in 9 months. Lean supports fast delivery cycles and allows room for gradual enhancement.

Top management commitment:  
FU leadership supports the project with resources from multiple departments. Lean benefits from this by enabling visible progress tracking and alignment via tools like Kanban boards.

Software development model match:  
Lean is a good match for projects with evolving requirements and a need for speed, quality, and adaptability. It fits the EMS goals of reliability, usability, and scalability.

  

### Question 2:

Functional Testing:  
Check if user features like exam timetable display, request submissions, and attendance check-in/out work correctly.

Non-functional Testing:  
Test performance (system under load), and usability (ease of use for different users).

Level/Stage of Testing:  
Unit Testing: Developers test individual features (e.g., login, request form).  
Integration Testing: Ensure modules (e.g., schedule + attendance) work well together.  
System Testing: Test full system for correctness and performance.  
User Acceptance Testing (UAT): Real users validate system in exam conditions.

Who will test at each stage:  
Unit Testing: Developers  
Integration/System Testing: QA team  
User Acceptance Testing: Lecturers, students, and exam staff

  

### Question 3:

Functional Requirements :

- Lecturers can view exam timetables.  
      
    
- Students can check out after exams.  
      
    
- Exam staff can create examination schedules.  
      
    
- Users can submit requests (WiFi reset, MAC change).  
      
    
- Users can log in via FU Gmail accounts.  
      
    

Performance Requirements :

- System handles large datasets efficiently.  
      
    
- System uses memory and CPU effectively.  
      
    
- System performs reliably under high user load.  
      
    

Usability Requirements (0.4 points):

- Users can operate the system without official training.  
      
    
- A simple manual is enough for basic operation.  
      
    

  

Question 4:

- As a lecturer, I want to mark students as present or absent during the exam so that the attendance report is accurate.
    

  

- As a student, I want to get notifications about my exam time and location so that I don’t miss any session.
    

  

- As an exam staff, I want to schedule exams for different classes so that the system can avoid conflicts.
    

  

- As a student, I want to update my device information before the exam day so that I can avoid technical issues during the exam.
    

  

- As a lecturer, I want to see a list of student requests during the exam so that I can respond quickly if needed.
    

  
  

### Question 5:

LCOM (Lack of Cohesion in Methods): Measures how closely related the methods in a class are. Lower value indicates better cohesion and clearer responsibility.

CBO (Coupling Between Objects): Measures how dependent a class is on other classes. Lower CBO means better modularity and easier maintenance.

Cyclomatic Complexity: Measures the number of independent logic paths. Lower value means simpler, easier-to-test code.

Code Coverage: Indicates the percentage of code tested by automated tests. Higher values ensure better fault detection.

Depth of Inheritance Tree (DIT): Measures how many levels of inheritance a class has. Lower depth means simpler design and easier debugging.

  
  

QUESTION 6 : 

### A. Activities and User Tasks

1. Check-in Exam 1.1 Lecturer checks in student  
    1.2 System records check-in time  
    1.3 Lecturer views check-in status  
      
    
2. Check-out Exam 2.1 Student requests to check out  
    2.2 Lecturer approves checkout  
    2.3 System records check-out time  
    2.4 System marks exam as completed  
      
    

  

### B. Releases

#### Release 1

- 1.1.1 Lecturer selects student to check in  
      
    
- 1.1.2 System logs check-in timestamp  
      
    
- 1.1.3 Lecturer views check-in list  
      
    
- 2.1.1 Student clicks "Checkout" button  
      
    
- 2.1.2 Lecturer receives checkout request  
      
    
- 2.1.3 System logs check-out timestamp  
      
    

#### Release 2

- 1.1.4 Auto-reminder for check-in deadline  
      
    
- 2.1.4 Auto-confirm checkout after timeout  
      
    
- 2.1.5 System sends confirmation email on checkout  
      
    
- 2.1.6 View historical check-in/out data  
      
    

  
  
  
  
  
**