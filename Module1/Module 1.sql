-- Module 1: Data Manipulations

-- NOTE: The database/table used in this Module is not provided to run queries on 
-- These were created in MySQL Workbench to simulate the course queries where applicable

-- Lesson: Introduction
/*
SELECT * FROM Customers

SELECT * FROM Customers
WHERE age IS NOT NULL
ORDER BY age DESC
LIMIT 2
*/

-- Coding Practice: Top Earners

/*
You are given an Employees table, with the following columns: firstname, lastname, salary, department.
Select the data in all columns for the top 3 earners in the table. 
*/

/*
Solution:
SELECT * 
FROM Employees
ORDER BY salary DESC
LIMIT 3
*/

-- Lesson: String Functions
/*
SELECT CONCAT(firstname, lastname) AS name
FROM Customers

SELECT CONCAT(firstname, ' ', lastname) AS name
FROM Customers

SELECT LOWER(firstname) FROM Customers 
SELECT UPPER(firstname) FROM Customers 

SELECT SUBSTRING(firstname, 1, 3) 
FROM Customers

SELECT firstname, lastname, 
REPLACE(city, 'New York', 'NY') 
FROM Customers

SELECT CONCAT(
   SUBSTRING(firstname, 1, 1), 
   '. ', 
   UPPER(lastname)) AS name
FROM Customers
*/

-- Coding Practice: Email Generator

/*
You need to generate emails for the Employees.
The email format is firstname.lastname@company.com
So, for example, for John Smith the email would be: john.smith@company.com
Note, that the email should be in lowercase.
Write a query to create the email addresses for all employees in the table and output the result in a new column called "email".
*/

/*
Solution:
SELECT LOWER(CONCAT(firstname, '.', lastname, '@company.com')) AS email
FROM Employees
ORDER by email ASC
*/

-- Lesson: Math & Aggregate Functions
/*
SELECT firstname, lastname, age / 2 AS discount
FROM Customers

SELECT firstname, lastname, weight/(height*height) AS bmi
FROM Customers

SELECT MAX(age) FROM Customers;
SELECT MIN(age) FROM Customers;

SELECT AVG(age) FROM Customers

SELECT city, COUNT(*) AS ct 
FROM Customers
GROUP BY city
ORDER BY ct DESC
*/

-- Lesson: Best Scores

/*
You are working on a table that stores the game scores of multiple players.
Each player has a nickname associated with them. The table Scores has two columns, the nickname and the score.
The table can store multiple rows for each player, which correspond to scores they earned during multiple games.

You need to find the best score for each player and output the result sorted by the best score in descending order.
The output should have the nickname column, followed by the best score column called 'best'.
*/

/*
Solution:
SELECT nickname, MAX(score) AS best
FROM Scores
GROUP BY nickname
ORDER BY best DESC
*/

-- Lesson: Case
/*
SELECT firstname, lastname,
CASE
    WHEN age >= 65 THEN 'Senior' 
END AS category
FROM Customers

SELECT firstname, lastname,
CASE
  WHEN age >= 65 THEN 'Senior'
  WHEN age >= 25 AND age < 65 THEN 'Adult'
END AS category
FROM Customers

SELECT firstname, lastname,
CASE
  WHEN age >= 65 THEN 'Senior'
  WHEN age >= 25 AND age < 65 THEN 'Adult'
  ELSE 'Youth'
END AS category
FROM Customers
*/

-- Lesson: Taxes

/*

You are working on the Employees table, which stores the names and salaries of employees.
You need to calculate the taxes for the salaries and output them as a new column.
The tax percentage is based on the salary amount:

0 - 1500:       10%
1501 - 2000: 20%
2001+:          30%

Output the firstname, lastname, salary and tax columns of the table, sorted by the lastname column in ascending order.
*/

/*
Solution:
SELECT firstname, lastname, salary,
CASE
    WHEN salary >= 0 AND salary <= 1500 THEN salary*0.1
    WHEN salary >= 1501 AND salary <= 2000 THEN salary*0.2
    ELSE salary*0.3
END AS tax from Employees
ORDER BY lastname ASC
*/