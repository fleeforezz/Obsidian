### Question 1:

I agree with using Lean Software Development for this EMS project. This model is suitable because the project has a short timeline, changing requirements, experienced team members, and support from different departments.

Identify model characteristics :

Customer involvement:  
Users such as lecturers, students, and exam staff are clearly defined and participate throughout the project. LSD encourages continuous feedback, which matches the real use of EMS during exams.

Requirement characteristics:  
EMS has some clear requirements now (e.g., timetable, check-in/out, requests), but it is expected to change and grow. LSD allows flexibility and handles changes easily.

Team’s skill and experience:  
The IT team at FU includes experienced developers. Lean is good for skilled teams who can self-manage and improve continuously.

Project deliverables:  
The first version of EMS must be ready in 3 months and completed in 9 months. LSD supports fast delivery and allows the team to release early versions and keep improving.

Top management commitment:  
FU's Board of Directors supports this project strongly. LSD helps management track work and progress using visual tools (like Kanban boards or task flow), making it easier to meet deadlines.

Software development model match:  
Lean is a good fit because it supports adaptive, continuous improvement and frequent releases. This is important for EMS, which needs flexibility and high reliability.

  

### Question 2: 

Functional Testing:  
Make sure all user functions like viewing timetables, submitting requests, and checking attendance work correctly.

Non-functional Testing:  
Includes performance testing (system handles many users) and usability testing (easy for all roles to use).

Level/Stage of Testing:

- Unit Testing: Developers test individual components like login or schedule display.  
      
    
- Integration Testing: QA team checks that features work together, like exam timetable + attendance check.  
      
    
- System Testing: Full system is tested for bugs, speed, and reliability.  
      
    
- User Acceptance Testing (UAT): Lecturers, students, and staff test the system in real exam conditions.  
      
    

Who will test at each stage:

- Unit Testing: Developers  
      
    
- Integration/System Testing: QA Testers  
      
    
- UAT: Real users – lecturers, students, exam staff  
      
    

  

### Question 3: 

Functional Requirements :

1. Lecturers can view exam timetables.  
      
    
2. Students can check out after exams.  
      
    
3. Exam staff can create the exam schedule.  
      
    
4. Users can submit requests (WiFi reset, MAC address change).  
      
    
5. Users can log in with FU Gmail account.  
      
    

Performance Requirements:

1. System must handle large datasets smoothly.  
      
    
2. System must use memory and CPU efficiently.  
      
    
3. System must be reliable with many users at the same time.  
      
    

Usability Requirements:

1. System must be easy to use without training.  
      
    
2. System should work with a simple user manual.  
      
    

  

Question 4:

1. As a student, I want to see my upcoming exam schedule so that I can plan my study time better.
    
2. As an exam staff, I want to track which students are present in each room so that I can report accurate attendance.
    
3. As a lecturer, I want to check which students are missing from the exam so that I can follow up with them later.
    
4. As a student, I want to send a request to reset my WiFi password so that I can reconnect during the exam.
    
5. As an exam staff, I want to receive system alerts about student requests in real-time so that I can support them quickly
    

  
  

  
  

### Question 5: 

1. LCOM (Lack of Cohesion in Methods): Measures how well the methods in a class relate to each other. Lower value means better cohesion.  
      
    
2. CBO (Coupling Between Objects): Measures how connected one class is to others. Lower value means better modularity.  
      
    
3. Cyclomatic Complexity: Measures the number of decision paths in the code. Lower complexity means easier testing.  
      
    
4. Code Coverage: Measures the percentage of code that has been tested. Higher coverage means more reliable testing.  
      
    
5. Depth of Inheritance Tree (DIT): Measures how deep a class is in the inheritance hierarchy. Lower depth means simpler and easier-to-maintain design.
    

  

Question 6 

### A. Activities and User Tasks

#### 1. Handle Exam Scheduling

1.1 Exam staff creates exam schedules for each session  
1.2 Staff assigns rooms and invigilators to each exam  
1.3 Students receive notification of scheduled exams

#### 2. Request and Support Management

2.1 Students send technical support requests (e.g., Wi-Fi issues)  
2.2 Lecturers request user reassignment or password reset  
2.3 Staff reviews and responds to user requests during exam time

  

### B. Releases

#### Release 1

1.1.1 As an exam staff, I want to create exam schedules so that I can assign sessions and rooms to students and lecturers properly.  
1.2.1 As an exam staff, I want to assign invigilators to each room so that the exam is properly supervised.  
1.3.1 As a student, I want to receive exam notifications so that I know when and where my exams will happen.

#### Release 2

2.1.1 As a student, I want to submit a Wi-Fi reset request so that I can solve connection issues quickly during the exam.  
2.2.1 As a lecturer, I want to request a reassignment if I cannot attend an exam session so that the exam process is not interrupted.  
2.3.1 As an exam staff, I want to view and reply to technical support requests so that I can resolve issues during exam sessions in real time.

**