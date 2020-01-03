-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salaries.salary FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no

-- 2.List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, date_part('year', hire_date) as hire_year FROM employees
WHERE date_part('year', hire_date) = 1986;

-- 3.List the manager of each department with the following information: department number, department name,
--   the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, d.dept_name, dept_manager.emp_no, e.last_name, e.first_name, from_date, to_date FROM dept_manager
INNER JOIN departments as d ON dept_manager.dept_no=d.dept_no
INNER JOIN employees as e ON dept_manager.emp_no=e.emp_no

