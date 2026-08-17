-- =========================================================
-- UNIVERSITY DATABASE ASSIGNMENT
-- =========================================================

-- 1. Create Database
DROP DATABASE IF EXISTS UniversityDB;
CREATE DATABASE UniversityDB;
USE UniversityDB;


-- =========================================================
-- 2. CREATE TABLES
-- =========================================================

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-- Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    StudentID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID)
);


-- =========================================================
-- 3. INSERT SAMPLE DATA
-- At least 5 records in each table
-- =========================================================

-- Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics'),
(4, 'Mechanical Engineering'),
(5, 'Business Administration');

-- Students
INSERT INTO Students (StudentID, Name, Age, DepartmentID) VALUES
(101, 'Alice Johnson', 20, 1),
(102, 'Bob Smith', 21, 1),
(103, 'Charlie Brown', 22, 2),
(104, 'Diana Miller', 20, 3),
(105, 'Ethan Davis', 23, 4),
(106, 'Fiona Wilson', 21, 1),
(107, 'George Taylor', 22, 5);

-- Courses
INSERT INTO Courses (CourseID, CourseName, StudentID) VALUES
(201, 'Artificial Intelligence', 101),
(202, 'Data Structures', 101),
(203, 'Database Management', 102),
(204, 'Data Science', 102),
(205, 'Artificial Intelligence', 103),
(206, 'Web Development', 104),
(207, 'Machine Design', 105),
(208, 'Data Analytics', 106);


-- =========================================================
-- 4. QUERY-BASED QUESTIONS
-- =========================================================


-- a. Retrieve all student details along with their department names
SELECT
    s.StudentID,
    s.Name,
    s.Age,
    d.DepartmentName
FROM Students s
JOIN Departments d
    ON s.DepartmentID = d.DepartmentID;


-- b. Find names of all students enrolled in
--    'Artificial Intelligence'
SELECT DISTINCT
    s.Name
FROM Students s
JOIN Courses c
    ON s.StudentID = c.StudentID
WHERE c.CourseName = 'Artificial Intelligence';


-- c. Count how many students are in each department
SELECT
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Students s
    ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- d. List courses taken by 'Alice Johnson'
SELECT
    c.CourseID,
    c.CourseName
FROM Courses c
JOIN Students s
    ON c.StudentID = s.StudentID
WHERE s.Name = 'Alice Johnson';


-- e. Find students who are enrolled in more than one course
SELECT
    s.StudentID,
    s.Name,
    COUNT(c.CourseID) AS NumberOfCourses
FROM Students s
JOIN Courses c
    ON s.StudentID = c.StudentID
GROUP BY s.StudentID, s.Name
HAVING COUNT(c.CourseID) > 1;


-- f. Find the average age of students in each department
SELECT
    d.DepartmentName,
    ROUND(AVG(s.Age), 2) AS AverageAge
FROM Departments d
LEFT JOIN Students s
    ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- g. Find the department with the most students
SELECT
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Students s
    ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentCount DESC
LIMIT 1;


-- h. List all students who are NOT enrolled in any course
SELECT
    s.StudentID,
    s.Name,
    s.Age,
    s.DepartmentID
FROM Students s
LEFT JOIN Courses c
    ON s.StudentID = c.StudentID
WHERE c.CourseID IS NULL;


-- i. Retrieve students along with the total number of courses
--    they are enrolled in
SELECT
    s.StudentID,
    s.Name,
    COUNT(c.CourseID) AS TotalCourses
FROM Students s
LEFT JOIN Courses c
    ON s.StudentID = c.StudentID
GROUP BY s.StudentID, s.Name
ORDER BY s.StudentID;


-- j. Find students who belong to 'Computer Science' and are
--    taking a course with 'Data' in its name
SELECT DISTINCT
    s.StudentID,
    s.Name,
    d.DepartmentName,
    c.CourseName
FROM Students s
JOIN Departments d
    ON s.DepartmentID = d.DepartmentID
JOIN Courses c
    ON s.StudentID = c.StudentID
WHERE d.DepartmentName = 'Computer Science'
  AND c.CourseName LIKE '%Data%';


-- =========================================================
-- OPTIONAL: DISPLAY TABLE CONTENTS
-- Useful for screenshots
-- =========================================================

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
