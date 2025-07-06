CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price FLOAT NOT NULL,
    publication_date DATE,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity FLOAT NOT NULL,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT FK_OrderDetails_Books FOREIGN KEY (book_id) REFERENCES Books(book_id)
);