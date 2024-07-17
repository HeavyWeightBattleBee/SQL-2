DELIMITER $$

CREATE PROCEDURE LibraryManagementSystemProcedure()
BEGIN
    CREATE DATABASE IF NOT EXISTS db_LibraryManagement;
    USE db_LibraryManagement;

    /*                     TABLES 

    CREATE TABLE IF NOT EXISTS tbl_publisher (
        publisher_PublisherName VARCHAR(100) PRIMARY KEY,
        publisher_PublisherAddress VARCHAR(200) NOT NULL,
        publisher_PublisherPhone VARCHAR(50) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_book (
        book_BookID INT PRIMARY KEY AUTO_INCREMENT,
        book_Title VARCHAR(100) NOT NULL,
        book_PublisherName VARCHAR(100) NOT NULL,
        CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_library_branch (
        library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
        library_branch_BranchName VARCHAR(100) NOT NULL,
        library_branch_BranchAddress VARCHAR(200) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_borrower (
        borrower_CardNo INT PRIMARY KEY AUTO_INCREMENT,
        borrower_BorrowerName VARCHAR(100) NOT NULL,
        borrower_BorrowerAddress VARCHAR(200) NOT NULL,
        borrower_BorrowerPhone VARCHAR(50) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tbl_book_loans (
        book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
        book_loans_BookID INT NOT NULL,
        book_loans_BranchID INT NOT NULL,
        book_loans_CardNo INT NOT NULL,
        book_loans_DateOut DATE NOT NULL,
        book_loans_DueDate DATE NOT NULL,
        CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_book_copies (
        book_copies_CopiesID INT PRIMARY KEY AUTO_INCREMENT,
        book_copies_BookID INT NOT NULL,
        book_copies_BranchID INT NOT NULL,
        book_copies_No_Of_Copies INT NOT NULL,
        CONSTRAINT fk_book_id2 FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_branch_id2 FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS tbl_book_authors (
        book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT,
        book_authors_BookID INT NOT NULL,
        book_authors_AuthorName VARCHAR(50) NOT NULL,
        CONSTRAINT fk_book_id3 FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
    );


    
    INSERT INTO tbl_publisher (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
    VALUES
        ('DAW Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
        ('Viking', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
        ('Signet Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
        ('Chilton Books', 'Not Available', 'Not Available'),
        ('George Allen & Unwin', '83 Alexander Ln, Crows Nest NSW 2065, Australia', '+61-2-8425-0100'),
        ('Alfred A. Knopf', 'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019', '212-940-7390'),
        ('Bloomsbury', 'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', '212-419-5300'),
        ('Shinchosa', 'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan', '+81-3-5577-6507'),
        ('Harper and Row', 'HarperCollins Publishers, 195 Broadway, New York, NY 10007', '212-207-7000'),
        ('Pan Books', '175 Fifth Avenue, New York, NY 10010', '646-307-5745'),
        ('Chalto & Windus', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
        ('Harcourt Brace Jovanovich', '3 Park Ave, New York, NY 10016', '212-420-5800'),
        ('W.W. Norton', 'W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110', '212-354-5500'),
        ('Scholastic', '557 Broadway, New York, NY 10012', '800-724-6527'),
        ('Bantam', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
        ('Picador USA', '175 Fifth Avenue, New York, NY 10010', '646-307-5745');

    INSERT INTO tbl_book (book_Title, book_PublisherName)
    VALUES 
        ('The Name of the Wind', 'DAW Books'),
        ('It', 'Viking'),
        ('The Green Mile', 'Signet Books'),
        ('Dune', 'Chilton Books'),
        ('The Hobbit', 'George Allen & Unwin'),
        ('Eragon', 'Alfred A. Knopf'),
        ('A Wise Mans Fear', 'DAW Books'),
        ('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
        ('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
        ('The Giving Tree', 'Harper and Row'),
        ('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
        ('Brave New World', 'Chalto & Windus'),
        ('The Princess Bride', 'Harcourt Brace Jovanovich'),
        ('Fight Club', 'W.W. Norton'),
        ('Holes', 'Scholastic'),
        ('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
        ('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
        ('The Fellowship of the Ring', 'George Allen & Unwin'),
        ('A Game of Thrones', 'Bantam'),
        ('The Lost Tribe', 'Picador USA');

    INSERT INTO tbl_library_branch (library_branch_BranchName, library_branch_BranchAddress)
    VALUES
        ('Sharpstown', '32 Corner Road, New York, NY 10012'),
        ('Central', '491 3rd Street, New York, NY 10014'),
        ('Saline', '40 State Street, Saline, MI 48176'),
        ('Ann Arbor', '101 South University, Ann Arbor, MI 48104');

    INSERT INTO tbl_borrower (borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
    VALUES
        ('Joe Smith', '1321 4th Street, New York, NY 10014', '212-312-1234'),
        ('Jane Smith', '1321 4th Street, New York, NY 10014', '212-931-4124'),
        ('Tom Li', '981 Main Street, Ann Arbor, MI 48104', '734-902-7455'),
        ('Angela Thompson', '2212 Green Avenue, Ann Arbor, MI 48104', '313-591-2122'),
        ('Harry Emnace', '121 Park Drive, Ann Arbor, MI 48104', '412-512-5522'),
        ('Tom Haverford', '23 75th Street, New York, NY 10014', '212-631-3418'),
        ('Haley Jackson', '231 52nd Avenue New York, NY 10014', '212-419-9935'),
        ('Michael Horford', '653 Glen Avenue, Ann Arbor, MI 48104', '734-998-1513');

    INSERT INTO tbl_book_loans (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
    VALUES
        (1, 1, 100, '2018-01-01', '2018-02-02'),
        (2, 1, 100, '2018-01-01', '2018-02-02'),
        (3, 1, 100, '2018-01-01', '2018-02-02'),
        (4, 1, 100, '2018-01-01', '2018-02-02'),
        (5, 1, 102, '2018-01-01', '2018-02-02')
        (6, 1, 102, '2018-01-01', '2018-02-02')
		(7, 1, 102, '2018-01-01', '2018-02-02'),
        (8, 1, 102, '2018-01-01', '2018-02-02'),
        (9, 1, 104, '2018-01-01', '2018-02-02'),
        (10, 1, 104, '2018-01-01', '2018-02-02'),
        (11, 1, 104, '2018-01-01', '2018-02-02'),
        (12, 2, 100, '2018-01-01', '2018-02-02'),
        (13, 2, 100, '2018-01-01', '2018-02-02'),
        (14, 2, 102, '2018-01-01', '2018-02-02'),
        (15, 2, 102, '2018-01-01', '2018-02-02'),
        (16, 3, 100, '2018-01-01', '2018-02-02'),
        (17, 3, 102, '2018-01-01', '2018-02-02'),
        (18, 4, 104, '2018-01-01', '2018-02-02');

    INSERT INTO tbl_book_copies (book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
    VALUES
        (1, 1, 5),
        (2, 1, 3),
        (3, 1, 7),
        (4, 1, 2),
        (5, 1, 4),
        (6, 1, 6),
        (7, 1, 3),
        (8, 1, 8),
        (9, 1, 5),
        (10, 1, 2),
        (11, 2, 4),
        (12, 2, 6),
        (13, 2, 3),
        (14, 2, 7),
        (15, 2, 5),
        (16, 3, 6),
        (17, 3, 2),
        (18, 4, 4);

    INSERT INTO tbl_book_authors (book_authors_BookID, book_authors_AuthorName)
    VALUES
        (1, 'Patrick Rothfuss'),
        (2, 'Stephen King'),
        (3, 'Stephen King'),
        (4, 'Frank Herbert'),
        (5, 'J.R.R. Tolkien'),
        (6, 'Christopher Paolini'),
        (7, 'Patrick Rothfuss'),
        (8, 'J.K. Rowling'),
        (9, 'Haruki Murakami'),
        (10, 'Shel Silverstein'),
        (11, 'Douglas Adams'),
        (12, 'Aldous Huxley'),
        (13, 'William Goldman'),
        (14, 'Chuck Palahniuk'),
        (15, 'Louis Sachar'),
        (16, 'J.K. Rowling'),
        (17, 'J.K. Rowling'),
        (18, 'J.R.R. Tolkien'),
        (19, 'George R.R. Martin'),
        (20, 'Peter Lerangis');


-- questions 
/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

SELECT bc.book_copies_No_Of_Copies
FROM tbl_book_copies bc
JOIN tbl_book b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe'
AND lb.library_branch_BranchName = 'Sharpstown';



/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

SELECT lb.library_branch_BranchName, bc.book_copies_No_Of_Copies
FROM tbl_book_copies bc
JOIN tbl_book b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe';



/* #3- Retrieve the names of all borrowers who do not have any books checked out. */
		
