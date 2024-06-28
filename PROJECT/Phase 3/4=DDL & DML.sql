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


-- Insert data into Membership table
INSERT INTO Membership 
(MembershipID, MembershipType, StartDate, EndDate, Price) 
VALUES
(1, 'Basic', '2024-01-01', '2024-12-31', 300.00),
(2, 'Premium', '2024-01-01', '2024-12-31', 500.00),
(3, 'Student', '2024-01-01', '2024-12-31', 200.00),
(4, 'Senior', '2024-01-01', '2024-12-31', 250.00),
(5, 'Family', '2024-01-01', '2024-12-31', 600.00),
(6, 'Corporate', '2024-01-01', '2024-12-31', 700.00),
(7, 'Daytime', '2024-01-01', '2024-12-31', 150.00),
(8, 'Weekend', '2024-01-01', '2024-12-31', 180.00),
(9, 'Trial', '2024-01-01', '2024-01-31', 50.00),
(10, 'VIP', '2024-01-01', '2024-12-31', 1000.00);

-- Insert data into Member table
INSERT INTO Member 
(MemberID, FirstName, LastName, DOB, Gender, ContactNumber, Email, Address, MembershipID) 
VALUES
(1, 'Ahmed', 'Khan', '1990-01-01', 'Male', '03001234567', 'ahmed.khan@example.com', '123 Main St', 1),
(2, 'Sara', 'Ali', '1985-05-15', 'Female', '03007654321', 'sara.ali@example.com', '456 Elm St', 2),
(3, 'Bilal', 'Hussain', '1992-03-25', 'Male', '03001122334', 'bilal.hussain@example.com', '789 Oak St', 3),
(4, 'Ayesha', 'Malik', '1980-07-30', 'Female', '03006677889', 'ayesha.malik@example.com', '321 Pine St', 4),
(5, 'Zainab', 'Sheikh', '1995-11-10', 'Female', '03004433221', 'zainab.sheikh@example.com', '654 Maple St', 5),
(6, 'Omar', 'Raza', '1988-09-05', 'Male', '03003344556', 'omar.raza@example.com', '987 Cedar St', 6),
(7, 'Nida', 'Ahmed', '1975-02-20', 'Female', '03002233445', 'nida.ahmed@example.com', '159 Birch St', 7),
(8, 'Farhan', 'Zafar', '1993-06-18', 'Male', '03005566778', 'farhan.zafar@example.com', '753 Willow St', 8),
(9, 'Saima', 'Iqbal', '1982-12-12', 'Female', '03001115566', 'saima.iqbal@example.com', '789 Fir St', 9),
(10, 'Usman', 'Latif', '1990-04-28', 'Male', '03008811223', 'usman.latif@example.com', '321 Cedar St', 10);

-- Insert data into Trainer table
INSERT INTO Trainer
 (TrainerID, FirstName, LastName, Specialization, ContactNumber, Email)
 VALUES
(1, 'Asad', 'Javed', 'Yoga', '03211234567', 'asad.javed@example.com'),
(2, 'Hassan', 'Mirza', 'Weightlifting', '03213344556', 'hassan.mirza@example.com'),
(3, 'Fatima', 'Nawaz', 'Cardio', '03214455667', 'fatima.nawaz@example.com'),
(4, 'Naveed', 'Qureshi', 'Crossfit', '03215566778', 'naveed.qureshi@example.com'),
(5, 'Sadia', 'Yousaf', 'Bodybuilding', '03216677889', 'sadia.yousaf@example.com'),
(6, 'Adeel', 'Haq', 'Pilates', '03217788990', 'adeel.haq@example.com'),
(7, 'Rabia', 'Aslam', 'Martial Arts', '03218899001', 'rabia.aslam@example.com'),
(8, 'Ali', 'Butt', 'HIIT', '03219900112', 'ali.butt@example.com'),
(9, 'Mariam', 'Hassan', 'Spinning', '03220011223', 'mariam.hassan@example.com'),
(10, 'Shahid', 'Ansari', 'Zumba', '03221122334', 'shahid.ansari@example.com');

