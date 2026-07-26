CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Manager_Name VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'Software Development', 'Raj Mehta', 'Pune'),
(2, 'Artificial Intelligence', 'Sneha Kulkarni', 'Bangalore'),
(3, 'Cyber Security', 'Amit Sharma', 'Hyderabad'),
(4, 'Testing', 'Priya Patil', 'Pune'),
(5, 'Human Resources', 'Neha Joshi', 'Mumbai');
SELECT * FROM Departments;
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Job_Role VARCHAR(50),
    Joining_Date DATE,
    Department_ID INT,
    Salary DECIMAL(10,2),

    FOREIGN KEY (Department_ID)
    REFERENCES Departments(Department_ID)
);
INSERT INTO Employees VALUES
(101,'Rahul','Sharma','rahul.sharma@company.com','9876543210','Software Engineer','2023-01-15',1,650000),
(102,'Priya','Patil','priya.patil@company.com','9876543211','QA Engineer','2022-07-20',4,550000),
(103,'Amit','Joshi','amit.joshi@company.com','9876543212','Security Analyst','2021-03-12',3,600000),
(104,'Sneha','Kulkarni','sneha.kulkarni@company.com','9876543213','AI Engineer','2024-02-10',2,750000),
(105,'Rohan','Deshmukh','rohan.deshmukh@company.com','9876543214','Support Engineer','2023-09-18',1,500000);
SELECT * FROM Employees;
CREATE TABLE IT_Assets (
    Asset_ID INT PRIMARY KEY,
    Asset_Type VARCHAR(50),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Purchase_Date DATE,
    Asset_Status VARCHAR(30),
    Asset_Value DECIMAL(10,2)
);
INSERT INTO IT_Assets VALUES
(201,'Laptop','Dell','Latitude 5420','2022-05-10','Assigned',65000),
(202,'Laptop','HP','EliteBook 840','2023-01-15','Assigned',70000),
(203,'Desktop','Lenovo','ThinkCentre M90','2021-08-20','Maintenance',55000),
(204,'Monitor','Samsung','24 Inch LED','2022-11-05','Assigned',15000),
(205,'Laptop','Apple','MacBook Pro','2024-03-12','Available',120000),
(206,'Server','Dell','PowerEdge R740','2020-06-18','Maintenance',300000);
SELECT * FROM IT_Assets;
CREATE TABLE Asset_Assignment (
    Assignment_ID INT PRIMARY KEY,
    Employee_ID INT,
    Asset_ID INT,
    Assignment_Date DATE,
    Return_Date DATE,
    Assignment_Status VARCHAR(30),

    FOREIGN KEY (Employee_ID)
    REFERENCES Employees(Employee_ID),

    FOREIGN KEY (Asset_ID)
    REFERENCES IT_Assets(Asset_ID)
);
INSERT INTO Asset_Assignment VALUES
(301,101,201,'2023-02-01',NULL,'Active'),
(302,102,202,'2022-08-01',NULL,'Active'),
(303,104,205,'2024-03-20',NULL,'Active'),
(304,105,204,'2023-10-01',NULL,'Active'),
(305,103,203,'2021-09-15','2024-01-10','Returned');
SELECT * FROM Asset_Assignment;
CREATE TABLE Maintenance_Record (
    Maintenance_ID INT PRIMARY KEY,
    Asset_ID INT,
    Issue_Description VARCHAR(100),
    Repair_Date DATE,
    Repair_Cost DECIMAL(10,2),
    Technician_Name VARCHAR(50),
    Maintenance_Status VARCHAR(30),

    FOREIGN KEY (Asset_ID)
    REFERENCES IT_Assets(Asset_ID)
);
INSERT INTO Maintenance_Record VALUES
(401,201,'Battery replacement','2024-01-15',5000,'Vijay Kumar','Completed'),
(402,203,'Hard disk failure','2023-12-10',12000,'Arun Patil','Completed'),
(403,206,'Server overheating issue','2024-02-20',25000,'Karan Shah','Completed'),
(404,201,'Keyboard issue','2024-06-05',3000,'Vijay Kumar','Completed'),
(405,203,'System performance issue','2024-05-18',8000,'Arun Patil','Completed');
SELECT * FROM Maintenance_Record;
CREATE TABLE Software_License (
    License_ID INT PRIMARY KEY,
    Software_Name VARCHAR(50),
    Vendor_Name VARCHAR(50),
    License_Type VARCHAR(30),
    Total_Licenses INT,
    Used_Licenses INT,
    Purchase_Date DATE,
    Expiry_Date DATE,
    License_Cost DECIMAL(10,2)
);
INSERT INTO Software_License VALUES
(501,'Microsoft Office 365','Microsoft','Enterprise',100,85,'2024-01-10','2025-01-10',800000),
(502,'Windows 11 Pro','Microsoft','Enterprise',150,120,'2023-06-15','2026-06-15',1200000),
(503,'AutoCAD','Autodesk','Professional',20,18,'2024-03-20','2025-03-20',500000),
(504,'GitHub Enterprise','GitHub','Enterprise',50,35,'2024-02-01','2025-02-01',300000),
(505,'Antivirus Software','QuickHeal','Enterprise',200,160,'2024-05-12','2026-05-12',400000);
SELECT * FROM Software_License;
CREATE TABLE Support_Tickets (
    Ticket_ID INT PRIMARY KEY,
    Employee_ID INT,
    Asset_ID INT,
    Issue_Type VARCHAR(50),
    Issue_Description VARCHAR(100),
    Created_Date DATE,
    Resolved_Date DATE,
    Ticket_Status VARCHAR(30),

    FOREIGN KEY (Employee_ID)
    REFERENCES Employees(Employee_ID),

    FOREIGN KEY (Asset_ID)
    REFERENCES IT_Assets(Asset_ID)
);
INSERT INTO Support_Tickets VALUES
(601,101,201,'Hardware','Laptop battery problem','2024-06-01','2024-06-03','Resolved'),
(602,102,202,'Software','Application installation issue','2024-06-05','2024-06-06','Resolved'),
(603,104,205,'Network','VPN connectivity issue','2024-06-10',NULL,'Open'),
(604,105,204,'Hardware','Monitor display issue','2024-06-12','2024-06-13','Resolved'),
(605,103,203,'Hardware','Desktop performance issue','2024-06-15',NULL,'Pending');
SELECT * FROM Support_Tickets;
SELECT 
    Employees.Employee_ID,
    Employees.First_Name,
    Employees.Last_Name,
    Employees.Job_Role,
    Departments.Department_Name
