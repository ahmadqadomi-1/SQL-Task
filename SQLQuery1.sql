use Library
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

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


select * from Books;
select * from Authors;

--Display All Books and Authors
select Title, FirstName, LastName from Books, Authors;

--Book Availability


--Average Publication Year


--Total Books Count


--Empty Books Table


-- Delete Authors Table
--DROP TABLE IF EXISTS Authors;