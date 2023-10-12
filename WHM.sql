CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Description TEXT,
    Category TEXT,
    UnitPrice REAL,
    QuantityInStock INTEGER
);

-- Create a table for suppliers
CREATE TABLE Suppliers (
    SupplierID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    ContactInfo TEXT
);

-- Create a table for warehouse locations
CREATE TABLE WarehouseLocations (
    LocationID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL
);

-- Create a table to track the inventory in the warehouse
CREATE TABLE WarehouseInventory (
    ProductID INTEGER,
    LocationID INTEGER,
    QuantityInStock INTEGER,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (LocationID) REFERENCES WarehouseLocations(LocationID)
);

-- Create a table for customers
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    ContactInfo TEXT
);

-- Create a table for orders
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE,
    TotalAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create a table for order details
CREATE TABLE OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    Subtotal REAL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create a table for suppliers' product offerings
CREATE TABLE SupplierProducts (
    SupplierID INTEGER,
    ProductID INTEGER,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample data (You can add more data as needed)
INSERT INTO Products (Name, Description, Category, UnitPrice, QuantityInStock) VALUES
    ('Product 1', 'Description 1', 'Category A', 10.00, 100),
    ('Product 2', 'Description 2', 'Category B', 15.00, 75);

INSERT INTO Suppliers (Name, ContactInfo) VALUES
    ('Supplier 1', 'Contact 1'),
    ('Supplier 2', 'Contact 2');

INSERT INTO WarehouseLocations (Name) VALUES
    ('Location A'),
    ('Location B');
