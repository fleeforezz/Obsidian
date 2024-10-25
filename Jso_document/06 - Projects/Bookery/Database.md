```SQL
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role ENUM('admin', 'user') DEFAULT 'user'
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    description TEXT,
    cover_image VARCHAR(255),
    pdf_link VARCHAR(255),
    published_year YEAR
);

CREATE TABLE User_Books (
    user_book_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    status ENUM('reading', 'finished', 'favorite') DEFAULT 'reading',
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_token VARCHAR(255) NOT NULL,
    expiry TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
```

```SQL
USE Bookery;
GO

-- Drop existing tables if they exist
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
    DROP TABLE [dbo].[Users];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
    DROP TABLE [dbo].[Books];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookCategory]') AND type in (N'U'))
    DROP TABLE [dbo].[BookCategory];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookCategoryMap]') AND type in (N'U'))
    DROP TABLE [dbo].[BookCategoryMap];

-- Create Users table
CREATE TABLE [dbo].[Users] ( 
  [user_id] INT IDENTITY(1,1) PRIMARY KEY,
  [username] VARCHAR(60) NOT NULL,
  [email] VARCHAR(60) NOT NULL,
  [password] VARCHAR(255) NOT NULL,
  [user_image] VARCHAR(255) NULL,
  [is_admin] INT DEFAULT 0,
  CONSTRAINT [UQ__Users__AB6E6164929A2586] UNIQUE ([email])
);

-- Create Books table
CREATE TABLE [dbo].[Books] ( 
  [book_id] INT IDENTITY(1,1) PRIMARY KEY,
  [title] VARCHAR(255) NOT NULL,
  [author] VARCHAR(255) NULL,
  [description] TEXT NULL,
  [cover_image] VARCHAR(255) NULL,
  [published_date] DATETIME NULL,
  CONSTRAINT [UQ__Books__Title] UNIQUE ([title]) -- Ensures unique titles
);

-- Create BookCategory table
CREATE TABLE [dbo].[BookCategory] ( 
  [category_id] INT IDENTITY(1,1) PRIMARY KEY,
  [category_name] VARCHAR(100) NOT NULL,
  CONSTRAINT [UQ__BookCategory__category_name] UNIQUE ([category_name]) -- Ensures unique category names
);

-- Create BookCategoryMap table to handle many-to-many relationship between Books and BookCategory
CREATE TABLE [dbo].[BookCategoryMap] ( 
  [book_id] INT NOT NULL,
  [category_id] INT NOT NULL,
  CONSTRAINT [FK_Books_BookCategory] FOREIGN KEY ([book_id]) REFERENCES [dbo].[Books]([book_id]),
  CONSTRAINT [FK_BookCategory_Books] FOREIGN KEY ([category_id]) REFERENCES [dbo].[BookCategory]([category_id]),
  PRIMARY KEY ([book_id], [category_id])
);

-- -- Create UserBookMap table (for many-to-many relationship between Users and Books)
CREATE TABLE [dbo].[UserBookMap] (
  [user_id] INT NOT NULL,
  [book_id] INT NOT NULL,
  CONSTRAINT [PK_UserBookMap] PRIMARY KEY ([user_id], [book_id]),
  CONSTRAINT [FK_UserBook_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([user_id]),
  CONSTRAINT [FK_UserBook_Books] FOREIGN KEY ([book_id]) REFERENCES [dbo].[Books] ([book_id])
);

CREATE TABLE FileMetadata (
    id INT PRIMARY KEY IDENTITY(1,1),
    fileName NVARCHAR(255),
    bucketName NVARCHAR(255),
    filePath NVARCHAR(255)
);

-- Insert example categories
INSERT INTO [dbo].[BookCategory] ([category_name]) 
VALUES ('Fiction'), ('Non-Fiction'), ('Mystery'), ('Science Fiction'), ('Fantasy');

-- Insert example users
INSERT INTO [dbo].[Users] ([username], [email], [password], [user_image]) 
VALUES ('jso', 'fleeforezz@gmail.com', '0822863716', NULL);

-- Insert example books
INSERT INTO [dbo].[Books] ([title], [author], [description], [cover_image], [published_date]) 
VALUES 
('Soul', 'James', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg', '2012-12-09T00:00:00.000Z'),
('Memory', 'Joe', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/contemporary-fiction-night-time-book-cover-design-template-1be47835c3058eb42211574e0c4ed8bf_screen.jpg?ts=1698210220', '2023-02-03T00:00:00.000Z'),
('A Million To One', 'Jonny Smith', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://www.designforwriters.com/wp-content/uploads/2017/10/design-for-writers-book-cover-tf-2-a-million-to-one.jpg', '2022-11-23T00:00:00.000Z'),
('My Book Cover', 'William', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://edit.org/images/cat/book-covers-big-2019101610.jpg', '2015-05-22T00:00:00.000Z'),
('Pencil', 'Ubbae', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFXKFIDad4/1/0/1003w/canva-brown-mystery-novel-book-cover-cSu1pdo96zA.jpg', '2012-12-03T00:00:00.000Z'),
('Audrey Magee The Colony', 'Estanon', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://creativereview.imgix.net/content/uploads/2022/12/Colony_Mockup.jpg?auto=compress,format&q=60&w=1436&h=2000', '2001-02-05T00:00:00.000Z'),
('The Killer Poison', 'Yaek', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://img0-placeit-net.s3-accelerate.amazonaws.com/uploads/stage/stage_image/40050/optimized_large_thumb_stage.jpg', '2003-04-23T00:00:00.000Z'),
('Walk Into The Shadow', 'Tomson', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFfSnGl7II/2/0/1003w/canva-elegant-dark-woods-fantasy-photo-book-cover-vAt8PH1CmqQ.jpg', '2004-07-21T00:00:00.000Z'),
('Alone', 'Katalina', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg', '2022-12-03T00:00:00.000Z'),
('Harry Potter And The Globlet Of Fire', 'Osponi', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://images.ctfassets.net/usf1vwtuqyxm/3d9kpFpwHyjACq8H3EU6ra/85673f9e660407e5e4481b1825968043/English_Harry_Potter_4_Epub_9781781105672.jpg', '2012-02-22T00:00:00.000Z'),
('Hide And Seek', 'Qacna', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFf0E5urqk/1/0/1003w/canva-blue-and-green-surreal-fiction-book-cover-53S3IzrNxvY.jpg', '2024-12-04T00:00:00.000Z'),
('Black Hearts', 'Henry', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://i.pinimg.com/474x/88/02/c1/8802c1136de95d161676502a1bd40ede.jpg', '2024-08-18T00:00:00.000Z');

-- Insert mapping of books to categories (example mappings)
INSERT INTO [dbo].[BookCategoryMap] ([book_id], [category_id]) 
VALUES 
(1, 1), -- Book 'Soul' belongs to 'Fiction'
(2, 1), -- Book 'Memory' belongs to 'Fiction'
(3, 3), -- Book 'A Million To One' belongs to 'Mystery'
(4, 5), -- Book 'My Book Cover' belongs to 'Fantasy'
(5, 3), -- Book 'Pencil' belongs to 'Mystery'
(6, 2), -- Book 'Audrey Magee The Colony' belongs to 'Non-Fiction'
(7, 3), -- Book 'The Killer Poison' belongs to 'Mystery'
(8, 4), -- Book 'Walk Into The Shadow' belongs to 'Science Fiction'
(9, 1), -- Book 'Alone' belongs to 'Fiction'
(10, 5), -- Book 'Harry Potter And The Globlet Of Fire' belongs to 'Fantasy'
(11, 3), -- Book 'Hide And Seek' belongs to 'Mystery'
(12, 1); -- Book 'Black Hearts' belongs to 'Fiction'

INSERT INTO [dbo].[UserBookMap] ([user_id], [book_id]) VALUES ('1','2');
INSERT INTO [dbo].[UserBookMap] ([user_id], [book_id]) VALUES ('1','4');
INSERT INTO [dbo].[UserBookMap] ([user_id], [book_id]) VALUES ('1','11');

-- Alter the Books table to add a foreign key user_id 
ALTER TABLE [dbo].[Books] 
ADD [user_id] INT NULL; 
-- Add a foreign key constraint linking Books to Users 
ALTER TABLE [dbo].[Books] 
ADD CONSTRAINT [FK_Books_Users] 
FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users]([user_id]);
```

