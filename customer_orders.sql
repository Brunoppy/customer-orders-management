-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Customers
INSERT INTO Customers (Name, Email, Phone) VALUES
('John Doe', 'john@example.com', '123-456-7890'),
('Jane Smith', 'jane@example.com', '987-654-3210');

-- Insert sample data into Products
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Headphones', 150.00);

-- Insert sample data into Orders
INSERT INTO Orders (CustomerID, ProductID) VALUES
(1, 1), -- John Doe bought a Laptop
(2, 2), -- Jane Smith bought a Smartphone
(1, 3); -- John Doe bought Headphones

-- Retrieve all orders with customer and product details
SELECT 
    Orders.OrderID,
    Customers.Name AS CustomerName,
    Products.ProductName,
    Products.Price,
    Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID;
