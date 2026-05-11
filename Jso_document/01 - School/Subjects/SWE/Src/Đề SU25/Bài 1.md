## 1. Kanban process 

Main principles of Kanban:

- Visualization: Work items are shown on a board (To Do, In Progress, Done). Everyone can see project status.  
      
    
- Limit Work in Progress (WIP): Each step has a limit so team does not take too many tasks at the same time.  
      
    
- Flow management: Work moves smoothly from start to finish. The goal is to reduce waiting time.  
      
    
- Feedback loops: Daily stand-up, review meetings to improve teamwork.  
      
    
- Continuous improvement (Kaizen): Team always looks for better way of working.  
      
    
- Evolutionary change: Changes are small and step by step, not big sudden change.  
      
    

Match with project:

- Project is new and may change a lot → Kanban is flexible, fits well.  
      
    
- Team has experienced developers → they can manage their own tasks and flow.  
      
    
- Project must deliver first version in 3 months → Kanban helps focus on fast delivery.  
      
    
- Needs continuous feedback from managers and staff → Kanban supports feedback loops.  
      
    

 I agree with my manager. Kanban is good because it is visual, flexible, and supports fast feedback for this project.

  

## 2. Testing levels 

a. Type and level of testing 

- Unit testing → focus on program structure, test small code modules.  
      
    
- Integration testing → test when units are combined.  
      
    
- System testing → test the whole system against functional requirements.  
      
    
- Acceptance testing → test with users to check business needs.  
      
    

b. Who does testing? 

- Unit testing → done by developers (they know the code structure).  
      
    
- Integration + System testing → done by QA/testers (they check functional requirements).  
      
    
- Acceptance testing → done by end-users / business staff (they check real use cases).  
      
    

  

## 3. Requirements from project 

Functional requirements :

1. Scan product barcodes at POS.  
      
    
2. Apply discounts and promotions automatically.  
      
    
3. Support many payment methods (cash, card, mobile wallet).  
      
    
4. Generate receipt (print or email).  
      
    
5. Update inventory in real time.  
      
    

Performance requirements :

1. Scanning item shows price almost instantly.  
      
    
2. Payment completes in seconds.  
      
    
3. Inventory search returns results in under 2 seconds.  
      
    

Usability requirements :

1. Interface is simple, clean, and easy to use for staff with little IT skill.  
      
    
2. Use colors and icons (green = confirm, red = error).  
      
    

  

## 4. User stories 

1. As a cashier, I want to scan product barcodes so that I can quickly add items to the bill.  
      
    
2. As a customer, I want the system to apply promotions so that I can get discounts automatically.  
      
    
3. As a cashier, I want to accept many payment methods so that customers can pay easily.  
      
    
4. As a customer, I want a receipt (print or email) so that I can keep proof of purchase.  
      
    
5. As a stock clerk, I want the system to update inventory in real time so that stock is always correct.  
      
    

## 5. Design patterns 

a. Singleton pattern:

- Ensures only one instance of a class exists.  
      
    
- Example: Database connection in CSMS should be only one to avoid errors.  
      
    

b. Observer pattern:

- One object notifies others when state changes.  
      
    
- Example: When sales transaction is done, inventory and reports are updated automatically.  
      
    

## 6.

### A. Activities and User tasks

Checkout Goods

1.1 Scan product barcode  
1.2 Apply promotions/discounts  
1.3 Choose payment method  
1.4 Process payment  
1.5 Generate receipt  
1.6 Update inventory & sales logs

  

### B. Releases

Release 1  
1.1.1 User story: As a cashier, I want to scan product barcodes so that I can add items to the bill.  
1.2.1 User story: As a customer, I want promotions and discounts to apply automatically so that I pay the correct price.  
1.3.1 User story: As a customer, I want to choose a payment method (cash, card, wallet) so that I can pay conveniently.  
1.4.1 User story: As a cashier, I want to process the payment quickly so that checkout is smooth.

Release 2  
1.5.1 User story: As a customer, I want to receive a receipt (print or email) so that I can keep proof of purchase.  
1.6.1 User story: As a stock clerk, I want inventory and sales logs to update automatically so that stock and reports are correct.