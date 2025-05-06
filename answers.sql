# question 1
USE library_management;

-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Nationality VARCHAR(50)
);

-- Create the Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    PublicationYear INT,
    ISBN VARCHAR(20) UNIQUE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- Create the Loans table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data into Authors table
INSERT INTO Authors (Name, BirthDate, Nationality) VALUES
('George Orwell', '1903-06-25', 'British'),
('J.K. Rowling', '1965-07-31', 'British'),
('Harper Lee', '1926-04-28', 'American');

-- Insert sample data into Books table
INSERT INTO Books (Title, AuthorID, Genre, PublicationYear, ISBN) VALUES
('1984', 1, 'Dystopian', 1949, '9780451524935'),
('Harry Potter and the Sorcerer\'s Stone', 2, 'Fantasy', 1997, '9780439708180'),
('To Kill a Mockingbird', 3, 'Fiction', 1960, '9780061120084');

-- Insert sample data into Customers table
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Avenue');

-- Insert sample data into Loans table
INSERT INTO Loans (CustomerID, BookID, LoanDate, ReturnDate) VALUES
(1, 1, '2023-04-01', '2023-04-15'),
(2, 2, '2023-04-03', '2023-04-10');
