--1. List the employee number, last name, first name, sex, and salary of each employee 
SELECT sal.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal
ON sal.emp_no = emp.emp_no
ORDER BY sal.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT DISTINCT ON (dm.dept_no) dm.dept_no, de.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm
INNER JOIN departments AS de
ON dm.dept_no= de.dept_no
INNER JOIN employees AS emp 
ON dm.emp_no = emp.emp_no
ORDER BY dm.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.last_name, emp.first_name,de.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS demp
ON emp.emp_no = demp.emp_no
INNER JOIN departments AS de
ON demp.dept_no = de.dept_no
ORDER BY emp.emp_no;


-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT emp.last_name, emp.first_name
FROM employees as emp
WHERE (emp.first_name = 'Hercules') and (lower(emp.last_name) like 'b%')
ORDER BY emp.last_name;


--6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.last_name, emp.first_name,de.dept_name
FROM employees as emp
LEFT JOIN dept_emp as demp
ON emp.emp_no = demp.emp_no
INNER JOIN departments as de
ON demp.dept_no = de.dept_no
WHERE (de.dept_name) = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.last_name, emp.first_name,de.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS demp
ON emp.emp_no = demp.emp_no
INNER JOIN departments AS de
ON demp.dept_no = de.dept_no
WHERE (de.dept_name) = 'Sales' OR (de.dept_name) = 'Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC