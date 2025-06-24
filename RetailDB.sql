-- RetailDB: A Sample Retail Management Database
-- ---------------------------------------------
-- This SQL script creates and populates a relational database designed 
-- to simulate a retail business environment. It includes customers, 
-- suppliers, products, orders, payments, inventory changes, and order details.
--
-- Tables:
--   - Customers: Stores customer contact and registration information.
--   - Suppliers: Stores supplier details for product sourcing.
--   - Products: Contains catalog information, stock levels, and suppliers.
--   - Orders: Tracks customer purchases with status and totals.
--   - OrderDetails: Line-item breakdowns of each order.
--   - Payments: Records payment method, amount, and status per order.
--   - Inventory: Logs restocks and sales activity per product.
--
-- Sample data is included to enable testing and querying.
-- A final SELECT query joins multiple tables to display comprehensive
-- order, customer, product, supplier, inventory, and payment information.
--
-- Compatible with MySQL 

-- Maurice Hazan
-- 06/24/2025
-- ======================================================================================================

CREATE DATABASE RetailDB;

USE RetailDB;

-- ===================================================
-- ============== Customers Table ====================
-- ===================================================

CREATE TABLE Customers (
    CustomerID 			INT PRIMARY KEY AUTO_INCREMENT,
    FirstName 			VARCHAR(50) NOT NULL,
    LastName 			VARCHAR(50) NOT NULL,
    Email 				VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber 		VARCHAR(15),
    Address 			VARCHAR(255),
    City 				VARCHAR(50),
    State 				VARCHAR(50),
    ZipCode 			VARCHAR(10),
    RegistrationDate 	DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===================================================
-- ============== Suppliers Table ====================
-- ===================================================

CREATE TABLE Suppliers (
    SupplierID 			INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName 		VARCHAR(100) NOT NULL,
    ContactName 		VARCHAR(50),
    PhoneNumber 		VARCHAR(15),
    Email 				VARCHAR(100),
    Address 			VARCHAR(255),
    City 				VARCHAR(50),
    State 				VARCHAR(50),
    ZipCode 			VARCHAR(10)
);

-- ===================================================
-- ============== Products Table =====================
-- ===================================================

CREATE TABLE Products (
    ProductID 			INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID 			INT NOT NULL,
    ProductName 		VARCHAR(100) NOT NULL,
    Category 			VARCHAR(50),
    Price 				DECIMAL(10, 2) NOT NULL,
    StockQuantity 		INT NOT NULL,
    Description 		TEXT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- ===================================================
-- ============== Orders Table =======================
-- ===================================================

CREATE TABLE Orders (
    OrderID 			INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID 			INT NOT NULL,
    OrderDate 			DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount			DECIMAL(10, 2) NOT NULL,
    OrderStatus 		VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ===================================================
-- ============== OrderDetails Table =================
-- ===================================================

CREATE TABLE OrderDetails (
    OrderDetailID 		INT PRIMARY KEY AUTO_INCREMENT,
    OrderID 			INT NOT NULL,
    ProductID 			INT NOT NULL,
    Quantity 			INT NOT NULL,
    Price 				DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ===================================================
-- ============== Inventory Table ====================
-- ===================================================

CREATE TABLE Inventory (
    InventoryID 		INT PRIMARY KEY AUTO_INCREMENT,
    ProductID 			INT NOT NULL,
    ChangeType 			ENUM('Restock', 'Sale') NOT NULL,
    Quantity 			INT NOT NULL,
    ChangeDate 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ===================================================
-- ============== Payments Table =====================
-- ===================================================

CREATE TABLE Payments (
    PaymentID 			INT PRIMARY KEY AUTO_INCREMENT,
    OrderID 			INT NOT NULL,
    PaymentDate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod 		ENUM('Credit Card', 'Debit Card', 'Cash', 'PayPal', 'Gift Card', 'Other') NOT NULL,
    AmountPaid 			DECIMAL(10, 2) NOT NULL,
    PaymentStatus 	    ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Sample data inserts

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode, RegistrationDate) VALUES
('Emma', 'Johnson', 'emma.johnson@example.com', '555-123-4567', '123 Maple St', 'Springfield', 'IL', '62704', '2024-10-01 10:20:30'),
('Liam', 'Smith', 'liam.smith@example.com', '555-234-5678', '456 Oak Ave', 'Austin', 'TX', '73301', '2024-10-03 14:10:22'),
('Olivia', 'Williams', 'olivia.williams@example.com', '555-345-6789', '789 Pine Rd', 'Seattle', 'WA', '98101', '2024-10-04 09:05:12'),
('Noah', 'Brown', 'noah.brown@example.com', '555-456-7890', '321 Birch Blvd', 'Denver', 'CO', '80202', '2024-10-05 16:44:00');


INSERT INTO Products (ProductName, Category, Price, StockQuantity, SupplierID, Description) VALUES
('Wireless Mouse', 'Electronics', 25.99, 100, 1, 'Ergonomic wireless mouse with USB receiver'),
('Bluetooth Headphones', 'Electronics', 49.99, 80, 2, 'Over-ear Bluetooth headphones with noise cancellation'),
('USB-C Charger', 'Accessories', 19.99, 150, 1, 'Fast-charging USB-C power adapter');


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus) VALUES
(1, '2024-06-01 10:30:00', 99.98, 'Completed'),
(2, '2024-06-02 14:45:00', 59.99, 'Shipped'),
(3, '2024-06-03 09:20:00', 120.50, 'Pending'),
(4, '2024-06-03 16:10:00', 34.99, 'Cancelled'),
(5, '2024-06-04 11:25:00', 200.00, 'Completed');


INSERT INTO Inventory (ProductID, ChangeType, Quantity, ChangeDate)
VALUES
(1, 'Restock', 100, '2025-05-01 09:00:00'),
(2, 'Sale', 5, '2025-05-02 10:15:00'),
(3, 'Restock', 50, '2025-05-03 14:30:00'),
(4, 'Sale', 3, '2025-05-04 12:00:00');


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 5, 2, 49.99),
(1, 12, 1, 79.95),
(2, 3, 1, 29.99);


INSERT INTO Suppliers (SupplierName, ContactName, PhoneNumber, Email, Address, City, State, ZipCode) VALUES
('Global Goods Inc.', 'Alice Johnson', '555-123-4567', 'alice@globalgoods.com', '101 Market Street', 'New York', 'NY', '10001'),
('Supply Chain Co.', 'Bob Smith', '555-234-5678', 'bob@supplychainco.com', '202 Commerce Blvd', 'Chicago', 'IL', '60601'),
('Tech Source Ltd.', 'Carol Davis', '555-345-6789', 'carol@techsource.com', '303 Silicon Way', 'San Jose', 'CA', '95112'),
('EcoHome Supplies', 'David Lee', '555-456-7890', 'david@ecohome.com', '404 Green Lane', 'Portland', 'OR', '97201'),
('Wholesale Depot', 'Ellen Kim', '555-567-8901', 'ellen@wholesaledepot.com', '505 Bulk Road', 'Dallas', 'TX', '75201');


INSERT INTO Payments (OrderID, PaymentMethod, AmountPaid) VALUES
(5, 'Debit Card', '104.82'),
(6, 'Credit Card', '308.82'),
(7, 'Debit Card', '50.23'),
(8, 'Debit Card', '212.43'),
(9, 'Credit Card', '14.23'),
(10, 'PayPal',    '76.55'),
(11, 'Debit Card', '232.01');


-- The following Query gives me: Order Information (OrderID, OrderDate)                   
--                               Customer Information (FirstName, LastName, Email)
--                               Product Information (ProductName)
--                               Purchase Details    (Quantity, Price, and calculated TotalItemPrice)
--                               Suppliers information (Supplier Name for that given product)
--                               Inventory informtaion (Restaock or Sale)
--                               Payments informtion  (Payment method and Payment Status on order)

SELECT
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName,
    c.Email,
    p.ProductName,
    p.Category,
    s.SupplierName,
    od.Quantity,
    od.Price,
    (od.Quantity * od.Price) AS TotalItemPrice,
    o.Status,
    pa.PaymentMethod,
    pa.PaymentStatus,
    i.ChangeType,
    i.Quantity AS InventoryChangeQty,
    i.ChangeDate
FROM 		Orders o
JOIN 		Customers c     ON o.CustomerID = c.CustomerID
JOIN 		OrderDetails od ON o.OrderID = od.OrderID
JOIN 		Products p      ON od.ProductID = p.ProductID
LEFT JOIN 	Suppliers s     ON p.SupplierID = s.SupplierID
LEFT JOIN 	Inventory i     ON p.ProductID = i.ProductID
LEFT JOIN 	Payments pa     ON o.OrderID = pa.OrderID
ORDER BY o.OrderDate, o.OrderID;



