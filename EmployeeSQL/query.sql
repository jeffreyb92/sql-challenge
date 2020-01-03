-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salaries.salary FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- 2.List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, date_part('year', hire_date) as hire_year FROM employees
WHERE date_part('year', hire_date) = 1986;

-- 3.List the manager of each department with the following information: department number, department name,
--   the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, d.dept_name, dept_manager.emp_no, e.last_name, e.first_name, from_date, to_date FROM dept_manager
INNER JOIN departments as d ON dept_manager.dept_no=d.dept_no
INNER JOIN employees as e ON dept_manager.emp_no=e.emp_no;

-- 4.List the department of each employee with the following information: employee number, last name,
--   first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept.dept_name FROM employees
INNER JOIN dept_emp as d ON d.emp_no = employees.emp_no
INNER JOIN departments as dept ON dept.dept_no=d.dept_no;

-- 5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, including their employee number,
--   last name, first name, and department name.
SELECT dept_emp.emp_no, last_name, first_name, dept_name FROM dept_emp
INNER JOIN employees as e ON dept_emp.emp_no = e.emp_no
INNER JOIN departments as d ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, 
--   including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, last_name, first_name, dept_name FROM dept_emp
INNER JOIN employees as e ON dept_emp.emp_no = e.emp_no
INNER JOIN departments as d ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names,
--   i.e., how many employees share each last name.
SELECT COUNT(last_name) as lnc, last_name FROM employees
GROUP BY last_name ORDER BY lnc DESC;

