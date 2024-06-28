Create database GYM;
USE GYM;

-- Create Member table
CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(20),
    Email VARCHAR(50),
    Address VARCHAR(100),
    MembershipID INT,
    CONSTRAINT fk_MembershipID FOREIGN KEY (MembershipID) REFERENCES Membership(MembershipID)
);

-- Create Membership table
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY,
    MembershipType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10, 2)
);


-- Create Trainer table
CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(20),
    Email VARCHAR(50)
);

-- Create Class table
CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50),
    Schedule DATETIME,
    Duration INT,
    TrainerID INT,
    CONSTRAINT fk_TrainerID FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

-- Create Equipment table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(50),
    Quantity INT,
    Conditions VARCHAR(50),
    MaintenanceSchedule DATE,
    SupplierID INT,
    CONSTRAINT fk_SupplierID FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    AttendanceDate DATE,
    CONSTRAINT fk_MemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    CONSTRAINT fk_ClassID FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    CONSTRAINT fk_PaymentMemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    MemberID INT,
    TrainerID INT,
    ClassID INT,
    Rating INT,
    Comments TEXT,
    CONSTRAINT fk_FeedbackMemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    CONSTRAINT fk_FeedbackTrainerID FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
    CONSTRAINT fk_FeedbackClassID FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Create Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    ContactNumber VARCHAR(20),
    Email VARCHAR(50)
);

-- Create Supplier table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    ContactNumber VARCHAR(20),
    Supplies VARCHAR(100)
);
