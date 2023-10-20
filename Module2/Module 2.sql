-- Module 2: Table Constraints

-- NOTE: The database/table used in this Module is not provided to run queries on 
-- These were created in MySQL Workbench to simulate the course queries where applicable

-- Lesson: Identity
/*
SELECT id, firstname FROM Customers

CREATE TABLE Customers (
  id int NOT NULL AUTO_INCREMENT,
  firstname varchar(255),
  lastname varchar(255)
);

INSERT INTO Customers (firstname, lastname, city, age)
VALUES 
('demo', 'demo', 'Paris', 52),
('test', 'test', 'London', 21);

ALTER TABLE Customers
 AUTO_INCREMENT=555
*/

-- Coding Practice: Adding Data

/*
There are new employees that need to be added to the Employees table.
Here is their data:

Firstname: Wang
Lastname: Lee
Salary: 1900

Firstname: Greta
Lastname: Wu
Salary: 1200

The Employees table has an identity column called id, which is set to AUTO_INCREMENT.
Add the data to the table, then select the id, firstname, lastname and salary columns sorted by the id column in descending order.
*/

/*
INSERT INTO Employees (firstname, lastname, salary)
VALUES
('Wang', 'Lee', 1900),
('Greta', 'Wu', 1200);

SELECT id, firstname, lastname, salary
FROM Employees
ORDER BY id DESC;
*/

-- Lesson: Primary & Foregin Keys
/*
CREATE TABLE Customers (
  id int NOT NULL AUTO_INCREMENT,
firstname varchar(255),
lastname varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE PhoneNumbers (
  id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  number varchar(55),
type varchar(55),
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES Customers(id)
);
*/

-- Lesson: Unique
/*
ALTER TABLE Customers
ADD UNIQUE (lastname)

INSERT INTO Customers (firstname, lastname, city, age)
VALUES
('demo', 'Anderson', 'London', 24)
*/