-- Insert data into Class table
INSERT INTO Class
 (ClassID, ClassName, Schedule, Duration, TrainerID) 
 VALUES
(1, 'Morning Yoga', '2024-06-15 07:00:00', 60, 1),
(2, 'Weightlifting Basics', '2024-06-15 09:00:00', 90, 2),
(3, 'Cardio Blast', '2024-06-15 11:00:00', 45, 3),
(4, 'Crossfit Challenge', '2024-06-15 13:00:00', 60, 4),
(5, 'Bodybuilding 101', '2024-06-15 15:00:00', 90, 5),
(6, 'Pilates for Beginners', '2024-06-15 17:00:00', 60, 6),
(7, 'Martial Arts Training', '2024-06-15 19:00:00', 75, 7),
(8, 'HIIT Session', '2024-06-15 21:00:00', 30, 8),
(9, 'Spinning Class', '2024-06-16 07:00:00', 45, 9),
(10, 'Evening Zumba', '2024-06-16 09:00:00', 60, 10);

-- Insert data into Equipment table
INSERT INTO Equipment
 (EquipmentID, EquipmentName, Quantity, Conditions, MaintenanceSchedule, SupplierID) 
 VALUES
(1, 'Treadmill', 10, 'Good', '2024-07-01', 1),
(2, 'Dumbbell Set', 20, 'Excellent', '2024-08-01', 2),
(3, 'Bench Press', 5, 'Good', '2024-09-01', 3),
(4, 'Yoga Mats', 30, 'Fair', '2024-10-01', 4),
(5, 'Stationary Bike', 15, 'Good', '2024-11-01', 5),
(6, 'Rowing Machine', 8, 'Excellent', '2024-12-01', 6),
(7, 'Elliptical Trainer', 12, 'Good', '2024-07-01', 7),
(8, 'Kettlebells', 25, 'Good', '2024-08-01', 8),
(9, 'Resistance Bands', 50, 'Good', '2024-09-01', 9),
(10, 'Pull-up Bar', 5, 'Excellent', '2024-10-01', 10);


-- Insert data into Attendance table
INSERT INTO Attendance 
(AttendanceID, MemberID, ClassID, AttendanceDate) 
VALUES
(1, 1, 1, '2024-06-15'),
(2, 2, 2, '2024-06-15'),
(3, 3, 3, '2024-06-15'),
(4, 4, 4, '2024-06-15'),
(5, 5, 5, '2024-06-15'),
(6, 6, 6, '2024-06-15'),
(7, 7, 7, '2024-06-15'),
(8, 8, 8, '2024-06-15'),
(9, 9, 9, '2024-06-15'),
(10, 10, 10, '2024-06-15');

-- Insert data into Payment table
INSERT INTO Payment 
(PaymentID, MemberID, Amount, PaymentDate, PaymentMethod)
 VALUES
(1, 1, 300.00, '2024-01-01', 'Credit Card'),
(2, 2, 500.00, '2024-01-01', 'Debit Card'),
(3, 3, 200.00, '2024-01-01', 'Cash'),
(4, 4, 250.00, '2024-01-01', 'Credit Card'),
(5, 5, 600.00, '2024-01-01', 'Debit Card'),
(6, 6, 700.00, '2024-01-01', 'Cash'),
(7, 7, 150.00, '2024-01-01', 'Credit Card'),
(8, 8, 180.00, '2024-01-01', 'Debit Card'),
(9, 9, 50.00, '2024-01-01', 'Cash'),
(10, 10, 1000.00, '2024-01-01', 'Credit Card');

-- Insert data into Supplier table
INSERT INTO Supplier 
(SupplierID, SupplierName, ContactNumber, Supplies)
 VALUES
