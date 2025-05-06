# final-project-in-Database-Design
# 📚 Library Management System (MySQL)

## ✅ Project Title
**Library Management Relational Database**

## 📌 Description

This project is a relational database system for managing a small library. It is designed using MySQL and includes all key components such as:

- Authors and their details
- Books and their metadata
- Customers who borrow books
- Loan records of books issued and returned

It ensures proper normalization, foreign key relationships, and includes sample data for quick setup and testing.

---

## ⚙️ How to Setup / Run the Project

### Option 1: Using MySQL Workbench or Command Line

1. Copy or download the SQL script file: `library_management.sql`
2. Open **MySQL Workbench**, **phpMyAdmin**, or your preferred SQL tool
3. Paste the code and run the script
4. The following will be created:
   - Database schema
   - `Authors`, `Books`, `Customers`, and `Loans` tables
   - Sample data for quick testing

### Option 2: Using phpMyAdmin Import

1. Open **phpMyAdmin**
2. Click **Import**
3. Choose the `.sql` file
4. Click **Go** to execute and set up everything

---

## 🗂️ Database Structure

### 👤 Authors Table

| Column      | Type         | Description                  |
|-------------|--------------|------------------------------|
| AuthorID    | INT (PK)     | Auto-incremented author ID   |
| Name        | VARCHAR(100) | Full name of the author      |
| BirthDate   | DATE         | Date of birth                |
| Nationality | VARCHAR(50)  | Nationality of the author    |

---

### 📖 Books Table

| Column          | Type         | Description                            |
|-----------------|--------------|----------------------------------------|
| BookID          | INT (PK)     | Auto-incremented book ID               |
| Title           | VARCHAR(100) | Title of the book                      |
| AuthorID        | INT (FK)     | Linked to Authors table                |
| Genre           | VARCHAR(50)  | Genre/category of the book             |
| PublicationYear | INT          | Year of publication                    |
| ISBN            | VARCHAR(20)  | Unique ISBN number                     |

---

### 👥 Customers Table

| Column      | Type         | Description                          |
|-------------|--------------|--------------------------------------|
| CustomerID  | INT (PK)     | Auto-incremented ID                  |
| FirstName   | VARCHAR(50)  | Customer's first name                |
| LastName    | VARCHAR(50)  | Customer's last name                 |
| Email       | VARCHAR(100) | Unique email address                 |
| PhoneNumber | VARCHAR(15)  | Contact number                       |
| Address     | VARCHAR(255) | Home address                         |

---

### 📅 Loans Table

| Column     | Type | Description                          |
|------------|------|--------------------------------------|
| LoanID     | INT (PK) | Auto-incremented loan ID          |
| CustomerID | INT (FK) | Linked to Customers table         |
| BookID     | INT (FK) | Linked to Books table             |
| LoanDate   | DATE     | Date when book was borrowed       |
| ReturnDate | DATE     | Date when book was returned       |

---

## 🧪 Sample Data Highlights

- Authors include George Orwell, J.K. Rowling, and Harper Lee
- Books include *1984*, *Harry Potter*, and *To Kill a Mockingbird*
- Customers include John Doe and Jane Smith
- Sample loan transactions recorded with actual dates

---

## 👨‍💻 Author

Koskei Kevin  
📧 koskeikevin0@gmail.com  
🎓 BSc in Computer Security and Forensics  
🏫 Jaramogi Oginga Odinga University  
📍 Narok County, Kenya  
