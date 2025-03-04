We'll cover the following
+ [[#System Requirements]]
+ [[#Use Case Diagram]]
+ [[#Class Diagram]]
+ [[#Activity Diagrams]]
+ [[#Database]]
+ [[#Code]]

Melville is an online reading website, which allow everyone to read all books from the internet. Users can upload their own book and share it for everyone, also they can save favorite book and read it later.

![[Pasted image 20250304131928.png]]
### System Requirements

We will focus on the following set of requirements while designing Melville:

1. User should be able to login or signUp, also login and signup with google account.
2. User should be able to reset the password if forgot.
3. User should be able to deactivate their own account or delete user account and all data related to that account.
4. User should be able to search books.
5. User should be able to, upload new books, show all the book that uploaded by user, edit uploaded books, remove uploaded book, download books and add book to favorite.
6. Only system admin can have full control over users, books
7. All uploaded images and book files will be stored to MinIO Server
8. The website should be able to send notifications to users whenever a reservation is made/modified or there is an update.

### Use Case Diagram

We have 3 main Actors in our system:

+ **Admin:** Responsible for full control over users, books, categories
+ **Users:** Will be able to uploads books, view uploaded books, modified books, remove books, add favorite book, download book.
+ Sytem: Mainly responsible for sending notifications

Here are the top use cass of Melville website:

+ Search books: To search for books that user want to read
+ Create/Modify/View books: To upload a book, remove it, or view details about book.
+ Add favorite: To save book and read it later.
+ Download book: To download the book that user want to read it on their device.

Here is the use case diagram of our Melville website:

