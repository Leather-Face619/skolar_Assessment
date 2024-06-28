-- Problem 1: Create and Insert
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    age INT
);

INSERT INTO students (student_id, first_name, last_name, department, age) VALUES
(1, 'John', 'Doe', 'Computer Science', 20),
(2, 'Jane', 'Smith', 'Mathematics', 22),
(3, 'Emily', 'Jones', 'Physics', 19),
(4, 'Michael', 'Brown', 'Mechanical', 21),
(5, 'Sarah', 'Davis', 'Computer Science', 23);


-- Problem 2: Select and Where
SELECT * FROM students WHERE department = 'Computer Science';

-- Problem 3: Inner Join
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

SELECT students.student_id, students.first_name, students.last_name, departments.dept_name
FROM students
INNER JOIN departments ON students.department = departments.dept_name;

-- Problem 4: Left Join
SELECT departments.dept_name, students.first_name, students.last_name
FROM departments
LEFT JOIN students ON departments.dept_name = students.department;

-- Problem 5: Aggregation

SELECT department, AVG(age) AS average_age
FROM students
GROUP BY department;

-- Problem 6: Group By and Having

SELECT department, AVG(age) AS average_age
FROM students
GROUP BY department
HAVING AVG(age) > 20;

-- Problem 7: Subquery

SELECT * FROM students
WHERE age > (SELECT AVG(age) FROM students);

-- Problem 8: Update

UPDATE students
SET age = age + 1
WHERE department = 'Mechanical';

-- Problem 9: Delete

DELETE FROM students WHERE age < 18;

-- Problem 10: Create View
CREATE VIEW senior_students AS
SELECT * FROM students WHERE age > 21;
