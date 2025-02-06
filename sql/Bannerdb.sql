DROP DATABASE IF EXISTS bannerdb;
CREATE DATABASE bannerdb;
USE bannerdb;

-- Table: convo
CREATE TABLE convos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 credits INT NOT NULL,
 title VARCHAR(255) NOT NULL,
 location VARCHAR(255),
 cost DECIMAL(10,2) NOT NULL
);

-- Table: Departments
CREATE TABLE departments (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(255) UNIQUE NOT NULL,
 abbr VARCHAR(10) UNIQUE NOT NULL,
 chair_id INT
);

-- Table: Faculty
CREATE TABLE facultys (
 id INT AUTO_INCREMENT PRIMARY KEY,
 ninenumber CHAR(9) UNIQUE NOT NULL,
 fname VARCHAR(100) NOT NULL,
 lname VARCHAR(100) NOT NULL,
 email VARCHAR(255) UNIQUE NOT NULL,
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE SET NULL
);

ALTER TABLE departments ADD CONSTRAINT
 FOREIGN KEY (chair_id) REFERENCES facultys(id) ON DELETE SET NULL;

-- Table: Student
CREATE TABLE students (
 id INT AUTO_INCREMENT PRIMARY KEY,
 ninenumber CHAR(9) UNIQUE NOT NULL,
 fname VARCHAR(100) NOT NULL,
 lname VARCHAR(100) NOT NULL,
 email VARCHAR(255) UNIQUE NOT NULL,
 faculty_id INT,
 FOREIGN KEY (faculty_id) REFERENCES facultys(id) ON DELETE SET NULL
);

-- Table: attendance
CREATE TABLE attendance (
 id INT AUTO_INCREMENT PRIMARY KEY,
 student_id INT,
 convo_id INT,
 scantime DATETIME NOT NULL,
 FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
 FOREIGN KEY (convo_id) REFERENCES convos(id) ON DELETE SET NULL
);

-- Table: Courses
CREATE TABLE courses (
 id INT AUTO_INCREMENT PRIMARY KEY,
 dept_id INT,
 number VARCHAR(20) NOT NULL,
 name VARCHAR(255) NOT NULL,
 descr TEXT,
 FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE SET NULL
);

-- Table: Terms
CREATE TABLE terms (
 id INT AUTO_INCREMENT PRIMARY KEY,
 startdate DATE NOT NULL,
 enddate DATE NOT NULL,
 name VARCHAR(100) UNIQUE NOT NULL
);

-- Table: Sections
CREATE TABLE sections (
 id INT AUTO_INCREMENT PRIMARY KEY,
 course_id INT,
 term_id INT,
 location VARCHAR(255),
 timeofday TIME NOT NULL,
 dayofweek VARCHAR(20),
 FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE SET NULL,
 FOREIGN KEY (term_id) REFERENCES terms(id) ON DELETE SET NULL
);

-- Creating the join table for faculty and sections (co-teaching)
CREATE TABLE section_faculty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id INT,
    section_id INT,
    FOREIGN KEY (faculty_id) REFERENCES facultys(id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE CASCADE
);

-- Table: enrollments
CREATE TABLE enrollments (
 id INT AUTO_INCREMENT PRIMARY KEY,
 student_id INT,
 section_id INT,
 passfail BOOLEAN NOT NULL DEFAULT FALSE,
 dateregistered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE SET NULL,
 FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE SET NULL
);

