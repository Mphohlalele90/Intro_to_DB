-- Create Database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'alx_book_store')
BEGIN
    CREATE DATABASE alx_book_store;
END
GO
USE alx_book_store;

-- Create Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    author_name VARCHAR(215) NOT NULL
);

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price FLOAT NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Details Table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    book_id INT,
    quantity FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);