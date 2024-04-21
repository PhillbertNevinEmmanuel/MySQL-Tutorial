SELECT * FROM parks_and_recreation.employee_demographics;

SELECT gender, COUNT(gender) total FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, ROUND(AVG(age), 1) average_age, MAX(age) oldest_employee, MIN(age) youngest_employee, COUNT(age) total
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation, ROUND(AVG(salary), 0) average_salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

SELECT * FROM employee_demographics
ORDER BY first_name;

SELECT * FROM employee_demographics
ORDER BY gender DESC, age;