SELECT b.borrower_BorrowerName
FROM tbl_borrower b
LEFT JOIN tbl_book_loans bl ON b.borrower_CardNo = bl.book_loans_CardNo
WHERE bl.book_loans_CardNo IS NULL;

/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */

SELECT 
    b.book_Title,
    br.borrower_BorrowerName,
    br.borrower_BorrowerAddress
FROM 
    tbl_book_loans bl
JOIN 
    tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN 
    tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN 
    tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE 
    lb.library_branch_BranchName = 'Sharpstown'
    AND bl.book_loans_DueDate = CONVERT(VARCHAR(10), GETDATE(), 101);  

/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

SELECT 
    lb.library_branch_BranchName,
    COUNT(bl.book_loans_LoansID) AS TotalBooksLoanedOut
FROM 
    tbl_library_branch lb
JOIN 
    tbl_book_loans bl ON lb.library_branch_BranchID = bl.book_loans_BranchID
GROUP BY 
    lb.library_branch_BranchName;


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

SELECT 
    br.borrower_BorrowerName,
    br.borrower_BorrowerAddress,
    COUNT(bl.book_loans_LoansID) AS NumberOfBooksCheckedOut
FROM 
    tbl_borrower br
JOIN 
    tbl_book_loans bl ON br.borrower_CardNo = bl.book_loans_CardNo
GROUP BY 
    br.borrower_BorrowerName,
    br.borrower_BorrowerAddress
HAVING 
    COUNT(bl.book_loans_LoansID) > 5;



/* #7- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

SELECT 
    b.book_Title,
    bc.book_copies_No_Of_Copies
FROM 
    tbl_book_authors ba
JOIN 
    tbl_book b ON ba.book_authors_BookID = b.book_BookID
JOIN 
    tbl_book_copies bc ON b.book_BookID = bc.book_copies_BookID
JOIN 
    tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE 
    ba.book_authors_AuthorName = 'Stephen King'
    AND lb.library_branch_BranchName = 'Central';


