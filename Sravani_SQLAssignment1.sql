CREATE DATABASE employee_assignment;
SHOW DATABASES;
USE employee_assignment;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50) NOT NULL,
    job_role VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Unknown'
);
INSERT INTO employees
(emp_id, emp_name, email, department, job_role, salary, age, city)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'IT', 'Software Engineer', 65000, 25, 'Hyderabad'),

(2, 'Priya Reddy', 'priya@gmail.com', 'HR', 'HR Executive', 45000, 28, 'Vijayawada'),

(3, 'Arjun Kumar', 'arjun@gmail.com', 'Finance', 'Financial Analyst', 55000, 30, 'Chennai'),

(4, 'Sneha Rao', 'sneha@gmail.com', 'IT', 'Data Analyst', 60000, 26, 'Hyderabad'),

(5, 'Kiran Patel', 'kiran@gmail.com', 'Sales', 'Sales Executive', 40000, 24, 'Bangalore'),

(6, 'Anjali Singh', 'anjali@gmail.com', 'IT', 'Software Engineer', 65000, 27, 'Chennai'),

(7, 'Vikram Reddy', 'vikram@gmail.com', 'Finance', 'Accountant', 50000, 32, 'Hyderabad'),

(8, 'Meena Devi', 'meena@gmail.com', 'HR', 'Recruiter', 45000, 29, 'Bangalore'),

(9, 'Rohit Verma', 'rohit@gmail.com', 'Sales', 'Sales Manager', 70000, 35, 'Vijayawada'),

(10, 'Kavya Rao', 'kavya@gmail.com', 'IT', 'Web Developer', 58000, 23, 'Chennai'),

(11, 'Suresh Babu', 'suresh@gmail.com', 'Finance', 'Finance Manager', 75000, 40, 'Hyderabad'),

(12, 'Divya Sharma', 'divya@gmail.com', 'HR', 'HR Manager', 70000, 38, 'Bangalore'),

(13, 'Manoj Kumar', 'manoj@gmail.com', 'Sales', 'Marketing Executive', 50000, 27, 'Chennai'),

(14, 'Pooja Singh', 'pooja@gmail.com', 'IT', 'Database Administrator', 72000, 31, 'Hyderabad'),

(15, 'Ajay Rao', 'ajay@gmail.com', 'Finance', 'Financial Analyst', 55000, 29, 'Vijayawada'),

(16, 'Lakshmi Devi', 'lakshmi@gmail.com', 'Sales', 'Sales Executive', 40000, 25, 'Bangalore'),

(17, 'Naveen Reddy', 'naveen@gmail.com', 'IT', 'System Administrator', 60000, 34, NULL),

(18, 'Swathi Kumar', 'swathi@gmail.com', 'HR', 'HR Executive', 45000, 26, 'Vijayawada'),

(19, 'Ramesh Verma', 'ramesh@gmail.com', 'Sales', 'Sales Manager', 70000, 36, 'Hyderabad'),

(20, 'Harini Rao', 'harini@gmail.com', 'Finance', 'Accountant', 50000, 28, 'Chennai');
SELECT * FROM employees;
SELECT emp_name, department, salary, city FROM employees;
SELECT emp_name, job_role FROM employees;
SELECT emp_name, salary FROM employees;
SELECT *
FROM employees
WHERE salary = 65000;
SELECT *
FROM employees
WHERE salary > 60000;
SELECT *
FROM employees
WHERE age < 30;
SELECT *
FROM employees
WHERE salary >= 70000;
SELECT *
FROM employees
WHERE age <= 25;
SELECT *
FROM employees
WHERE department <> 'IT';
SELECT *
FROM employees
WHERE department != 'HR';
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;
SELECT *
FROM employees
WHERE NOT department = 'IT';
SELECT *
FROM employees
WHERE age BETWEEN 25 AND 30;
SELECT *
FROM employees
WHERE department IN ('IT', 'HR', 'Finance');
SELECT *
FROM employees
WHERE department NOT IN ('IT', 'HR');
SELECT *
FROM employees
WHERE emp_name LIKE 'R%';
SELECT *
FROM employees
WHERE emp_name LIKE '%a';
SELECT *
FROM employees
WHERE city IS NULL;
SELECT *
FROM employees
WHERE city IS NOT NULL;
SELECT *
FROM employees
ORDER BY salary ASC;
SELECT *
FROM employees
ORDER BY salary DESC;
SELECT *
FROM employees
ORDER BY age ASC;
SELECT *
FROM employees
ORDER BY department ASC;
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;
SELECT COUNT(*) AS total_employees
FROM employees;
SELECT SUM(salary) AS total_salary
FROM employees;
SELECT AVG(salary) AS average_salary
FROM employees;
SELECT MIN(salary) AS minimum_salary
FROM employees;
SELECT MAX(salary) AS maximum_salary
FROM employees;
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
SELECT department, MIN(salary) AS minimum_salary
FROM employees
GROUP BY department;
SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department;
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;
SELECT city, MAX(salary) AS maximum_salary
FROM employees
GROUP BY city;
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 4;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 4;
SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;


SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;
SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
SELECT department, MAX(salary) AS second_highest_salary
FROM employees e
WHERE salary < (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
)
GROUP BY department;
SELECT city, COUNT(*) AS employee_count
FROM employees
WHERE city IS NOT NULL
GROUP BY city
HAVING COUNT(*) = (
    SELECT MAX(city_count)
    FROM (
        SELECT COUNT(*) AS city_count
        FROM employees
        WHERE city IS NOT NULL
        GROUP BY city
    ) AS city_counts
);
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 250000;