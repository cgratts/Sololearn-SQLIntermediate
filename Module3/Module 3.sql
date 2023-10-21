-- Module 3: Working with Data

-- NOTE: The database/table used in this Module is not provided to run queries on 
-- These were created in MySQL Workbench to simulate the course queries where applicable

-- Lesson: Multiple Tables
/*
SELECT firstname, lastname, city, number, type 
FROM Customers, PhoneNumbers
WHERE Customers.id = PhoneNumbers.customer_id

SELECT Customers.firstname, Customers.lastname, Customers.city, PhoneNumbers.number, PhoneNumbers.type 
FROM Customers, PhoneNumbers
WHERE Customers.id = PhoneNumbers.customer_id
*/

-- Coding Practice: Book Authors

/*
You are working with a library database that stores data on books.
The Books table has the columns id, name, year, author_id.
The author_id column connects to the Authors table, which stores the id, name columns for the book authors.

You need to select all the books with their authors, ordered by the author name alphabetically, then by the year in ascending order.
The result set should contain only 3 columns: the book name, year and its author (name the column author). 
*/

/*
Solution:
SELECT Books.name, Books.year, Authors.name AS author
FROM Books, Authors
WHERE Books.author_id = Authors.id
ORDER BY author ASC, year ASC
*/

-- Lesson: Joins
/*
SELECT firstname, lastname, city, number, type
FROM Customers JOIN PhoneNumbers
ON Customers.id = PhoneNumbers.customer_id

SELECT C.firstname, C.lastname, C.city, PN.number, PN.type
FROM Customers AS C JOIN PhoneNumbers AS PN
ON C.id = PN.customer_id

SELECT C.firstname, C.lastname, C.city, PN.number, PN.type
FROM PhoneNumbers AS PN RIGHT JOIN Customers AS C
ON C.id = PN.customer_id
ORDER BY C.id
*/

-- Coding Practice: Number of Books

/*

You are working on the library database, which contains the Books and Authors tables.
Columns of the Books table: id, name, year, author_id.
Columns of the Authors table: id, name.

 

Write a query to get the author names and the number of books they have in the Books table.
Note that some authors do not have any books associated with them. In this case, the result needs to include their names and have 0 as the count. The count column should be called books in the result.
*/

/*
Solution:
SELECT A.name, count(B.id) as books
FROM Authors A
LEFT JOIN Books B ON A.id = B.author_id GROUP BY A.name
ORDER By count(B.id) DESC

Output:
name,books
F. Scott Fitzgerald,3
Jane Austen,3
William Shakespeare,2
Miguel de Cervantes,1
Herman Melville,1
Stephen King,0
Mark Twain,0
*/

-- Lesson: Union
/*
SELECT firstname, lastname, age FROM Customers
UNION
SELECT firstname, lastname, age FROM Contacts

SELECT firstname, lastname, age FROM Customers
UNION ALL
SELECT firstname, lastname, age FROM Contacts

SELECT firstname, lastname, age, city FROM Customers
UNION
SELECT firstname, lastname, age, NULL FROM Contacts

SELECT firstname, lastname, age FROM Customers
WHERE age > 30
UNION
SELECT firstname, lastname, age FROM Contacts
WHERE age < 25
*/

-- Coding Practice: New Arrivals

/*
You are working with the library books database.
The Books table has the columns id, name, year.
The library has new books whose information is stored in another table called "New", however they do not have a year column.

Write a query to select the books from both tables, Books and New, combining their data. For the year column of the New books use the value 2022.
Also, select only the books that are released after the year 1900. 
The result set should contain the name and year columns only, ordered by the name column alphabetically.
*/

/*
Solution:
SELECT name, year FROM Books
WHERE year > 1900
UNION
SELECT name, 2022 AS year FROM New
ORDER BY name ASC 

Output:
name,year
Lessons in Chemistry,2022
Sea of Tranquility,2022
Tender Is the Night,1934
The Great Gatsby,1925
This Side of Paradise,1920
To Paradise,2022
*/

-- Lesson: Find the Average
/*
SELECT * FROM Customers;
SELECT * FROM PhoneNumbers;

SELECT C.id, C.firstname, C.lastname, PN.number, PN.type 
FROM Customers AS C LEFT JOIN PhoneNumbers AS PN 
ON C.id = PN.customer_id
ORDER BY C.id

SELECT C.id, COUNT(PN.number) AS count
FROM Customers AS C LEFT JOIN PhoneNumbers AS PN
ON C.id = PN.customer_id
GROUP BY C.id

SELECT AVG(count) FROM 
(SELECT C.id, COUNT(PN.number) AS count
FROM Customers AS C LEFT JOIN PhoneNumbers AS PN
ON C.id = PN.customer_id
GROUP BY C.id) AS Numbers
*/