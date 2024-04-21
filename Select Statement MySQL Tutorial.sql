SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,
last_name,
birth_date,
age,
age + 10,
(age + 10) * 10,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;
#math operation in mysql follows the PEMDAS rule
#PEMDAS = parenthesis, exponential, multiplication, divide, addition, subtraction

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;