-- Database: capstone

-- DROP DATABASE IF EXISTS capstone;

CREATE DATABASE capstone
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
-- Table creation and Value insertion: STUDENTS

CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  date_of_birth DATE,
  email VARCHAR(100),
  major VARCHAR(50)
);

INSERT INTO Students 
	(student_id, student_name, date_of_birth, email, major)
VALUES
  (1, 'John Doe', '1998-07-15', 'john.doe@example.com', 'Computer Science'),
  (2, 'Jane Smith', '1999-03-22', 'jane.smith@example.com', 'Mathematics'),
  (3, 'Michael Johnson', '2000-11-08', 'michael.johnson@example.com', 'Computer Science'),
  (4, 'Emily Williams', '2001-05-01', 'emily.williams@example.com', 'Physics');

--Table creation and Value insertion: COURSES


CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100),
  credit_hours INT,
  instructor VARCHAR(100)
);

INSERT INTO Courses (course_id, course_name, credit_hours, instructor)
VALUES
  (101, 'Database Management', 3, 'Prof. Brown'),
  (102, 'Programming Fundamentals', 4, 'Prof. White'),
  (103, 'Calculus I', 4, 'Prof. Smith'),
  (104, 'Physics I', 4, 'Prof. Johnson');


-- QUERIES WRITTEN FOR THE FOLLOWING:


--  Retrieve the list of all students.

SELECT * FROM Students

-- Retrieve the list of all courses.

SELECT * FROM Courses

-- Retrieve the list of students who are majoring in a specific major.

SELECT * FROM Students 
WHERE major = 'Computer Science';

-- Retrieve the list of students who were born before a specific date.

SELECT * FROM Students 
WHERE date_of_birth < '2000-01-01';


-- Retrieve the list of courses taught by a specific instructor.

SELECT * FROM Courses
WHERE instructor = 'Prof. Smith';

--  Retrieve the total number of students enrolled in each major.

select major, count(*) as no_of_students
from students
group by major

-- Retrieve the course with the highest number of credit hours.
 
select course_name, credit_hours
from courses
order by credit_hours desc
limit 1

-- Retrieve the youngest students in the database.

select student_name,date_of_birth
from students
order by date_of_birth asc
limit 1

-- Retrieve the oldest student in the database.

select student_name,date_of_birth
from students
order by date_of_birth desc
limit 1

--  Add a new course to the Courses table.

INSERT INTO Courses
	(course_id, course_name, credit_hours, instructor)
VALUES 
	(105, 'Algorithms', 3, 'Prof. Lee');

-- Enroll a new student in the Students table.

INSERT INTO Students 
(student_id, student_name, date_of_birth, email, major)
VALUES 
(5, 'William Johnson', '2002-09-12', 'william.johnson@example.com', 'Computer Science');

-- Update the email address of a student based on their student_id.

update students
set
email='jane.smith@gmail.com'
where student_id=2