FROM Employees
JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;
SELECT
    Asset_Assignment.Assignment_ID,
    Employees.First_Name,
    Employees.Last_Name,
    IT_Assets.Asset_Type,
    IT_Assets.Brand,
    IT_Assets.Model
FROM Asset_Assignment
JOIN Employees
ON Asset_Assignment.Employee_ID = Employees.Employee_ID
JOIN IT_Assets
ON Asset_Assignment.Asset_ID = IT_Assets.Asset_ID
WHERE Asset_Assignment.Assignment_Status = 'Active';
SELECT
    IT_Assets.Asset_ID,
    IT_Assets.Asset_Type,
    IT_Assets.Brand,
    COUNT(Maintenance_Record.Maintenance_ID) AS Total_Repairs,
    SUM(Maintenance_Record.Repair_Cost) AS Total_Maintenance_Cost
FROM IT_Assets
JOIN Maintenance_Record
ON IT_Assets.Asset_ID = Maintenance_Record.Asset_ID
GROUP BY
    IT_Assets.Asset_ID,
    IT_Assets.Asset_Type,
    IT_Assets.Brand
ORDER BY Total_Maintenance_Cost DESC;
SELECT
    Software_Name,
    Total_Licenses,
    Used_Licenses,
    (Total_Licenses - Used_Licenses) AS Available_Licenses
FROM Software_License
ORDER BY Available_Licenses DESC;
SELECT
    Departments.Department_Name,
    COUNT(IT_Assets.Asset_ID) AS Total_Assets,
    SUM(IT_Assets.Asset_Value) AS Total_Asset_Value
