USE RetailDB;


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
