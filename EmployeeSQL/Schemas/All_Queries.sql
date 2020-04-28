-- Data Analysis: Question #1- First Method
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no;

-- Data Analysis: Question #1- Second Method (Takes a long time)
SELECT emp_no, last_name, first_name, gender,
	(SELECT salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no)
FROM employees
LIMIT 10;


-- Data Analysis: Question #2
SELECT * 
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';


-- Data Analysis: Question #3- First Method
SELECT dept_no, emp_no, from_date, to_date, 
	(SELECT last_name
	 FROM employees
	 WHERE employees.emp_no = dept_manager.emp_no) AS "Last Name",
	(SELECT first_name
	 FROM employees
	 WHERE employees.emp_no = dept_manager.emp_no) AS "First Name",
	 (SELECT dept_name
	 FROM departments
	 WHERE departments.dept_no = dept_manager.dept_no) AS "Department Name"
 FROM dept_manager;
 
 -- Data Analysis: Question #3- Second Method
 SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
 FROM departments AS d
 JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
 JOIN employees AS e ON e.emp_no = dm.emp_no;
  
  
-- Data Analysis: Question #4
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no =d.dept_no;


-- Data Analysis: Question #5
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- Data Analysis: Question #6 BY Using VIEW
SELECT * 
FROM employees_departments
WHERE dept_name = 'Sales';


-- Data Analysis: Question #7 BY Using VIEW
SELECT * 
FROM employees_departments
WHERE dept_name IN ('Sales', 'Development');


-- Data Analysis: Question #8
SELECT last_name, COUNT(last_name) AS "Number of Last Names"
FROM employees
GROUP BY last_name
ORDER by "Number of Last Names" DESC;



