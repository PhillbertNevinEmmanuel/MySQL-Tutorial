-- Having vs Where

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
-- WHERE AVG(age) > 40
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 70000
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%director%'
GROUP BY occupation
HAVING AVG(salary) > 65000
;
