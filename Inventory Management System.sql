CREATE DATABASE InventoryManagementSystem;

USE InventoryManagementSystem;

CREATE TABLE Items (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Category VARCHAR(50),
    SKU VARCHAR(50) UNIQUE NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    ReorderLevel INT DEFAULT 10,
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Warehouses (
    WID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone VARCHAR(20),
    Manager VARCHAR(100),
    Capacity INT,
    Status VARCHAR(20) DEFAULT 'Active',
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Shipments (
    ShipID INT PRIMARY KEY AUTO_INCREMENT,
    ItemID INT NOT NULL,
    WID INT NOT NULL,
    SupplierID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    ShipmentDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'In Transit',
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID),

    FOREIGN KEY (WID)
        REFERENCES Warehouses(WID),

    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Transactions (
    TransID INT PRIMARY KEY AUTO_INCREMENT,
    ItemID INT NOT NULL,
    WID INT NOT NULL,
    Type VARCHAR(20) NOT NULL
        CHECK (Type IN ('IN', 'OUT', 'ADJUST')),
    Quantity INT NOT NULL,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Notes TEXT,
    Status VARCHAR(20) DEFAULT 'Completed',

    FOREIGN KEY (ItemID)
        REFERENCES Items(ItemID),

    FOREIGN KEY (WID)
        REFERENCES Warehouses(WID)
);

-- =========================================
-- INSERT ITEMS DATA
-- =========================================

INSERT INTO Items
(ItemID, Name, Description, Category, SKU, UnitPrice, ReorderLevel)
VALUES
(1, 'Laptop Pro X', 'High-performance laptop with 16GB RAM',
 'Electronics', 'LP-X-001', 1299.99, 10),

(2, 'Wireless Mouse', 'Ergonomic wireless mouse with Bluetooth',
 'Accessories', 'WM-BT-002', 29.99, 20),

(3, 'USB-C Cable', '6ft USB-C to USB-C charging cable',
 'Accessories', 'UC-6FT-003', 15.99, 30),

(4, 'Monitor 27"', '4K UHD monitor for professionals',
 'Electronics', 'MN-4K-004', 449.99, 8),

(5, 'Mechanical Keyboard', 'RGB mechanical gaming keyboard',
 'Accessories', 'MK-RGB-005', 89.99, 15),

(6, 'External SSD 1TB', 'Portable solid state drive',
 'Storage', 'SSD-1TB-006', 149.99, 12),

(7, 'Office Chair', 'Ergonomic office chair with lumbar support',
 'Furniture', 'OC-ERG-007', 299.99, 5),

(8, 'Desk Lamp', 'LED desk lamp with adjustable brightness',
 'Furniture', 'DL-LED-008', 45.99, 15),

(9, 'Printer Ink', 'Black ink cartridge for laser printers',
 'Supplies', 'IC-BLK-009', 39.99, 25),

(10, 'Paper Ream', '500 sheets of premium A4 paper',
 'Supplies', 'PR-A4-010', 12.99, 30);
 
 
-- =========================================
-- INSERT WAREHOUSES DATA
-- =========================================

INSERT INTO Warehouses
(WID, Location, Address, Phone, Manager, Capacity, Status)
VALUES
(1, 'New York - Main',
 '123 Warehouse Blvd, NYC, NY 10001',
 '555-1001', 'John Manager', 10000, 'Active'),

(2, 'Los Angeles - West',
 '456 Logistics Ave, LA, CA 90001',
 '555-1002', 'Sarah Supervisor', 8000, 'Active'),

(3, 'Chicago - Central',
 '789 Distribution St, Chicago, IL 60601',
 '555-1003', 'Mike Coordinator', 6000, 'Active'),

(4, 'Miami - South',
 '321 Storage Ln, Miami, FL 33101',
 '555-1004', 'Lisa Lead', 4000, 'Active'),

(5, 'Seattle - North',
 '654 Inventory Rd, Seattle, WA 98101',
 '555-1005', 'David Admin', 5000, 'Active');
 
-- =========================================
-- INSERT SUPPLIERS DATA
-- =========================================

INSERT INTO Suppliers
(SupplierID, Name, ContactPerson, Email, Phone, Address, Rating)
VALUES
(1, 'TechGiant Supplies',
 'Robert Chen', 'robert@techgiant.com',
 '555-2001', '123 Tech Park, CA', 5),

(2, 'OfficeMasters Inc',
 'Lisa Wong', 'lisa@officemasters.com',
 '555-2002', '456 Office Plaza, TX', 4),

(3, 'Global Electronics',
 'James Smith', 'james@globalelec.com',
 '555-2003', '789 Global Ave, NY', 5),

(4, 'Storage Solutions',
 'Maria Garcia', 'maria@storagesol.com',
 '555-2004', '321 Storage Blvd, IL', 4),

(5, 'Furniture Plus',
 'David Wilson', 'david@furnitureplus.com',
 '555-2005', '654 Furniture Ln, FL', 3),

(6, 'Supply Depot',
 'Anna Johnson', 'anna@supplydepot.com',
 '555-2006', '987 Supply St, CA', 5),

(7, 'TechAccessories Co',
 'Mark Lee', 'mark@techaccess.com',
 '555-2007', '147 Tech Access Rd, WA', 4);
 
-- =========================================
-- INSERT SHIPMENTS DATA
-- =========================================

INSERT INTO Shipments
(ShipID, ItemID, WID, SupplierID, Quantity, ShipmentDate, Status)
VALUES

-- New York Warehouse
(1, 1, 1, 1, 20, '2024-06-01', 'Delivered'),
(2, 2, 1, 2, 50, '2024-06-02', 'Delivered'),
(3, 4, 1, 3, 15, '2024-06-03', 'In Transit'),
(4, 6, 1, 4, 25, '2024-06-04', 'Delivered'),
(5, 7, 1, 5, 10, '2024-06-05', 'Shipped'),

-- Los Angeles Warehouse
(6, 2, 2, 2, 40, '2024-06-01', 'Delivered'),
(7, 3, 2, 6, 80, '2024-06-02', 'Delivered'),
(8, 5, 2, 7, 30, '2024-06-03', 'In Transit'),
(9, 8, 2, 5, 25, '2024-06-04', 'Shipped'),
(10, 9, 2, 6, 60, '2024-06-05', 'Delivered'),

-- Chicago Warehouse
(11, 1, 3, 1, 15, '2024-06-02', 'Delivered'),
(12, 6, 3, 4, 20, '2024-06-03', 'In Transit'),
(13, 10, 3, 6, 100, '2024-06-04', 'Delivered'),
(14, 3, 3, 6, 70, '2024-06-05', 'Shipped'),
(15, 7, 3, 5, 8, '2024-06-06', 'Pending'),

-- Miami Warehouse
(16, 2, 4, 2, 30, '2024-06-03', 'Delivered'),
(17, 5, 4, 7, 20, '2024-06-04', 'Shipped'),
(18, 10, 4, 6, 80, '2024-06-05', 'Delivered'),
(19, 9, 4, 6, 40, '2024-06-06', 'In Transit'),

-- Seattle Warehouse
(20, 1, 5, 1, 12, '2024-06-04', 'Delivered'),
(21, 4, 5, 3, 10, '2024-06-05', 'Shipped'),
(22, 8, 5, 5, 15, '2024-06-06', 'Pending');

-- =========================================
-- INSERT TRANSACTIONS DATA
-- =========================================

INSERT INTO Transactions
(TransID, ItemID, WID, Type, Quantity, TransactionDate, Notes)
VALUES

-- =========================================
-- IN TRANSACTIONS
-- =========================================

-- New York
(1, 1, 1, 'IN', 20,
 '2024-06-01 10:00:00',
 'Received shipment #1'),

(2, 2, 1, 'IN', 50,
 '2024-06-02 14:30:00',
 'Received shipment #2'),

(3, 6, 1, 'IN', 25,
 '2024-06-04 09:15:00',
 'Received shipment #4'),

-- Los Angeles
(4, 2, 2, 'IN', 40,
 '2024-06-01 11:00:00',
 'Received shipment #6'),

(5, 3, 2, 'IN', 80,
 '2024-06-02 16:00:00',
 'Received shipment #7'),

(6, 9, 2, 'IN', 60,
 '2024-06-05 10:30:00',
 'Received shipment #10'),

-- Chicago
(7, 1, 3, 'IN', 15,
 '2024-06-02 08:00:00',
 'Received shipment #11'),

(8, 10, 3, 'IN', 100,
 '2024-06-04 13:00:00',
 'Received shipment #13'),

-- Miami
(9, 2, 4, 'IN', 30,
 '2024-06-03 09:00:00',
 'Received shipment #16'),

(10, 10, 4, 'IN', 80,
 '2024-06-05 11:30:00',
 'Received shipment #18'),

-- Seattle
(11, 1, 5, 'IN', 12,
 '2024-06-04 14:00:00',
 'Received shipment #20'),


-- =========================================
-- OUT TRANSACTIONS
-- =========================================

(12, 1, 1, 'OUT', 5,
 '2024-06-05 10:00:00',
 'Customer order #ORD-1001'),

(13, 2, 1, 'OUT', 15,
 '2024-06-05 14:00:00',
 'Customer order #ORD-1002'),

(14, 6, 1, 'OUT', 8,
 '2024-06-06 09:30:00',
 'Customer order #ORD-1003'),

(15, 3, 2, 'OUT', 20,
 '2024-06-05 11:00:00',
 'Customer order #ORD-1004'),

(16, 5, 2, 'OUT', 10,
 '2024-06-06 13:00:00',
 'Customer order #ORD-1005'),

(17, 1, 3, 'OUT', 3,
 '2024-06-06 10:00:00',
 'Customer order #ORD-1006'),

(18, 10, 3, 'OUT', 25,
 '2024-06-06 16:00:00',
 'Customer order #ORD-1007'),

(19, 2, 4, 'OUT', 8,
 '2024-06-06 09:00:00',
 'Customer order #ORD-1008'),

(20, 9, 2, 'OUT', 12,
 '2024-06-07 11:00:00',
 'Customer order #ORD-1009'),

(21, 4, 1, 'OUT', 5,
 '2024-06-07 15:30:00',
 'Customer order #ORD-1010'),

(22, 1, 5, 'OUT', 2,
 '2024-06-07 10:00:00',
 'Customer order #ORD-1011'),


-- =========================================
-- ADJUST TRANSACTIONS
-- =========================================

(23, 2, 1, 'ADJUST', 5,
 '2024-06-06 12:00:00',
 'Corrected stock count after audit'),

(24, 3, 2, 'ADJUST', -3,
 '2024-06-06 14:00:00',
 'Damaged items removed'),

(25, 5, 3, 'ADJUST', 10,
 '2024-06-07 09:00:00',
 'Returned items from customer');
 

-- 1.List all items in a specific warehouse.
-- New York - Main

SELECT
    w.Location,
    i.ItemID,
    i.Name,
    SUM(
        CASE
            WHEN t.Type = 'IN' THEN t.Quantity
            WHEN t.Type = 'OUT' THEN -t.Quantity
            WHEN t.Type = 'ADJUST' THEN t.Quantity
        END
    ) AS CurrentStock
FROM Transactions t
JOIN Items i
    ON t.ItemID = i.ItemID
JOIN Warehouses w
    ON t.WID = w.WID
WHERE w.Location = 'New York - Main'
GROUP BY w.Location, i.ItemID, i.Name;

-- 2.Find items supplied by a specific supplier.
-- TechGiant Supplies

SELECT DISTINCT
    s.Name AS Supplier,
    i.ItemID,
    i.Name AS Item,
    i.Category
FROM Suppliers s
JOIN Shipments sh
    ON s.SupplierID = sh.SupplierID
JOIN Items i
    ON sh.ItemID = i.ItemID
WHERE s.Name = 'TechGiant Supplies';

-- 3.Count current stock level of each item.

SELECT
    i.ItemID,
    i.Name,
    COALESCE(
        SUM(
            CASE
                WHEN t.Type = 'IN' THEN t.Quantity
                WHEN t.Type = 'OUT' THEN -t.Quantity
                WHEN t.Type = 'ADJUST' THEN t.Quantity
            END
        ), 0
    ) AS CurrentStock
FROM Items i
LEFT JOIN Transactions t
    ON i.ItemID = t.ItemID
GROUP BY
    i.ItemID,
    i.Name
ORDER BY
    i.ItemID;
    
-- 4.List recent transactions for an item.
-- Laptop Pro X

SELECT
    t.TransID,
    i.Name AS Item,
    w.Location AS Warehouse,
    t.Type,
    t.Quantity,
    t.TransactionDate,
    t.Notes,
    t.Status
FROM Transactions t
JOIN Items i
    ON t.ItemID = i.ItemID
JOIN Warehouses w
    ON t.WID = w.WID
WHERE i.Name = 'Laptop Pro X'
ORDER BY t.TransactionDate DESC;

-- 5.Identify warehouses with low stock.

SELECT
    w.Location,
    i.Name AS Item,
    i.ReorderLevel,
    SUM(
        CASE
            WHEN t.Type = 'IN' THEN t.Quantity
            WHEN t.Type = 'OUT' THEN -t.Quantity
            WHEN t.Type = 'ADJUST' THEN t.Quantity
        END
    ) AS CurrentStock
FROM Transactions t
JOIN Items i
    ON t.ItemID = i.ItemID
JOIN Warehouses w
    ON t.WID = w.WID
GROUP BY
    w.Location,
    i.ItemID,
    i.Name,
    i.ReorderLevel
HAVING CurrentStock < i.ReorderLevel;

-- 6.Find total shipments per warehouse.

SELECT
    w.WID,
    w.Location,
    COUNT(sh.ShipID) AS TotalShipments
FROM Warehouses w
LEFT JOIN Shipments sh
    ON w.WID = sh.WID
GROUP BY
    w.WID,
    w.Location
ORDER BY
    TotalShipments DESC;
    
-- 7.List items that haven't been shipped.

SELECT
    i.ItemID,
    i.Name,
    i.Category,
    i.SKU
FROM Items i
LEFT JOIN Shipments sh
    ON i.ItemID = sh.ItemID
WHERE sh.ItemID IS NULL;

-- 8.Find the supplier for a specific shipment.

SELECT
    sh.ShipID,
    i.Name AS Item,
    s.Name AS Supplier,
    w.Location AS Warehouse,
    sh.Quantity,
    sh.ShipmentDate,
    sh.Status
FROM Shipments sh
JOIN Items i
    ON sh.ItemID = i.ItemID
JOIN Suppliers s
    ON sh.SupplierID = s.SupplierID
JOIN Warehouses w
    ON sh.WID = w.WID
WHERE sh.ShipID = 1;

-- 9.Calculate the total quantity of items across all warehouses.

SELECT
    COALESCE(
        SUM(
            CASE
                WHEN Type = 'IN' THEN Quantity
                WHEN Type = 'OUT' THEN -Quantity
                WHEN Type = 'ADJUST' THEN Quantity
            END
        ), 0
    ) AS TotalInventory
FROM Transactions;