FROM Departments
JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
JOIN Asset_Assignment
ON Employees.Employee_ID = Asset_Assignment.Employee_ID
JOIN IT_Assets
ON Asset_Assignment.Asset_ID = IT_Assets.Asset_ID
GROUP BY Departments.Department_Name
ORDER BY Total_Asset_Value DESC;
SELECT
    Support_Tickets.Ticket_ID,
    Employees.First_Name,
    Employees.Last_Name,
    IT_Assets.Asset_Type,
    Support_Tickets.Issue_Type,
    Support_Tickets.Issue_Description,
    Support_Tickets.Ticket_Status
FROM Support_Tickets
JOIN Employees
ON Support_Tickets.Employee_ID = Employees.Employee_ID
JOIN IT_Assets
ON Support_Tickets.Asset_ID = IT_Assets.Asset_ID
WHERE Support_Tickets.Ticket_Status != 'Resolved';
CREATE VIEW Active_Asset_Report AS
SELECT
    Employees.Employee_ID,
    Employees.First_Name,
    Employees.Last_Name,
    IT_Assets.Asset_Type,
    IT_Assets.Brand,
    IT_Assets.Model
FROM Employees
JOIN Asset_Assignment
ON Employees.Employee_ID = Asset_Assignment.Employee_ID
JOIN IT_Assets
ON Asset_Assignment.Asset_ID = IT_Assets.Asset_ID
WHERE Asset_Assignment.Assignment_Status = 'Active';
SELECT * FROM Active_Asset_Report;
DELIMITER //

CREATE PROCEDURE GetEmployeeAssets(IN emp_id INT)

BEGIN

SELECT
    Employees.Employee_ID,
    Employees.First_Name,
    Employees.Last_Name,
    IT_Assets.Asset_Type,
    IT_Assets.Brand,
    IT_Assets.Model,
    Asset_Assignment.Assignment_Status

FROM Employees

JOIN Asset_Assignment
ON Employees.Employee_ID = Asset_Assignment.Employee_ID

JOIN IT_Assets
ON Asset_Assignment.Asset_ID = IT_Assets.Asset_ID

WHERE Employees.Employee_ID = emp_id;

END //

DELIMITER ;
CALL GetEmployeeAssets(101);
CREATE TABLE Maintenance_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Asset_ID INT,
    Action_Message VARCHAR(100),
    Action_Date DATE
);
DELIMITER //

CREATE TRIGGER Asset_Maintenance_Alert
AFTER UPDATE ON IT_Assets

FOR EACH ROW

BEGIN

IF NEW.Asset_Status = 'Maintenance'
AND OLD.Asset_Status <> 'Maintenance'

THEN

INSERT INTO Maintenance_Log
(Asset_ID, Action_Message, Action_Date)

VALUES
(NEW.Asset_ID,
'Asset moved to maintenance status',
CURDATE());

END IF;

END //

DELIMITER ;
UPDATE IT_Assets
SET Asset_Status = 'Maintenance'
WHERE Asset_ID = 205;
SELECT * FROM Maintenance_Log;
SELECT 
Asset_Status,
COUNT(*) AS Total_Assets
FROM IT_Assets
GROUP BY Asset_Status;
SELECT
IT_Assets.Brand,
IT_Assets.Model,
SUM(Maintenance_Record.Repair_Cost) AS Total_Cost
FROM IT_Assets
JOIN Maintenance_Record
ON IT_Assets.Asset_ID = Maintenance_Record.Asset_ID
GROUP BY
IT_Assets.Brand,
IT_Assets.Model
ORDER BY Total_Cost DESC;
SELECT
Departments.Department_Name,
COUNT(Asset_Assignment.Asset_ID) AS Total_Assets
FROM Departments
JOIN Employees
ON Departments.Department_ID = Employees.Department_ID
JOIN Asset_Assignment
ON Employees.Employee_ID = Asset_Assignment.Employee_ID
GROUP BY Departments.Department_Name;
SELECT
Software_Name,
Total_Licenses,
Used_Licenses,
(Total_Licenses - Used_Licenses) AS Available_Licenses
FROM Software_License;
SELECT
Ticket_Status,
COUNT(*) AS Total_Tickets
FROM Support_Tickets
GROUP BY Ticket_Status;
