-- Step 1: Insert Departments first (without chair_id)
INSERT INTO departments (name, abbr, chair_id)
VALUES
('Computer Science', 'CS', NULL),
('Mathematics', 'MATH', NULL),
('Engineering', 'ENG', NULL),
('Physics', 'PHYS', NULL);

-- Step 2: Insert Faculty members (using NULL for chair_id initially)
INSERT INTO facultys (ninenumber, fname, lname, email, dept_id)
VALUES
('111223344', 'Alice', 'Green', 'alice.green@university.com', 1),
('223344556', 'Bob', 'Brown', 'bob.brown@university.com', 2),
('334455667', 'Charlie', 'White', 'charlie.white@university.com', 3),
('445566778', 'David', 'Black', 'david.black@university.com', 4);

-- Step 3: Update Departments with the correct chair_id once faculty members are inserted
UPDATE departments SET chair_id = 1 WHERE id = 1; -- Assign Alice Green as the chair for CS department
UPDATE departments SET chair_id = 2 WHERE id = 2; -- Assign Bob Brown as the chair for Math department
UPDATE departments SET chair_id = 3 WHERE id = 3; -- Assign Charlie White as the chair for Engineering department
UPDATE departments SET chair_id = 4 WHERE id = 4; -- Assign David Black as the chair for Physics department

-- Sample Data for convos table
INSERT INTO convos (credits, title, location, eventdate, cost)
VALUES
(3, 'Sermon on the Mount', 'Reid Chapel', '2025-01-25 08:30:00', 0.0),
(4, 'Olives in the Bible', 'Hodges Chapel', '2025-01-25 09:00:00', 0.0),
(2, 'Theology of Sport', 'Seibert Hall Conference Rooms', '2025-01-26 10:15:00', 0.0),
(4, 'Christian Resources in the Library', 'The Library', '2025-01-26 14:00:00', 0.0),
(2, 'Christ in the Digital Age', 'Wright Center', '2025-02-01 11:00:00', 0.0),
(3, 'Social Media Christians', 'Pete Hannah Center', '2025-02-02 14:15:00', 5.0),
(3, 'The Anxious Generation', 'Wright Center', '2025-02-03 19:00:00', 10.00);

-- Sample Data for students table
INSERT INTO students (ninenumber, fname, lname, email, faculty_id)
VALUES
('123456789', 'John', 'Doe', 'john.doe@example.com', 1),
('987654321', 'Jane', 'Smith', 'jane.smith@example.com', 2),
('456789123', 'Mark', 'Johnson', 'mark.johnson@example.com', 2),
('789123456', 'Emily', 'Davis', 'emily.davis@example.com', 3),
('234567890', 'Lucas', 'Miller', 'lucas.miller@example.com', 3),
('345678901', 'Olivia', 'Wilson', 'olivia.wilson@example.com', 3),
('567890123', 'Ethan', 'Moore', 'ethan.moore@example.com', 1),
('678901234', 'Sophia', 'Taylor', 'sophia.taylor@example.com', null);

-- Sample Data for attendance table
INSERT INTO attendance (student_id, convo_id, scantime)
VALUES
(1, 1, '2025-01-25 08:30:00'),
(2, 2, '2025-01-25 09:00:00'),
(3, 3, '2025-01-26 10:15:00'),
(4, 4, '2025-01-26 14:00:00'),
(1, 5, '2025-02-01 11:00:00'),
(2, 6, '2025-02-02 10:00:00'),
(5, 3, '2025-01-26 10:15:01'),
(6, 4, '2025-01-26 14:00:01');

-- Some students haven't attended any convos
-- (For example, student 7 and 8 haven't attended anything)

-- Sample Data for courses table
INSERT INTO courses (dept_id, number, name, descr)
VALUES
(1, 'CS101', 'Introduction to Programming', 'Learn the basics of programming using Python.'),
(2, 'MATH101', 'Calculus I', 'An introduction to differential calculus.'),
(3, 'ENG101', 'Introduction to Engineering', 'An overview of basic engineering principles.'),
(1, 'CS202', 'Data Structures', 'Study data structures like arrays, stacks, queues, and graphs.'),
(2, 'MATH102', 'Linear Algebra', 'Introduction to matrix operations and linear transformations.'),
(3, 'ENG202', 'Fluid Mechanics', 'Study the behavior of fluids under different conditions.'),
(4, 'PHYS101', 'Classical Mechanics', 'Fundamentals of classical mechanics.');

-- Sample Data for terms table
INSERT INTO terms (startdate, enddate, name)
VALUES
('2025-01-10', '2025-05-20', 'Spring 2025'),
('2025-06-01', '2025-08-30', 'Summer 2025'),
('2025-09-01', '2025-12-15', 'Fall 2025');

-- Sample Data for sections table
INSERT INTO sections (course_id, term_id, location, timeofday, dayofweek)
VALUES
(1, 1, 'Room 101', '09:00:00', 'Monday'),
(2, 1, 'Room 102', '10:00:00', 'Tuesday'),
(3, 2, 'Room 103', '14:00:00', 'Thursday'),
(4, 1, 'Room 104', '11:00:00', 'Wednesday'),
(5, 1, 'Room 105', '08:00:00', 'Monday'),
(6, 2, 'Room 106', '13:00:00', 'Friday'),
(7, 2, 'Room 107', '16:00:00', 'Tuesday');

-- Sample Data for enrollments table
INSERT INTO enrollments (student_id, section_id, passfail, dateregistered)
VALUES
(1, 1, TRUE, '2025-01-10 08:00:00'),
(2, 2, FALSE, '2025-01-10 08:15:00'),
(3, 3, TRUE, '2025-06-01 09:00:00'),
(4, 1, FALSE, '2025-01-10 08:30:00'),
(5, 4, TRUE, '2025-01-15 08:45:00'),
(6, 5, FALSE, '2025-01-15 09:00:00'),
(7, 6, TRUE, '2025-06-01 10:00:00'),
(8, 7, FALSE, '2025-06-01 10:15:00'),
(1, 3, TRUE, '2025-01-15 10:30:00'), -- John enrolled in two sections
(2, 4, FALSE, '2025-01-20 09:45:00'), -- Jane enrolled in two sections
(3, 5, TRUE, '2025-01-20 10:30:00'), -- Mark enrolled in two sections
(5, 6, FALSE, '2025-06-01 11:00:00'); -- Lucas enrolled in two sections

-- Some students are not enrolled in any section
-- (For example, student 7 and 8 are not enrolled in anything)

-- Sample data for section_faculty (co-teaching)
INSERT INTO section_faculty (faculty_id, section_id)
VALUES
(1, 1), -- Alice Green is teaching CS101 (section 1)
(3, 2), -- Charlie White is teaching MATH101 (section 2)
(4, 2), -- David Black is co-teaching MATH101 (section 2)
(1, 3), -- Alice Green is teaching ENG101 (section 3)
(3, 4), -- Charlie White is teaching CS202 (section 4)
(1, 5), -- Alice Green is teaching MATH102 (section 5)
(2, 6); -- Bob Brown is teaching ENG202 (section 6)

