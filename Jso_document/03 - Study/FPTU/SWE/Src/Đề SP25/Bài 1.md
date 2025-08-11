### Question 1: 

I agree with using Lean Software Development for this EMS project. This model is suitable because the project has a short timeline, changing requirements, experienced team members, and support from different departments.

#### Identify model characteristics 

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

- Functional Testing: Make sure all user functions like viewing timetables, submitting requests, and checking attendance work correctly.  
      
    
- Non-functional Testing: Includes performance testing (system handles many users) and usability testing (easy for all roles to use).  
      
    

#### Level/Stage of Testing :

- Unit Testing: Developers test individual components like login or schedule display.  
      
    
- Integration Testing: QA team checks that features work together, like exam timetable + attendance check.  
      
    
- System Testing: Full system is tested for bugs, speed, and reliability.  
      
    
- User Acceptance Testing (UAT): Lecturers, students, and staff test the system in real exam conditions.  
      
    

#### Who will test at each stage:

- Unit Testing: Developers  
      
    
- Integration/System Testing: QA Testers  
      
    
- UAT: Real users – lecturers, students, exam staff  
      
    

  

### Question 3: 

  

#### Functional Requirements (1.0 points):

1. Lecturers can view exam timetables.  
      
    
2. Students can check out after exams.  
      
    
3. Exam staff can create the exam schedule.  
      
    
4. Users can submit requests (WiFi reset, MAC address change).  
      
    
5. Users can log in with FU Gmail account.  
      
    

#### Performance Requirements (0.6 points):

1. System must handle large datasets smoothly.  
      
    
2. System must use memory and CPU efficiently.  
      
    
3. System must be reliable with many users at the same time.  
      
    

#### Usability Requirements (0.4 points):

1. System must be easy to use without training.  
      
    
2. System should work with a simple user manual.  
      
    

  

### Question 4:

  

1. As a lecturer, I want to view my exam schedule so that I can prepare and attend on time.  
      
    
2. As a student, I want to check out after my exam so that my attendance is recorded.  
      
    
3. As an exam staff, I want to import the student list for each room so that I can manage the exam sessions easily.  
      
    
4. As a student, I want to request a MAC address change so that I can connect my laptop during exams.  
      
    
5. As a lecturer, I want to submit a WiFi reset request so that I can solve connection problems quickly.  
      
    

  

### Question 5:

  

1. LCOM (Lack of Cohesion in Methods): Measures how well the methods in a class relate to each other. Lower is better.  
      
    
2. CBO (Coupling Between Objects): Measures how connected one class is to others. Less coupling = easier to maintain.  
      
    
3. Cyclomatic Complexity: Measures the number of decision paths in the code. Lower = easier to test.  
      
    
4. Code Coverage: Shows how much of the code is tested. Higher = better test quality.  
      
    
5. Depth of Inheritance Tree (DIT): Measures how deep a class is in the inheritance structure. Lower = simpler design.  
      
    

Q6

## A. Activities and User Tasks

### 1. Manage Student Attendance

1.1 Check-in student at exam room  
1.2 Check-out student after exam  
1.3 View attendance status of students

### 2. Lecturer Attendance Actions

2.1 Lecturer checks in to monitor the exam  
2.2 Lecturer checks out after exam  
2.3 View exam session and room status

---

## B. Releases

### Release 1

  

1.1.1 As a lecturer, I want to check in students at the beginning of the exam so that their attendance is recorded correctly.  
1.2.1 As a student, I want to check out after completing the exam so that I can confirm my exam participation.  
2.1.1 As a lecturer, I want to check in to the exam room so that I can officially start monitoring the exam.  
2.2.1 As a lecturer, I want to check out after the exam ends so that the session is marked as completed.

---

### Release 2

  

1.3.1 As an exam staff, I want to view the attendance status of all students so that I can ensure proper reporting.  
2.3.1 As a lecturer, I want to see the exam room and session status so that I can prepare and manage better.

**