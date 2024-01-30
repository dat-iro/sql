--EX1

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    isbn VARCHAR(13) UNIQUE,
    price DECIMAL(10, 2),
    rating DECIMAL(3, 2),
    stock_count INT
);

--EX2

ALTER TABLE Books
ADD COLUMN publisher VARCHAR(255),
ADD COLUMN pages INT;

--EX3

INSERT INTO Books (title, author, genre, published_year, isbn, price, rating, stock_count, publisher, pages)
VALUES
  ('A Journey to the Center', 'Jules Verne', 'Adventure', 1864, '1234567890123', 12.99, 4.5, 10, 'Verne Publishing', 350),
  ('War and Peace', 'Leo Tolstoy', 'Historical', 1869, '1234567890124', 14.99, 4.8, 5, 'Tolstoy Prints', 1200),
  ('Whispers of the Wind', 'Amelia Blackburn', 'Romance', 1982, '1234567890125', 9.99, 4.2, 20, 'Blackburn House', 275),
  ('The Galactic Odyssey', 'Orion Starfield', 'Science Fiction', 2005, '1234567890126', 19.99, 4.9, 15, 'Nebula Press', 450);

--EX4

UPDATE Books
SET price = 12.99, stock_count = 4
WHERE title = 'War and Peace';

--EX5

GRANT SELECT, UPDATE ON YourDatabaseName.Books TO 'martin'@'localhost';

REVOKE DELETE ON YourDatabaseName.Books FROM 'martin'@'localhost';

--EX6

REVOKE UPDATE ON YourDatabaseName.Books FROM 'martin'@'localhost';

--EX7

START TRANSACTION;

DELETE FROM Books
WHERE book_id = 101;

COMMIT;

--EX8

START TRANSACTION;

DELETE FROM Books
WHERE book_id = 103;

ROLLBACK;

--EX9

--Display female passengers who survived and are older than 30.
SELECT *
FROM tested
WHERE Sex = 'female' AND Survived = 1 AND Age > 30;

--Find the average age of men who didn't survive.
SELECT AVG(Age) AS AverageAge
FROM tested
WHERE Sex = 'male' AND Survived = 0;

--Display information for passengers who spent between $20 and $50 on their tickets and got on the ship at port 'C'."
SELECT *
FROM tested
WHERE Fare BETWEEN 20 AND 50 AND Embarked = 'C';

--Find the total number of the survivors in the first class.
SELECT COUNT(*) AS TotalSurvivorsFirstClass
FROM tested
WHERE Survived = 1 AND Pclass = 1;

--Show the information of passengers who boarded from Cherbourg (port 'C') and spent more than $75 on their tickets.".
SELECT *
FROM tested
WHERE Embarked = 'C' AND Fare > 75;