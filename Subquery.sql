-- SUBQUERY

SELECT * FROM parks_and_recreation.employee_demographics
WHERE employee_id IN(
	SELECT employee_id
    FROM parks_and_recreation.employee_salary
    WHERE dept_id = 1
);

SELECT first_name, salary, (SELECT AVG(salary) FROM parks_and_recreation.employee_salary)
FROM parks_and_recreation.employee_salary;

SELECT first_name, salary, (SELECT ROUND(AVG(salary)) FROM parks_and_recreation.employee_salary)
FROM parks_and_recreation.employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(Age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT AVG(avg_age), AVG(max_age), AVG(min_age), AVG(count_age) FROM
(SELECT gender, AVG(age) avg_age, MAX(age) max_age, MIN(age) min_age, COUNT(Age) count_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS agg_table
GROUP BY gender;

SELECT ROUND(AVG(avg_age), 2), ROUND(AVG(max_age), 2), ROUND(AVG(min_age), 2), ROUND(AVG(count_age), 2) FROM
(SELECT gender, AVG(age) avg_age, MAX(age) max_age, MIN(age) min_age, COUNT(Age) count_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS agg_table;

