-- COMMON TABLE EXPRESSION (CTE)

WITH CTE_example (gender, avg_salary, max_salary, min_salary, count_salary) AS(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM parks_and_recreation.employee_demographics emp_demo
JOIN parks_and_recreation.employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_salary) FROM CTE_example;

-- joining tables within CTEs
WITH CTE_example (id, gender, birthdate) AS(
SELECT employee_id, gender, birth_date
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_example2 (id, wages) AS(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_example
INNER JOIN CTE_example2
ON CTE_example.id = CTE_example2.id;