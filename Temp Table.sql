-- Temporary Tables

-- 1st Case
CREATE TEMPORARY TABLE temp_table(
first_name VARCHAR(50),
last_name VARCHAR(50),
favorite_movie VARCHAR(100)
);

INSERT INTO temp_table VALUES
('Alex', 'Freberg', 'Lord of The Rings: The Two Towers'),
('Phillbert', 'Emmanuel', "Kingdom of Heaven (Director's Cut)")
;

SELECT * FROM temp_table;

-- 2nd Case
CREATE TEMPORARY TABLE salary_over_75k(
SELECT *
FROM employee_salary
WHERE salary >= 75000
);

SELECT * FROM salary_over_75k;

SELECT *
FROM employee_salary;