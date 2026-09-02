# Inventroy_Management_System
# 📦 Inventory Management System – SQL Project

## 📌 Project Overview

This project is an **Inventory Management System** developed using **MySQL**.

The system is designed to manage inventory items, warehouses, suppliers, shipments, and stock transactions.

The project demonstrates how SQL can be used to store, manage, and analyze inventory data.

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* **GitHub**

---

## 🗂️ Database Tables

The database contains the following main tables:

### 1. Items

Stores information about inventory items such as:

* Item ID
* Item Name
* Description
* Category
* SKU
* Unit Price
* Reorder Level
* Created Date

### 2. Warehouses

Stores warehouse information such as:

* Warehouse ID
* Location
* Address
* Phone
* Manager
* Capacity
* Status

### 3. Suppliers

Stores supplier information such as:

* Supplier ID
* Supplier Name
* Contact Person
* Email
* Phone
* Address
* Supplier Rating

### 4. Shipments

Stores shipment information including:

* Shipment ID
* Item
* Warehouse
* Supplier
* Quantity
* Shipment Date
* Shipment Status

### 5. Transactions

Stores inventory movements such as:

* Stock IN
* Stock OUT
* Stock ADJUST
* Quantity
* Transaction Date
* Notes
* Status

## The database uses **primary keys and foreign keys** to connect related tables.

## 📊 Sample Data

The project includes sample data for:

* 10 inventory items
* 5 warehouses
* 7 suppliers
* Multiple shipments
* Multiple inventory transactions

The sample inventory includes products such as laptops, wireless mice, USB-C cables, monitors, keyboards, SSDs, office furniture, and office supplies.

---

## 🔍 SQL Analysis Performed

The project contains SQL queries to answer common inventory management questions.

### Questions answered:

1. List all items in a specific warehouse.
2. Find items supplied by a specific supplier.
3. Calculate the current stock level of each item.
4. List recent transactions for an item.
5. Identify warehouses with low stock.
6. Find the total number of shipments per warehouse.
7. List items that haven't been shipped.
8. Find the supplier for a specific shipment.
9. Calculate the total quantity of items across all warehouses.

---

## 🧠 SQL Concepts Used

This project demonstrates the following SQL concepts:

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `WHERE`
* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* `DISTINCT`
* `CASE`
* `SUM()`
* `COUNT()`
* `COALESCE()`
* Primary Keys
* Foreign Keys
* Unique Constraints
* Check Constraints
* Aggregate Functions

---

## 📈 Inventory Calculation

The project calculates current inventory using transaction types:

* **IN** → Adds stock
* **OUT** → Removes stock
* **ADJUST** → Adjusts the stock quantity

For example:

```text
Current Stock = IN - OUT + ADJUST
```

This logic is used in several inventory queries.

---

## 🚀 How to Run the Project

### Step 1 – Install MySQL

Install **MySQL Server** and optionally **MySQL Workbench**.

### Step 2 – Open MySQL Workbench

Open your MySQL Workbench application.

### Step 3 – Open the SQL File

Open:

```text
Inventory Management System.sql
```

### Step 4 – Execute the Script

Run the complete SQL script.

The script first creates the database:

```sql
CREATE DATABASE InventoryManagementSystem;
```

and then selects it for use.

### Step 5 – Run the Queries

After creating the database and inserting the data, run the analysis queries to explore the inventory information.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Manage inventory items
* Track warehouse stock
* Manage supplier information
* Track shipments
* Track stock movements
* Identify low-stock items
* Analyze inventory across warehouses
* Practice SQL joins and aggregate functions

---

## 📁 Project Structure

```text
Inventory-Management-System/
│
├── Inventory Management System.sql
└── README.md
```

---

## 👨‍💻 Author

**Dinesh**

This project was created as a SQL/database portfolio project to demonstrate practical SQL skills and inventory management concepts.
