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