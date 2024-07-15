use Library
DROP TABLE Books;
DROP TABLE Authors;

create table Books(
BookID int primary key,
Title varchar(30),
AuthorID int,
PublishedYear date,
CopiesAvailable int,
BookCategory varchar(50)
);

insert into Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) values 
(1001 , 'title1', 2001, '1998-08-24', 123, 'Historical');
insert into Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) values 
(1002 , 'title2', 2002, '1999-09-25', 130, 'Careers');
insert into Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) values 
(1003 , 'title3', 2003, '1998-10-26', 502, 'Fantasy');
insert into Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) values 
(1004 , 'title4', 2004, '1998-11-27', 100, 'Animals');
insert into Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) values 
(1005 , 'title5', 2005, '1998-07-28', 222, 'Classics');

create table Authors(
AuthorID int primary key,
FirstName varchar (15),
LastName varchar (15),
BirthYear int
);

insert into Authors (AuthorID, FirstName, LastName, BirthYear) values 
(2001, 'Taha', 'Hussein', 1889);
insert into Authors (AuthorID, FirstName, LastName, BirthYear) values 
(2002, 'Ghassan', 'Kanafani', 1936);
insert into Authors (AuthorID, FirstName, LastName, BirthYear) values 
(2003, 'Nizar', 'Qabbani', 1923);
insert into Authors (AuthorID, FirstName, LastName, BirthYear) values 
(2004, 'Naguib', 'Mahfouz', 1911);
insert into Authors (AuthorID, FirstName, LastName, BirthYear) values 
(2005, 'Mahmoud', 'Darwish', 1941);


--select * from Books;
--select * from Authors;


--Display All Books and Authors
--select Title, FirstName, LastName from Books, Authors;
select 
Authors.AuthorID,
Title, 
FirstName,
LastName from Authors join Books on Books.AuthorID= Authors.AuthorID;

--Book Availability
select CopiesAvailable from Books where CopiesAvailable = (select MAX (CopiesAvailable) from Books);
select CopiesAvailable from Books where CopiesAvailable = (select min (CopiesAvailable) from Books);

--Average Publication Year
select AVG (YEAR (PublishedYear) )from Books;

--Total Books Count
select SUM (CopiesAvailable )from Books;

--Empty Books Table
truncate table Books;

-- Delete Authors Table
DROP TABLE Authors;