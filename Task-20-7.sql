USE SQlLastTask;
------------------------------------------------------Break------------------------------------------------------!
DROP TABLE IF EXISTS Students; 
DROP TABLE IF EXISTS Family_Info;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Attendance;
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	Student_Name VARCHAR (20),
	Date_Of_Birth DATE,
	Student_Address VARCHAR (20)
);
INSERT INTO Students (StudentID, Student_Name, Date_Of_Birth, Student_Address) VALUES
(1001, 'Ahmad', '2000-01-27', 'Irbid'),
(1002, 'Omar', '1962-03-15', 'Irbid'),
(1003, 'Ali', '1936-01-16', 'Irbid'),
(1004, 'Qasem', '2000-01-17', 'Irbid');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Family_Info (
	FamilyInfoID INT PRIMARY KEY,
	Father_Name VARCHAR (20),
	Father_PhoneNum INT,
	StudentID INT ,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
);
INSERT INTO Family_Info (FamilyInfoID, Father_Name, Father_PhoneNum, StudentID) VALUES
(2001, 'Omar', 079000, 1001),
(2002, 'Ali', 079111, 1002),
(2003, 'AbdAlrahem', 078555, 1003),
(2004, 'Omar', 077444, 1001);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
	Course_Name VARCHAR (20),
	StudentID INT,
	Course_description VARCHAR (20),
	Course_Resource VARCHAR (20)
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
);
INSERT INTO Courses (CourseID, Course_Name, StudentID, Course_description, Course_Resource) Values
( 3001, 'HTML', 1001, 'This is a HTML', 'w3schools'),
( 3002, 'CSS', 1002, 'This is a CSS', 'w3schools'),
( 3003, 'JavaScript', 1003, 'This is a JavaScript', 'w3schools'),
( 3004, 'CSharp', 1004, 'This is a CSharp', 'w3schools');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Classes (
	ClassesID INT PRIMARY KEY,
	Class_Code VARCHAR (20),
	Class_RoomNumber INT,
	StudentID INT,
	  Start_Time TIME,
	End_Time TIME
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
);
INSERT INTO Classes (ClassesID, Class_Code, Class_RoomNumber, StudentID, Start_Time, End_Time) VALUES
( 4001, 'A01', 021, 1001, '10:00' , '11:30'),
( 4002, 'A02', 022, 1002, '11:30' , '01:00'),
( 4003, 'A03', 023, 1003, '01:00' , '02:30'),
( 4004, 'A04', 024, 1004, '02:30' , '04:00');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Assignments(
	AssignmentID INT PRIMARY KEY,
	Assignment_Name VARCHAR (20),
	CourseID INT, 
	Assignment_Description VARCHAR (30),
	StudentID INT, 
	Due_Date VARCHAR (20),
	The_States VARCHAR (20),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Assignments (AssignmentID, Assignment_Name,  CourseID, Assignment_Description, StudentID, Due_Date, The_States) VALUES
(5001, 'HTMLAS', 3001, 'HTML Assignment', 1001, '2024-07-15', 'Pass'),
(5002, 'CSSAS', 3002, 'CSS Assignment', 1002, '2024-07-17', 'Pass'),
(5003, 'JavaScriptAS', 3003, 'JS Assignment', 1002, '2024-07-10', 'failed'),
(5004, 'CSharpAS', 3004, 'CSharp Assignment', 1001, '2024-07-12', 'Pass');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Attendance (
	AttendanceID INT PRIMARY KEY,
	StudentID INT,
	Attendance_Date DATE,
	Type_Of_Absence VARCHAR (20),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
);
INSERT INTO Attendance (AttendanceID, StudentID, Attendance_Date, Type_Of_Absence) VALUES
(6001, 1001, '2024-07-19', 'leaving'),
(6002, 1002, '2024-07-10', 'absence'),
(6003, 1003, '2024-07-09', 'late'),
(6004, 1004, '2024-07-15', 'leaving');
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Courses_Students (
StudentID INT,
CourseID INT,
PRIMARY KEY (StudentID, CourseID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Courses_Students (StudentID, CourseID) VALUES
(1001, 3001),
(1002, 3002),
(1002, 3003),
(1001, 3004);
------------------------------------------------------Break------------------------------------------------------!
CREATE TABLE Assignments_Students (
StudentID Int,
AssignmentID Int,
Primary key (StudentID, AssignmentID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID)
);
------------------------------------------------------Break------------------------------------------------------!
select * from Students;
select * from Family_Info;
select * from Courses;
select * from Assignments;
select * from Attendance;
select * from Courses_Students;
select * from Assignments_Students;
------------------------------------------------------Q1------------------------------------------------------!
--Q1???
SELECT Student_Name FROM Students WHERE Date_Of_Birth = '2000-01-27';
------------------------------------------------------Q2------------------------------------------------------!
SELECT Course_Name,Course_description FROM Courses;
------------------------------------------------------Q3------------------------------------------------------!
ALTER TABLE Students ADD EMAIL VARCHAR(100);
------------------------------------------------------Q4------------------------------------------------------!
INSERT INTO Students (StudentID, Student_Name, Date_Of_Birth, Student_Address) VALUES
(1005, 'ANAS', '1998-10-07', 'Irbid');
SELECT * FROM Students;
------------------------------------------------------Q5------------------------------------------------------!
UPDATE Family_Info SET StudentID = 1004 WHERE FamilyInfoID = 2004;
select * from Family_Info;
Select StudentID FROM Family_Info WHERE Father_Name = 'Omar';
------------------------------------------------------Q6------------------------------------------------------!
INSERT INTO Courses (CourseID, Course_Name, StudentID, Course_description, Course_Resource) VALUES
(3005, 'C#', 1002, 'This is a CSharp', 'w3schools'),
(3006, 'MVC', 1002, 'This is a MVC', 'w3schools');
 select * from Courses;
 Select Courses.Course_Name from Courses WHERE StudentID = 1002;

Select Students.Student_Name, Courses.Course_Name from Students left join 
Courses_Students on Courses_Students.StudentID = Students.StudentID 
join Courses on Courses_Students.CourseID = Courses.CourseID;
 ------------------------------------------------------Q7------------------------------------------------------!
 select Students.Student_Name from Students 
 join Assignments_Students on Students.StudentID = Assignments_Students.StudentID
 JOIN Assignments ON Assignments.AssignmentID = Assignments_Students.AssignmentID
 WHERE Assignments.The_States = 'Pass';
 ------------------------------------------------------Q8------------------------------------------------------!
 SELECT Students.Student_Name FROM Students
 JOIN Attendance ON Students.StudentID = Attendance.StudentID
 WHERE Attendance.Attendance_Date >= '2024-07-09'
 AND Attendance.Attendance_Date <= '2024-07-15'
 AND Attendance.Type_Of_Absence = 'leaving';
 ------------------------------------------------------Q9------------------------------------------------------!
 SELECT Students.Student_Name, count (*)
 FROM Students
 JOIN Attendance ON Students.StudentID = Attendance.StudentID
 WHERE Attendance.Type_Of_Absence = 'leaving'
 GROUP BY Students.Student_Name
 HAVING COUNT (Attendance.Type_Of_Absence) < 4 ;

 