

select name from sys.databases;

create database db_library;

use db_library;

select table_name from INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'base table';

select * from tbl_authors;

select * from tbl_book;

select * from tbl_borrower;

select * from tbl_branch;

select * from tbl_copies;

select * from tbl_loans;

select * from tbl_publisher;

-- Create Tables

CREATE TABLE tbl_publisher (
    publisher_name VARCHAR(50) PRIMARY KEY NOT NULL, 
    publisher_address VARCHAR(50) NOT NULL,
    publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book (
    book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_title VARCHAR(50) NOT NULL,
    book_publishername VARCHAR(50) NOT NULL CONSTRAINT fk_book_publishername FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_authors (
    authors_id INT NOT NULL CONSTRAINT fk_book_bookid FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    authors_authorname VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_borrower (
    borrower_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    borrower_name VARCHAR(50) NOT NULL,
    borrower_address VARCHAR(50) NOT NULL,
    borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_branch (
    branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    branch_name VARCHAR(50) NOT NULL,
    branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_copies (
    copies_bookid INT NOT NULL CONSTRAINT fk_copies_bookid FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    copies_branchid INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    copies_copynumber INT NOT NULL
);

CREATE TABLE tbl_loans (
    loans_id INT IDENTITY(1,1) PRIMARY KEY,
    loans_bookid INT NOT NULL CONSTRAINT fk_loans_bookid FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_branchid INT NOT NULL CONSTRAINT fk_loans_branchid FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_cardno INT NOT NULL CONSTRAINT fk_borrower_id FOREIGN KEY REFERENCES tbl_borrower(borrower_id) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_dateout VARCHAR(50) NOT NULL,
    loans_duedate VARCHAR(50) NOT NULL
);

-- Insert Data

INSERT INTO tbl_publisher (publisher_name, publisher_address, publisher_phone)
VALUES ('Random House', '123 Main St', '123-456-7890');

INSERT INTO tbl_book (book_title, book_publishername)
VALUES ('Jurassic Park', 'Random House');

SELECT * FROM tbl_book;

INSERT INTO tbl_branch (branch_name, branch_address)
VALUES ('Downtown', '123 Peach St.'), ('Riverside', '345 Side St');

SELECT * FROM tbl_branch;

-- Insert books before inserting authors that reference those books
INSERT INTO tbl_book (book_title, book_publishername)
VALUES ('It', 'Random House'), ('The Dark Tower', 'Random House'), ('Carrie', 'Random House'),
       ('The Shining', 'Random House'), ('James and the Giant Peach', 'Random House'), 
       ('Charlie and the Chocolate Factory', 'Random House'), ('The Tempest', 'Random House'), 
       ('Macbeth', 'Random House'), ('Murder on the Orient Express', 'Random House'), 
       ('Patrol', 'Random House'), ('The Return of the King', 'Random House'), 
       ('The Way of Kings', 'Random House'), ('Words of Radiance', 'Random House'), 
       ('The Silver Chair', 'Random House'), ('The Magicians Nephew', 'Random House'), 
       ('Voyage of the Dawn Treader', 'Random House'), ('The Last Battle', 'Random House'), 
       ('Harry Potter and the Deathly Hallows', 'Random House'), ('A Scanner Darkly', 'Random House'), 
       ('Do Androids Dream of Electric Sheep?', 'Random House');

-- Verify the inserted book_ids
SELECT * FROM tbl_book;

-- Correct authors_id references to existing book_id values
INSERT INTO tbl_authors (authors_id, authors_authorname)
VALUES (1, 'Stephen King'), (2, 'Roald Dahl'), (3, 'William Shakespeare'), (4, 'Agatha Christie'), 
       (5, 'Tony Hillerman'), (6, 'JRR Tolkien'), (7, 'Brandon Sanderson'), 
       (8, 'CS Lewis'), (9, 'JK Rowling'), (10, 'Philip K Dick');

SELECT * FROM tbl_authors;

INSERT INTO tbl_copies (copies_bookid, copies_branchid, copies_copynumber)
VALUES (1, 1, 2), (2, 2, 2), (3, 1, 2), (4, 2, 2), (5, 1, 2), 
       (6, 2, 2), (7, 1, 2), (8, 2, 2), (9, 1, 2), (10, 2, 2);

SELECT * FROM tbl_copies;

INSERT INTO tbl_borrower (borrower_name, borrower_address, borrower_phone)
VALUES ('John Smith', '123 Blackbird St', '234-567-8901'), ('Mary Tyler', '234 BirdBlack St', '345-678-9012'),
       ('Tonald Drump', '345 Bluebird St', '456-789-0123'), ('Pablo Escobar', '567 Troubador St', '678-901-2345'),
       ('Susan White', '789 Google St', '789-012-3456'), ('Greg Black', '890 Frog St', '890-123-4567'),
       ('Tom Brown', '901 Fly St', '901-234-5678'), ('Jerry Green', '012 5th Ave', '012-345-5678');

SELECT * FROM tbl_borrower;

-- Use the correct book_id, branch_id, and borrower_id for loans
INSERT INTO tbl_loans (loans_bookid, loans_branchid, loans_cardno, loans_dateout, loans_duedate)
VALUES (1, 1, 1, '11/25/17', '12/22/17'), (2, 1, 1, '11/25/17', '12/22/17'), (3, 1, 1, '11/25/17', '12/22/17'), 
       (4, 1, 1, '11/25/17', '12/22/17'), (5, 1, 1, '11/25/17', '12/22/17'), (6, 1, 2, '11/25/17', '12/22/17'), 
       (7, 1, 2, '11/25/17', '12/22/17'), (8, 1, 2, '11/25/17', '12/22/17'), (9, 1, 2, '11/25/17', '12/22/17'), 
       (10, 1, 2, '11/25/17', '12/22/17'), (11, 2, 3, '11/25/17', '12/22/17'), (12, 2, 4, '11/25/17', '12/22/17'), 
       (13, 2, 5, '11/25/17', '12/22/17'), (14, 2, 6, '11/25/17', '12/22/17'), (15, 2, 7, '11/25/17', '12/22/17'), 
       (16, 2, 8, '11/25/17', '12/22/17'), (17, 2, 1, '11/25/17', '12/22/17'), (18, 2, 1, '11/25/17', '12/22/17'), 
       (19, 2, 1, '11/25/17', '12/22/17'), (20, 2, 1, '11/25/17', '12/22/17'), (21, 2, 1, '11/25/17', '12/22/17'), 
       (22, 2, 1, '11/25/17', '12/22/17'), (23, 2, 1, '11/25/17', '12/22/17');

SELECT * FROM tbl_loans;


-- Insert valid data into tbl_loans
INSERT INTO tbl_loans (loans_bookid, loans_branchid, loans_cardno, loans_dateout, loans_duedate)
VALUES (1, 1, 1, '11/25/17', '12/22/17'), 
       (2, 1, 1, '11/25/17', '12/22/17'), 
       (3, 1, 1, '11/25/17', '12/22/17'), 
       (4, 1, 1, '11/25/17', '12/22/17'), 
       (5, 1, 1, '11/25/17', '12/22/17'), 
       (6, 1, 2, '11/25/17', '12/22/17'), 
       (7, 1, 2, '11/25/17', '12/22/17'), 
       (8, 1, 2, '11/25/17', '12/22/17'), 
       (9, 1, 2, '11/25/17', '12/22/17'), 
       (10, 1, 2, '11/25/17', '12/22/17'), 
       (11, 2, 3, '11/25/17', '12/22/17'), 
       (12, 2, 4, '11/25/17', '12/22/17'), 
       (13, 2, 5, '11/25/17', '12/22/17'), 
       (14, 2, 6, '11/25/17', '12/22/17'), 
       (15, 2, 7, '11/25/17', '12/22/17'), 
       (16, 2, 8, '11/25/17', '12/22/17'), 
       (17, 2, 1, '11/25/17', '12/22/17'), 
       (18, 2, 1, '11/25/17', '12/22/17'), 
       (19, 2, 1, '11/25/17', '12/22/17'), 
       (20, 2, 1, '11/25/17', '12/22/17'), 
       (21, 2, 1, '11/25/17', '12/22/17'), 
       (22, 2, 1, '11/25/17', '12/22/17'), 
       (23, 2, 1, '11/25/17', '12/22/17');



select * from tbl_book;

select * from tbl_borrower;

select * from tbl_branch;

select * from tbl_authors;

select * from tbl_copies;

select * from tbl_publisher;

select * from tbl_loans;