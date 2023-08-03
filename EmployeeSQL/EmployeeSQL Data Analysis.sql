----employee number, last name, first name, sex, salary
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

----first name, last name, hire date for employees hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31';

-----manger of department, department number, department name
--employee number, lastname, firstname
SELECT dept_manager.emp_no,
	dept_manager.dept_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-----department number, employee number, department name
--lastname, firstname, department name
SELECT dept_emp.dept_no,
	dept_emp.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name	
FROM dept_emp
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no;

-----List first name, last name, sex of employees with first
--name Hercules and last name starts with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-----List each employee in the sales dept, employee number
---last name and first name
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007';

---List frequency counts, descending of all employee last names
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;

-----List each employee in the sales and development dept, 
---employee number, last name and first name and department name
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007' OR dept_emp.dept_no ='d005';