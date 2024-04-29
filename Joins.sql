-- JOINS

SELECT * FROM parks_and_recreation.employee_demographics;
SELECT * FROM parks_and_recreation.employee_salary;

SELECT * FROM parks_and_recreation.employee_demographics ed
JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;

SELECT * FROM parks_and_recreation.employee_demographics ed
LEFT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;

SELECT * FROM parks_and_recreation.employee_demographics ed
RIGHT JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id;

-- SELF JOIN

SELECT * FROM parks_and_recreation.employee_salary es1
JOIN parks_and_recreation.employee_salary es2
ON es1.employee_id + 1 = es2.employee_id;

SELECT * FROM parks_and_recreation.employee_salary es1
JOIN parks_and_recreation.employee_salary es2
ON es1.employee_id = es2.employee_id + 1;

-- MULTIPLE JOINS

SELECT * FROM parks_and_recreation.employee_demographics ed
JOIN parks_and_recreation.employee_salary es
ON ed.employee_id = es.employee_id
JOIN parks_and_recreation.parks_departments pd
ON es.dept_id = pd.department_id;

SELECT ed.employee_id, ed.first_name, ed.last_name, es.occupation, es.salary,
pd.department_id, pd.department_name
FROM parks_and_recreation.employee_demographics ed
JOIN parks_and_recreation.employee_salary es
	ON ed.employee_id = es.employee_id
JOIN parks_and_recreation.parks_departments pd
	ON es.dept_id = pd.department_id;