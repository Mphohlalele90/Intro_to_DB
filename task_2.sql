-- Create Authors Table
IF OBJECT_ID('Authors', 'U') IS NULL
BEGIN
    CREATE TABLE Authors (
        author_id INT PRIMARY KEY IDENTITY(1,1),
        author_name VARCHAR(215) NOT NULL
    );
END

-- Create Books Table
IF OBJECT_ID('Books', 'U') IS NULL
BEGIN
    CREATE TABLE Books (
        book_id INT PRIMARY KEY IDENTITY(1,1),
        title VARCHAR(130) NOT NULL,
        author_id INT,
        price FLOAT NOT NULL,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    );
END

-- Create Customers Table
IF OBJECT_ID('Customers', 'U') IS NULL
BEGIN
    CREATE TABLE Customers (
        customer_id INT PRIMARY KEY IDENTITY(1,1),
-- Create Orders Table
IF OBJECT_ID('Orders', 'U') IS NULL
BEGIN
    CREATE TABLE Orders (
        order_id INT PRIMARY KEY IDENTITY(1,1),
        customer_id INT,
        order_date DATE NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
END

-- Create Order_Details Table
IF OBJECT_ID('Order_Details', 'U') IS NULL
BEGIN
    CREATE TABLE Order_Details (
        orderdetailid INT PRIMARY KEY IDENTITY(1,1),
        order_id INT,
        book_id INT,
        quantity FLOAT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
    );
END
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
