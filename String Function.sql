-- STRING FUNCTION

SELECT LENGTH('Skyfall');

SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

SELECT UPPER('Skyfall');
SELECT LOWER('SKyfall');

SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT TRIM('          Skyfall             ');
SELECT LTRIM('          Skyfall             ');
SELECT RTRIM('          Skyfall             ');

SELECT first_name, LEFT(first_name, 4), RIGHT(first_name, 3), SUBSTRING(first_name, 4, 2),
birth_date, SUBSTRING(birth_date, 6, 2) birth_month
FROM parks_and_recreation.employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM parks_and_recreation.employee_demographics;

SELECT first_name, LOCATE('A', first_name), LOCATE('E', first_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) full_name
FROM parks_and_recreation.employee_demographics;