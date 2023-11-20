----Royal's Task 1.

----Creating a DB
--CREATE DATABASE SQL_Joins

----Creating tables
--CREATE TABLE Roles (
--    RoleID INT PRIMARY KEY, --RoleID INT IDENTITY PRIMARY KEY -> AutoIncrement
--    Name VARCHAR(255) NOT NULL
--);
--CREATE TABLE Users (
--    UserID INT PRIMARY KEY, --
--    Username VARCHAR(255) NOT NULL,
--    Password VARCHAR(255) NOT NULL,
--    RoleID INT,
--    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
--);

----Adding data into Roles table
--INSERT INTO Roles (RoleID, Name) VALUES
--    (1, 'Admin'),
--    (2, 'Moderator'),
--    (3, 'User');
----Adding data into Users table
--INSERT INTO Users (UserID, Username, Password, RoleID) VALUES
--    (1, 'admin_user', 'admin_password', 1),
--    (2, 'moderator_user', 'moderator_password', 2),
--    (3, 'regular_user', 'user_password', 3);

----Result
--SELECT Users.UserID, Users.Username, Roles.Name AS RoleName
--FROM Users
--JOIN Roles ON Users.RoleID = Roles.RoleID;

----Royal's Task 2.

----Creating a table
--CREATE TABLE Categories (
--    CategoryID INT PRIMARY KEY,
--    CategoryName VARCHAR(255) NOT NULL,
--    ParentCategoryID INT,
--    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
--);

---- Insert data into Categories table
--INSERT INTO Categories (CategoryID, CategoryName, ParentCategoryID) VALUES
--    (1, 'Electronics', NULL),                  -- Top-level category
--    (2, 'Smartphones', 1),                      -- Subcategory of Electronics
--    (3, 'Laptops', 1),                          -- Subcategory of Electronics
--    (4, 'Clothing', NULL),                      -- Top-level category
--    (5, 'Men''s Clothing', 4),                  -- Subcategory of Clothing
--    (6, 'Women''s Clothing', 4),                -- Subcategory of Clothing
--    (7, 'Shoes', 4);                            -- Subcategory of Clothing

----Result
--SELECT 
--    c1.CategoryID AS ParentCategoryID, 
--    c1.CategoryName AS ParentCategory,
--    c2.CategoryID AS SubcategoryID,
--    c2.CategoryName AS Subcategory
--FROM Categories c1
--LEFT JOIN Categories c2 ON c1.CategoryID = c2.ParentCategoryID;