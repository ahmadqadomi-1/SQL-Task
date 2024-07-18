USE [Jaradat-Tech];

DROP TABLE IF EXISTS Books; 
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Sections;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Authors;

------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    BirthYear INT
);
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES
(2001, 'Taha', 'Hussein', 1889),
(2002, 'Ghassan', 'Kanafani', 1936),
(2003, 'Nizar', 'Qabbani', 1923),
(2004, 'Naguib', 'Mahfouz', 1911),
(2005, 'Mahmoud', 'Darwish', 1941);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    EmployeePhoneNum VARCHAR(15),
    EmployeeAge INT,
    Employees_MotherName VARCHAR(40)
);
INSERT INTO Employees (EmployeeID, EmployeeName, EmployeePhoneNum, EmployeeAge, Employees_MotherName) VALUES
(5001, 'Mohammad', '0799999', 30, 'Sameera'),
(5002, 'Khaled', '0799999', 28, 'Ezdehar'),
(5003, 'Sameer', '0799999', 22, 'Zainab'),
(5004, 'Qais', '0799999', 45, 'Azhar'),
(5005, 'Amar', '0799999', 25, 'Mariam');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Sections (
    SectionID INT PRIMARY KEY,
    SectionsName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) -- Fixed foreign key constraint
);
INSERT INTO Sections (SectionID, SectionsName, EmployeeID) VALUES
(4001, 'SectionName1', 5001),
(4002, 'SectionName2', 5002),
(4003, 'SectionName3', 5003),
(4004, 'SectionName4', 5004),
(4005, 'SectionName5', 5005);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50),
    CategoryType VARCHAR(50),
    CategoryMode VARCHAR(50),
    CategoryAnyThing VARCHAR(50)
);
INSERT INTO Categories (CategoryID, CategoryName, CategoryType, CategoryMode, CategoryAnyThing) VALUES
(6001, 'CategoryName1', 'Historical', 'HistoricalMode', 'A'),
(6002, 'CategoryName2', 'Careers', 'CareersMode', 'B'),
(6003, 'CategoryName3', 'Fantasy', 'FantasyMode', 'C'),
(6004, 'CategoryName4', 'Animals', 'AnimalsMode', 'D'),
(6005, 'CategoryName5', 'Classics', 'ClassicsMode', 'E');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BooksTitle VARCHAR(30),
    AuthorID INT,
    UsersID INT,
    SectionID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (SectionID) REFERENCES Sections(SectionID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
INSERT INTO Books (BookID, BooksTitle, AuthorID, UsersID, SectionID, CategoryID) VALUES
(1001, 'BooksTitle1', 2001, 3001, 4001, 6001),
(1002, 'BooksTitle2', 2002, 3002, 4002, 6002),
(1003, 'BooksTitle3', 2003, 3003, 4003, 6003),
(1004, 'BooksTitle4', 2004, 3004, 4004, 6004),
(1005, 'BooksTitle5', 2005, 3005, 4005, 6005);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    UserPhoneNum VARCHAR(15),
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) 
);
INSERT INTO Users (UserID, UserName, UserPhoneNum, BookID) VALUES
(3001, 'Sameh', '0799999', 1001),
(3002, 'Omar', '0799999', 1002),
(3003, 'Ali', '0799999', 1003),
(3004, 'Moh', '0799999', 1004),
(3006, 'MESSI', '0788888', NULL),
(3005, 'Duaa', '0799999', 1005);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Booker(
 BookID INT,
    UserID INT,
    PRIMARY KEY (BookID, UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO Booker (BookID, UserID) VALUES
(1001, 3001),
(1002, 3002),
(1003, 3003),
(1004, 3004),
(1005, 3005);
------------------------------------------------------Break------------------------------------------------------!
SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM Sections;
SELECT * FROM Categories;
SELECT * FROM Users;
SELECT * FROM Employees;
SELECT * FROM Booker;
------------------------------------------------------Break------------------------------------------------------!
--FULL JOIN
SELECT A.AuthorID, FirstName, BookID, BooksTitle
FROM Authors A JOIN Books B
ON A.AuthorID = B.AuthorID;

SELECT *
FROM Authors FULL JOIN Books
ON Authors.AuthorID = Books.AuthorID;

SELECT *
FROM Users FULL JOIN Books
ON Users.UserID = Books.AuthorID;
------------------------------------------------------Break------------------------------------------------------!
--RIGHT JOIN
SELECT Books.BooksTitle, Users.UserName, Users.UserPhoneNum
FROM Users RIGHT OUTER JOIN Books
ON Users.UserID = Books.AuthorID
ORDER BY Users.UserID;

SELECT *
FROM Users RIGHT OUTER JOIN Booker
ON Users.UserID = Booker.UserID;
------------------------------------------------------Break------------------------------------------------------!
--LEFT JOIN
SELECT Books.BooksTitle, Users.UserName, Users.UserPhoneNum
FROM Users LEFT OUTER JOIN Books
ON Users.UserID = Books.AuthorID
ORDER BY Users.UserID;
