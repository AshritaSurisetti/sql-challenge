
--List the employee number, last name, first name, sex, and salary of each employee 
SELECT 
employees.emp_no,
employees.last_name, 
employees.first_name, 
employees.sex,
(
SELECT salary
FROM salaries
WHERE salaries.emp_no = employees.emp_no)

FROM employees;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name.
SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    (
        SELECT last_name FROM employees WHERE emp_no = dm.emp_no
    ) AS last_name,
    (
        SELECT first_name FROM employees WHERE emp_no = dm.emp_no
    ) AS first_name
FROM 
    dept_manager dm
JOIN 
    departments d ON dm.dept_no = d.dept_no;

--List the department number for each employee 
--along with that employee’s employee number, last name, first name, and department name
SELECT
d.dept_no,
d.dept_name,
e.emp_no,
e.first_name,
e.last_name

FROM
departments d
JOIN
dept_emp de ON d.dept_no = de.dept_no
JOIN
employees e ON de.emp_no = e.emp_no;
--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';
--list each employee in the Sales department, including their employee number, last name, and first name
SELECT emp_no,first_name,last_name
FROM employees e
WHERE emp_no IN
(
SELECT emp_no
FROM dept_emp de
WHERE dept_no IN
(
SELECT dept_no
FROM departments d
WHERE dept_name = 'Sales'
));

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT
e.emp_no,
e.first_name,
e.last_name,
d.dept_name
FROM
departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' AND d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names 
SELECT COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;