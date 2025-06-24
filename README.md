# RetailDB

RetailDB is a sample SQL-based database project that simulates the operations of a retail business. 
It is designed to help developers, analysts, and students understand relational database design, data relationships, and practical SQL querying in a retail context.

This project was created by **Maurice Hazan**, a self-driven developer with hands-on experience in SQL, data modeling, and legacy systems like AS/400. 
Maurice built RetailDB and several other full-scale, real world scenarios databases to strengthen his data portfolio and demonstrate real-world database structuring, normalization, and complex joins—all foundational to operational reporting in business environments.

## 💼 Project Overview

This database models key areas of a retail operation, including:

- **Customers**: Contact and location info for each customer.
- **Suppliers**: Companies that provide products.
- **Products**: Retail items, including pricing, stock, and descriptions.
- **Orders**: Purchase transactions from customers.
- **OrderDetails**: Line items that make up each order.
- **Inventory**: Logs for restocks and sales affecting stock levels.
- **Payments**: Payment method, amount, and transaction status.

## 🧱 Database Structure

Here’s a high-level view of how the tables relate:
Customers ─┬─ Orders ─┬─ OrderDetails ─┬─ Products ─┬─ Suppliers
│ │ │ │
│ └── Payments └── Inventory

Each table includes realistic fields such as timestamps, foreign key constraints, default values, and appropriate data types.

## 📂 Files

- `schema.sql` – All `CREATE TABLE` statements and foreign key definitions.
- `data.sql` – Insert statements with sample data (customers, suppliers, products, orders, and inventory events).
- `queries.sql` – A JOIN query that provides a detailed view of retail operations, combining data across multiple tables.

## 🧪 Sample Output (Final Query)

The final query in `queries.sql` returns:

- Order information (OrderID, Date, Status)
- Customer details (Name, Email)
- Product info (Name, Category)
- Supplier name
- Purchase details (Quantity, Unit Price, Total per line item)
- Payment info (Method and Status)
- Inventory change data (Restock or Sale activity)

## 🙌 About the Author

Maurice Hazan is a career-long problem solver with deep roots in data and technology. 
With past experience in AS/400 RPG development and a current focus on SQL and modern database systems, 
Maurice is rebuilding a strong technical portfolio to transition into full-time data and technology roles. 
RetailDB is part of that journey—designed, built, and documented from scratch.

Feel free to connect or collaborate!
