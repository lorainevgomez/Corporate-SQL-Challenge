--DATA ANALYSIS QUERY



--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
--WHERE clause, between is between a certain range. Can use to find 1986 year
SELECT  employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept.dept_no, dept.dept_name, dept_mg.emp_no, emp.last_name, emp.first_name
FROM departments AS dept
JOIN dept_manager AS dept_mg
ON (dept.dept_no = dept_mg.dept_no)
JOIN employees AS emp
ON (dept_mg.emp_no = emp.emp_no);


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON (dept_emp.emp_no = employees.emp_no)
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON
dept_emp.emp_no = employees.emp_no
JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS "Count_of_frequency"
FROM employees
GROUP BY last_name
--ALWAYS do order last 
ORDER BY 
COUNT(last_name) DESC;