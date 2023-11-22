--CREATE DATABASE AlininoDB
--USE AlininoDB

--CREATE TABLE Categories
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(30) NOT NULL,
--	ParentCategoryId INT REFERENCES Categories(Id),
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE Authors
--(
--	Id INT IDENTITY PRIMARY KEY,
--	[Name] NVARCHAR(40) NOT NULL,
--	Surname NVARCHAR(50) NOT NULL,
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE PublishingHouses
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(64) NOT NULL,
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE Bindings
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(64) NOT NULL,
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE Books
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(64) NOT NULL,
--	[Description] NVARCHAR(256) DEFAULT 'No description',
--	ActualPrice MONEY NOT NULL,
--	DiscountPrice MONEY DEFAULT NULL,
--	PublishingHouseId INT REFERENCES PublishingHouses(Id),
--	StockCount INT,
--	ArticleCode VARCHAR(50) NOT NULL,
--	BindingId INT REFERENCES Bindings(Id),
--	Pages INT NOT NULL,
--	CategoryId INT REFERENCES Categories(Id),
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE Genres
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(64) NOT NULL,
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE Languages
--(
--	Id INT IDENTITY PRIMARY KEY,
--	Title NVARCHAR(64) NOT NULL,
--	IsDeleted BIT DEFAULT 0
--)
--CREATE TABLE BooksAuthors
--(
--	Id INT IDENTITY PRIMARY KEY,
--	BookId INT REFERENCES Books(Id),
--	AuthorId INT REFERENCES Authors(Id)
--)
--CREATE TABLE BooksGenres
--(
--	Id INT IDENTITY PRIMARY KEY,
--	BookId INT REFERENCES Books(Id),
--	GenreId INT REFERENCES Genres(Id),
--)
--CREATE TABLE BooksLanguages
--(
--	Id INT IDENTITY PRIMARY KEY,
--	BookId INT REFERENCES Books(Id),
--	LanguageId INT REFERENCES Languages(Id)
--)
--CREATE TABLE Comments
--(
--	Id INT IDENTITY PRIMARY KEY,
--	[Description] NVARCHAR(256),
--	BookId INT REFERENCES Books(Id),
--	Rating INT CHECK (Rating > 0 AND Rating <= 5),
--	Name NVARCHAR(35) NOT NULL,
--	Email NVARCHAR(35) NOT NULL,
--	ImageUrl NVARCHAR(380),
--	IsDeleted BIT DEFAULT 0
--)


-------------------------------------------------------------------------------------------------------------------------------
----Royal's Task 1:

--CREATE PROCEDURE InsertBookData
--(
--    @Title NVARCHAR(64),
--    @Description NVARCHAR(256) = 'No description',
--    @ActualPrice MONEY,
--    @DiscountPrice MONEY = NULL,
--    @PublishingHouseTitle NVARCHAR(64),
--    @StockCount INT,
--    @ArticleCode VARCHAR(50),
--    @BindingTitle NVARCHAR(64),
--    @Pages INT,
--    @CategoryTitle NVARCHAR(30),
--    @AuthorName NVARCHAR(40),
--    @AuthorSurname NVARCHAR(50),
--    @GenreTitle NVARCHAR(64),
--    @LanguageTitle NVARCHAR(64),
--    @CommentDescription NVARCHAR(256),
--    @Rating INT,
--    @CommentName NVARCHAR(35),
--    @CommentEmail NVARCHAR(35),
--    @CommentImageUrl NVARCHAR(380)
--)
--AS
--BEGIN
--    DECLARE @PublishingHouseId INT
--    INSERT INTO PublishingHouses (Title) VALUES (@PublishingHouseTitle)
--    SET @PublishingHouseId = SCOPE_IDENTITY()

--    DECLARE @BindingId INT
--    INSERT INTO Bindings (Title) VALUES (@BindingTitle)
--    SET @BindingId = SCOPE_IDENTITY()

--    DECLARE @CategoryId INT
--    INSERT INTO Categories (Title) VALUES (@CategoryTitle)
--    SET @CategoryId = SCOPE_IDENTITY()

--    DECLARE @AuthorId INT
--    INSERT INTO Authors ([Name], Surname) VALUES (@AuthorName, @AuthorSurname)
--    SET @AuthorId = SCOPE_IDENTITY()

--    DECLARE @GenreId INT
--    INSERT INTO Genres (Title) VALUES (@GenreTitle)
--    SET @GenreId = SCOPE_IDENTITY()

--    DECLARE @LanguageId INT
--    INSERT INTO Languages (Title) VALUES (@LanguageTitle)
--    SET @LanguageId = SCOPE_IDENTITY()

--    DECLARE @BookId INT
--    INSERT INTO Books (Title, [Description], ActualPrice, DiscountPrice, PublishingHouseId, StockCount, ArticleCode, BindingId, Pages, CategoryId)
--    VALUES (@Title, @Description, @ActualPrice, @DiscountPrice, @PublishingHouseId, @StockCount, @ArticleCode, @BindingId, @Pages, @CategoryId)
--    SET @BookId = SCOPE_IDENTITY()

--    INSERT INTO BooksAuthors (BookId, AuthorId) VALUES (@BookId, @AuthorId)
--    INSERT INTO BooksGenres (BookId, GenreId) VALUES (@BookId, @GenreId)
--    INSERT INTO BooksLanguages (BookId, LanguageId) VALUES (@BookId, @LanguageId)

--    INSERT INTO Comments ([Description], BookId, Rating, Name, Email, ImageUrl)
--    VALUES (@CommentDescription, @BookId, @Rating, @CommentName, @CommentEmail, @CommentImageUrl)
--END

--EXEC InsertBookData 'Title', 'Descrip', 2555, NULL, 'PubDescr', 20, 'ArtcCode', 'soft', 465, 'Books', 'Author',
--'Authorov', 'Genre', 'en', 'CommentDescr', 4, 'CommName', 'Commemail@..ad.w.', 'Image' --Worked


---- update qaldi >:(


---- Royal's Task 2:

--CREATE TRIGGER TR_Authors_UpdateIsDeleted
--ON Authors
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Authors
--    SET IsDeleted = 1
--    FROM Authors a
--    INNER JOIN deleted d ON a.Id = d.Id;
--END

--CREATE TRIGGER TR_PublishingHouses_UpdateIsDeleted
--ON PublishingHouses
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE PublishingHouses
--    SET IsDeleted = 1
--    FROM PublishingHouses ph
--    INNER JOIN deleted d ON ph.Id = d.Id;
--END

--CREATE TRIGGER TR_Bindings_UpdateIsDeleted
--ON Bindings
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Bindings
--    SET IsDeleted = 1
--    FROM Bindings b
--    INNER JOIN deleted d ON b.Id = d.Id;
--END

--CREATE TRIGGER TR_Categories_UpdateIsDeleted
--ON Categories
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Categories
--    SET IsDeleted = 1
--    FROM Categories c
--    INNER JOIN deleted d ON c.Id = d.Id;
--END

--CREATE TRIGGER TR_Genres_UpdateIsDeleted
--ON Genres
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Genres
--    SET IsDeleted = 1
--    FROM Genres g
--    INNER JOIN deleted d ON g.Id = d.Id;
--END

--CREATE TRIGGER TR_Languages_UpdateIsDeleted
--ON Languages
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Languages
--    SET IsDeleted = 1
--    FROM Languages l
--    INNER JOIN deleted d ON l.Id = d.Id;
--END

--CREATE TRIGGER TR_Books_UpdateIsDeleted
--ON Books
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Books
--    SET IsDeleted = 1
--    FROM Books b
--    INNER JOIN deleted d ON b.Id = d.Id;
--END

--CREATE TRIGGER TR_Comments_UpdateIsDeleted
--ON Comments
--AFTER DELETE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    UPDATE Comments
--    SET IsDeleted = 1
--    FROM Comments c
--    INNER JOIN deleted d ON c.Id = d.Id;
--END