(11, 'FitnesGear', '03101234567', 'Treadmills'),
(12, 'IronWorks', '03107654321', 'Dumbbells'),
(13, 'BenchMasters', '03105554443', 'Benches'),
(14, 'YogaEssentials', '03102233445', 'Mats'),
(15, 'BikePro', '03106677889', 'Bikes'),
(16, 'RowingExperts', '03109988777', 'Rowers'),
(17, 'EllipticalWorld', '03100011223', 'Ellipticals'),
(18, 'KettleKing', '03103332211', 'Kettlebells'),
(19, 'ResistancePlus', '03104445566', 'Bands'),
(20, 'PullUpPros', '03107776555', 'Pull-up Bars');

-- Insert data into Staff table
INSERT INTO Staff
 (StaffID, FirstName, LastName, Role, ContactNumber, Email) 
 VALUES
(1, 'Naveed', 'Akhtar', 'Manager', '03451234567', 'naveed.akhtar@example.com'),
(2, 'Amina', 'Bashir', 'Receptionist', '03457654321', 'amina.bashir@example.com'),
(3, 'Kamran', 'Rafiq', 'Cleaner', '03453344556', 'kamran.rafiq@example.com'),
(4, 'Sadia', 'Iqbal', 'Trainer', '03454455667', 'sadia.iqbal@example.com'),
(5, 'Hassan', 'Sheikh', 'Accountant', '03455566778', 'hassan.sheikh@example.com'),
(6, 'Rabia', 'Naz', 'Receptionist', '03456677889', 'rabia.naz@example.com'),
(7, 'Bilal', 'Saeed', 'Security', '03457788990', 'bilal.saeed@example.com'),
(8, 'Tariq', 'Mehmood', 'Maintenance', '03458899001', 'tariq.mehmood@example.com'),
(9, 'Sara', 'Khan', 'Trainer', '03459900112', 'sara.khan@example.com'),
(10, 'Usman', 'Ali', 'Cleaner', '03451122334', 'usman.ali@example.com');

-- Insert data into Feedback table
INSERT INTO Feedback 
(FeedbackID, MemberID, TrainerID, ClassID, Rating, Comments) 
VALUES
(1, 1, 1, 1, 5, 'Great class!'),
(2, 2, 2, 2, 4, 'Good workout.'),
(3, 3, 3, 3, 3, 'Average session.'),
(4, 4, 4, 4, 5, 'Loved the intensity.'),
(5, 5, 5, 5, 4, 'Very informative.'),
(6, 6, 6, 6, 5, 'Excellent trainer.'),
(7, 7, 7, 7, 3, 'Could be better.'),
(8, 8, 8, 8, 4, 'Good pace.'),
(9, 9, 9, 9, 5, 'Fantastic class!'),
(10, 10, 10, 10, 4, 'Really enjoyed it.');

-- ___________________________________________________DDL COMMANDS_______________________________

-- _______ADD column in member table + DML
ALTER TABLE Member
ADD JoinDate DATE;
SELECT * FROM member;

-- _______Drop feedback table table + DML
DROP TABLE Feedback;
SELECT * FROM Feedback;

-- _______ADD column in Trainer table  + DML
ALTER TABLE Trainer
ADD Location VARCHAR(100);
SELECT * FROM Trainer;

-- _______Drop column in Equipment table + DML
ALTER TABLE Equipment
DROP COLUMN Conditions;
SELECT * FROM Equipment;

-- _______Change name supplier to Vendor + DML
ALTER TABLE Supplier 
RENAME TO Vendor;
SELECT * FROM Vendor;

-- _______ADD column in Payment table + DML
ALTER TABLE Payment
ADD FeePai BOOLEAN;
SELECT * FROM Payment;

-- _______Change name of a table + DML
ALTER TABLE Staff 
RENAME TO Employees;
SELECT * FROM Employees;

-- _______Drop a colomn in membership table + DML
Alter table membership
Drop column Price;
SELECT * FROM membership;

