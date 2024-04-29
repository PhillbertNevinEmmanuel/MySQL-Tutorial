-- CASE

SELECT CONCAT(first_name, ' ', last_name) full_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 51 THEN "On death's door"
END age_bracket
FROM parks_and_recreation.employee_demographics;

-- USE CASE
-- Pay increase and bonus
-- salary <= 50000 = 5% Bonus
-- salary > 50000 = 7% Bonus
-- Finance Dept = 10% Bonus

SELECT * FROM parks_and_recreation.employee_salary emp_sal
JOIN parks_and_recreation.parks_departments park_dept
ON emp_sal.dept_id = park_dept.department_id;

SELECT CONCAT(first_name, ' ', last_name) full_name, occupation, salary,
CASE
	WHEN dept_id = 6 THEN ROUND(salary + (salary * .1), 0)
    WHEN salary > 50000 THEN ROUND(salary + (salary * 0.07), 0)
    WHEN salary <= 50000 THEN ROUND(salary + (salary * 0.05), 0)
    ELSE salary
END salary_after_bonus
FROM parks_and_recreation.employee_salary;

SELECT emp_sal.employee_id, CONCAT(emp_sal.first_name, ' ', emp_sal.last_name) AS full_name, emp_sal.occupation, emp_sal.salary, dept.department_name,
CASE
	WHEN dept.department_id = 6 THEN ROUND(emp_sal.salary + (emp_sal.salary * 0.1), 0)
    WHEN emp_sal.salary > 50000 THEN ROUND(emp_sal.salary + (emp_sal.salary * 0.07), 0)
	WHEN emp_sal.salary <= 50000 THEN ROUND(emp_sal.salary + (emp_sal.salary * 0.05), 0)
	ELSE emp_sal.salary
END salary_after_bonus
FROM parks_and_recreation.employee_salary emp_sal
JOIN parks_and_recreation.parks_departments dept
ON emp_sal.dept_id = dept.department_id;
