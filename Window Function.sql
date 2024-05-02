-- WINDOW FUNCTION

-- USE CASE
 SELECT gender, AVG(salary) avg_salary
 FROM employee_demographics emp_demo
 JOIN employee_salary emp_sal
 ON emp_demo.employee_id = emp_sal.employee_id
 GROUP BY gender;
 
-- we can alter this using over

SELECT gender, AVG(salary) OVER()
FROM employee_demographics emp_dem
JOIN employee_salary emp_sal
	ON emp_dem.employee_id = emp_sal.employee_id;
    
-- use partition by
SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics emp_dem
JOIN employee_salary emp_sal
	ON emp_dem.employee_id = emp_sal.employee_id;
    
-- over(partition by) is useful when dealing with cases like when you're querying multiple string column
-- that you have to group by and you have to aggregate integer columns
-- for comparison let's say you have this query:
SELECT emp_demo.first_name, emp_demo.last_name, gender, AVG(salary) avg_salary
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id
GROUP BY emp_demo.first_name, emp_demo.last_name, gender;

-- you could notice the big difference when we're using window function for the same exact purpose
SELECT emp_demo.first_name, emp_demo.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

-- window functions can really come in handy
-- now let's see other case and another function
-- it's called rolling total
SELECT emp_demo.first_name, emp_demo.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY emp_demo.employee_id) rolling_total
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

-- row number
SELECT emp_demo.employee_id, emp_demo.first_name, emp_demo.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

-- row number with partition by over gender
SELECT emp_demo.employee_id, emp_demo.first_name, emp_demo.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

-- let's sort it by total salary in descending order
SELECT emp_demo.employee_id, emp_demo.first_name, emp_demo.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) rank_salary
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

-- rank and dense rank
SELECT emp_demo.employee_id, emp_demo.first_name, emp_demo.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num_salary,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num_salary,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num_salary
FROM employee_demographics emp_demo
JOIN employee_salary emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;