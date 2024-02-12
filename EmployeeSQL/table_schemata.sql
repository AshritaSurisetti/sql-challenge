--creating titles table
CREATE TABLE titles(
	title_id varchar(5) PRIMARY KEY NOT NULL,
	title VARCHAR(50)
);
-- modify the column header to create the foreign key in the next table
ALTER TABLE titles
RENAME COLUMN title_id to emp_title_id

--creating employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id)
);

--creating departments table
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(40)
);
--creating dept_emp table and creating the composite key
CREATE TABLE dept_emp(
 	emp_no INT,
	dept_no VARCHAR(5),
	PRIMARY KEY(emp_no, dept_no) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);
--creating dept_manager table and creating a composite key
CREATE TABLE dept_manager(
 	dept_no VARCHAR(5),
	emp_no INT,
	PRIMARY KEY(dept_no, emp_no) NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--creating salaries table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT
);
--importing data to employees table by setting the date style.
SET datestyle = 'SQL, MDY';

COPY public.employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM 'C:/Users/ashri/OneDrive/Desktop/BOOTCA~2/SQL-CH~1/EMPLOY~1/data/EMPLOY~1.CSV' 
DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

