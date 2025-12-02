### Question 1:

I agree with using Lean Software Development for this EMS project. This model is suitable because the project has a short timeline, changing requirements, skilled team members, and strong support from other departments.

Model Characteristics:

- Customer involvement:  
    Lecturers, students, and exam staff are involved during development. Lean supports frequent feedback, which matches how EMS will be used and improved during real exam sessions.  
      
    
- Requirement characteristics:  
    Some features are defined, but others may change later. Lean allows flexibility and can handle new or updated requirements easily.  
      
    
- Team’s skill and experience:  
    FU has an experienced IT team. Lean works best with skilled teams that can manage themselves and improve work processes.  
      
    
- Project deliverables:  
    EMS needs a first version (MVP) in 3 months and full system in 9 months. Lean supports fast delivery and step-by-step improvements.  
      
    
- Top management commitment:  
    FU leaders support the project and assign staff from other departments. Lean benefits from clear progress and teamwork using tools like Kanban boards.  
      
    
- Software development model match:  
    Lean is good for projects that need flexibility, quality, and speed. EMS goals like performance, security, and ease of use fit well with Lean.  
      
    

  

### Question 2:

Functional Testing:  
Check if features work correctly, such as:

- Exam timetable display  
      
    
- Attendance check-in/check-out  
      
    
- Request submissions (WiFi reset, MAC change)  
      
    

Non-functional Testing:  
Test how the system performs and how easy it is to use, such as:

- System speed under heavy load  
      
    
- Easy to use for students, lecturers, and staff  
      
    

Level/Stage of Testing:

- Unit Testing:  
    Test small parts like login and form input  
      Performed by: Developers  
      
    
- Integration Testing:  
    Test how modules work together (e.g., login + schedule)  
    Performed by: QA team  
      
    
- System Testing:  
    Test the whole EMS system with full features  
      Performed by: QA team  
      
    
- User Acceptance Testing (UAT):  
    Real users test the system in exam conditions  
      Performed by: Lecturers, Students, Exam Staff
    

  

### Question 3:

Functional Requirements:

1. Lecturers can view exam timetables.  
      
    
2. Students can check out after exams.  
      
    
3. Exam staff can create examination schedules.  
      
    
4. Users can submit requests (WiFi reset, MAC change).  
      
    
5. Users can log in via FU Gmail accounts.  
      
    

Performance Requirements:

1. The system handles large datasets efficiently.  
      
    
2. The system uses memory and CPU effectively.  
      
    
3. The system works reliably even with many users at the same time.  
      
    

Usability Requirements:

1. Users can operate the system without formal training.  
      
    
2. A simple manual is enough for basic use.  
      
    

  

### Question 4:

1. As a student, I want to receive a confirmation message after submitting a request so that I know it was sent successfully.  
      
    
2. As a lecturer, I want to see which exam rooms I am assigned to so that I can arrive at the right location on time.  
      
    
3. As an exam staff, I want to manage requests from both students and lecturers in one dashboard so that I can respond quickly.  
      
    
4. As a student, I want to save my exam schedule to my phone calendar so that I don’t forget the exam time.  
      
    
5. As a lecturer, I want to view technical issues reported during my session so that I can inform the support team immediately.  
      
    

  

  
  

  

### Question 5: Five Quality Metrics

1. LCOM (Lack of Cohesion in Methods):  
    Shows how related methods in a class are. A lower value means the class does one job clearly.  
      
    
2. CBO (Coupling Between Objects):  
    Tells how many other classes one class uses. A lower number means the class is more independent and easier to maintain.  
      
    
3. Cyclomatic Complexity:  
    Counts the number of decision paths in code. A lower value means the code is simpler and easier to test.  
      
    
4. Code Coverage:  
    Measures how much code is tested by automated tests. A higher percentage means better testing and fewer bugs.  
      
    
5. Depth of Inheritance Tree (DIT):  
    Tells how many levels of inheritance a class has. A smaller number means a simpler class structure and easier debugging.  
      
    

Q6 

  
  

#### A. Key Activities and User Objectives

1. Manage Attendance Lifecycle

- 1.1 Access exam participant list  
      
    
- 1.2 Log student entry into the exam room  
      
    
- 1.3 Confirm student exit after exam completion  
      
    
- 1.4 Review attendance logs and timestamps  
      
    
- 1.5 Support quick entry through ID scan automation  
      
    

2. Supervise Exam Sessions

- 2.1 Monitor live status of student attendance  
      
    
- 2.2 Respond to technical issues reported by users (e.g., WiFi problems, MAC address updates)  
      
    

  

#### B. Development Releases

Initial Release (Release 1)

- 1.1.1 Show enrolled students for each exam session  
      
    
- 1.2.1 Manually record student arrivals  
      
    
- 1.3.1 Allow staff to manually log student departures  
      
    
- 1.4.1 Provide access to historical attendance data  
      
    
- 2.1.1 Present live attendance overview per room  
      
    
- 2.2.1 Display request queue for staff response during exams  
      
    

Enhanced Features (Release 2)

- 1.5.1 Enable auto check-in with student ID scan  
      
    
- 1.2.2 Check in multiple students in bulk  
      
    
- 1.3.2 Check out multiple students in bulk  
      
    
- 2.2.2 Allow staff to reply directly to student requests from the dashboard
    

  
**