---

kanban-plugin: board

---

## 🏗️ Features

- [x] 1.Import room from text file
- [x] 2.Display Available Room List
- [x] 3.Enter guest information
- [x] 4.Update guest stay information
- [x] 5.Search guest by national Id
- [x] 6.Delete guest reservation brefore arrival
- [x] 7.List vacant rooms
- [x] 8.Monthly revenue report
- [x] 9.Reveneue report by room type
- [x] 10.Save guest information


## 🔴 No status



## 🟡 On going



## 🟢 Done

**Complete**
- [x] (Feature 3) Fix there's no error message when user input wrong birthdate format
- [x] (Feature 1) Add validation for loadRecFromFile(), validation for replication roomId, validation for 6 fields
- [x] (Feature 8) Fix cannot get room that match the target month
- [x] (Feature 4) Cannot input empty start date if user don't want to change  start date
- [x] (Feature 4) Cannot input empty RoomId if user don't want to change room
- [x] (Feature 3) Fix valiation, if user book same room and have an overlap date then ignore that booking date
- [x] (Feature 3) Add validation if there's somebody already booked that room
- [x] (Feature 6) Fix Date format when display guest reservation before cancel
- [x] (Feature 5) Fix Date format when display search result
- [x] (Feature 3) Fix confirm cancel reservation not act as expected
- [x] (Feature 3) Fix checkout date, the checkin date and checkoutDate currently the same
- [x] (Feature 3) Add validate National Id to be unique
- [x] (Feature 3) Cannot validate input start date if booked date is duplicate with existing room
- [x] (Feature 3) Cannot validate input birthdate
- [x] (Feature 3) Cannot validate input national ID
- [x] (Feature 3) Cannot validate input fullname


## ⚪ Abort





%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false,false]}
```
%%