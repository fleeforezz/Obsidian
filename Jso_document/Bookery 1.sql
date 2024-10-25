IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users];
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
DROP TABLE [dbo].[Books];
CREATE TABLE [dbo].[Users] ( 
  [user_id] INT NOT NULL,
  [username] VARCHAR(60) NOT NULL,
  [email] VARCHAR(60) NOT NULL,
  [password] VARCHAR(255) NOT NULL,
  [user_image] VARCHAR(255) NULL,
  CONSTRAINT [PK__Users__B9BE370F7BD75DD7] PRIMARY KEY ([user_id]),
  CONSTRAINT [UQ__Users__AB6E6164929A2586] UNIQUE ([email])
);
CREATE TABLE [dbo].[Books] ( 
  [book_id] INT NOT NULL,
  [title] VARCHAR(255) NOT NULL,
  [author] VARCHAR(255) NULL,
  [description] TEXT NULL,
  [cover_image] VARCHAR(255) NULL,
  [published_date] DATETIME NULL,
  CONSTRAINT [PK__Books__490D1AE13FB8F2E9] PRIMARY KEY ([book_id])
);
INSERT INTO [dbo].[Users] ([user_id], [username], [email], [password], [user_image]) VALUES (1, 'jso', 'fleeforezz@gmail.com', '0822863716', NULL);
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (1, 'Soul', 'James', 'A book review is a form of literary criticism in which a book is merely described or analyzed. ', 'https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg', '2012-12-09T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (2, 'Memory', 'Joe', 'A book review is a form of literary criticism in which a book is merely described or analyzed. ', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/contemporary-fiction-night-time-book-cover-design-template-1be47835c3058eb42211574e0c4ed8bf_screen.jpg?ts=1698210220', '2023-02-03T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (3, 'A Million To One', 'Jonny Smith', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://www.designforwriters.com/wp-content/uploads/2017/10/design-for-writers-book-cover-tf-2-a-million-to-one.jpg', '2022-11-23T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (4, 'My Book Cover', 'William', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://edit.org/images/cat/book-covers-big-2019101610.jpg', '2015-05-22T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (5, 'Pencil', 'Ubbae', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFXKFIDad4/1/0/1003w/canva-brown-mystery-novel-book-cover-cSu1pdo96zA.jpg', '2012-12-03T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (6, 'Audrey Magee The Colony', 'Estanon', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://creativereview.imgix.net/content/uploads/2022/12/Colony_Mockup.jpg?auto=compress,format&q=60&w=1436&h=2000', '2001-02-05T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (7, 'The Killer Poison', 'Yaek', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://img0-placeit-net.s3-accelerate.amazonaws.com/uploads/stage/stage_image/40050/optimized_large_thumb_stage.jpg', '2003-04-23T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (8, 'Walk Into The Shadow', 'Tomson', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFfSnGl7II/2/0/1003w/canva-elegant-dark-woods-fantasy-photo-book-cover-vAt8PH1CmqQ.jpg', '2004-07-21T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (9, 'Alone', 'Katalina', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg', '2022-12-03T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (10, 'Harry Potter And The Globlet Of Fire', 'Osponi', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://images.ctfassets.net/usf1vwtuqyxm/3d9kpFpwHyjACq8H3EU6ra/85673f9e660407e5e4481b1825968043/English_Harry_Potter_4_Epub_9781781105672.jpg', '2012-02-22T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (11, 'Hide And Seek', 'Qacna', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://marketplace.canva.com/EAFf0E5urqk/1/0/1003w/canva-blue-and-green-surreal-fiction-book-cover-53S3IzrNxvY.jpg', '2024-12-04T00:00:00.000Z');
INSERT INTO [dbo].[Books] ([book_id], [title], [author], [description], [cover_image], [published_date]) VALUES (12, 'Black Hearts', 'Henry', 'A book review is a form of literary criticism in which a book is merely described or analyzed.', 'https://i.pinimg.com/474x/88/02/c1/8802c1136de95d161676502a1bd40ede.jpg', '2024-08-18T00:00:00.000Z');
