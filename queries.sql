-- The following Query gives me: Order Information (OrderID, OrderDate)                   
--                               Customer Information (FirstName, LastName, Email)
--                               Product Information (ProductName)
--                               Purchase Details    (Quantity, Price, and calculated TotalItemPrice)
--                               Suppliers information (Supplier Name for that given product)
--                               Inventory informtaion (Restaock or Sale)
--                               Payments informtion  (Payment method and Payment Status on order)

USE RetailDB; 

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



