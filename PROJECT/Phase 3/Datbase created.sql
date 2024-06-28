create database Mobile;
use mobile;


CREATE TABLE ITEMS (
    Item_ID INT PRIMARY KEY,
    Item_Name VARCHAR(255),
    Brand_ID INT,
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (Brand_ID) REFERENCES BRAND(Brand_ID)
);

-- BRAND table
CREATE TABLE BRAND (
    Brand_ID INT PRIMARY KEY,
    Brand_Name VARCHAR(255)
);

-- BRANCHES table
CREATE TABLE BRANCHES (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(255),
    Location VARCHAR(255),
    Contact_Details VARCHAR(255)
);

-- STOCK table
CREATE TABLE STOCK (
    Stock_ID INT PRIMARY KEY,
    Item_ID INT,
    Branch_ID INT,
    Quantity INT,
    FOREIGN KEY (Item_ID) REFERENCES ITEMS(Item_ID),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCHES(Branch_ID)
);

-- EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Branch_ID INT,
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCHES(Branch_ID)
);

-- CUSTOMER table
CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact_Details VARCHAR(255),
    Email VARCHAR(255)
);

-- SALES table
CREATE TABLE SALES (
    Sales_ID INT PRIMARY KEY,
    Customer_ID INT,
    Branch_ID INT,
    Total_Amount DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES BRANCHES(Branch_ID)
);

-- STORE table
CREATE TABLE STORE (
    Store_ID INT PRIMARY KEY,
    Branch_ID INT,
    Manager_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES BRANCHES(Branch_ID),
    FOREIGN KEY (Manager_ID) REFERENCES EMPLOYEE(Employee_ID)
);

-- ORDER table
CREATE TABLE `ORDER` (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

-- ORDER_DETAILS table (for handling many-to-many between ORDER and ITEMS)
CREATE TABLE ORDER_DETAILS (
    Order_ID INT,
    Item_ID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, Item_ID),
    FOREIGN KEY (Order_ID) REFERENCES `ORDER`(Order_ID),
    FOREIGN KEY (Item_ID) REFERENCES ITEMS(Item_ID)
);

-- PAYMENT table
CREATE TABLE PAYMENT (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(100),
    Payment_Date DATE,
    FOREIGN KEY (Order_ID) REFERENCES `ORDER`(Order_ID)
);
