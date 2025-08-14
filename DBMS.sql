
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
) ENGINE=InnoDB;

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics');

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'DBMS', 1),
(102, 'Operating Systems', 1),
(103, 'AI', 1),

(201, 'Circuits', 2),
(202, 'Power Systems', 2),
(203, 'Signals', 2),

(301, 'Thermodynamics', 3),
(302, 'Fluid Mechanics', 3),
(303, 'Heat Transfer', 3),

(401, 'Structural Analysis', 4),
(402, 'Geotechnical Engg', 4),
(403, 'Transportation Engg', 4),

(501, 'Digital Electronics', 5),
(502, 'Microprocessors', 5),
(503, 'VLSI Design', 5);

SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);
