CREATE DATABASE PAYROLLS

--USER Table

--(from ER: USER ? UserID, UserName, Password, Role)
CREATE TABLE userss (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    role VARCHAR(30) NOT NULL
);

INSERT INTO userss 
(user_id, user_name, password, role)
VALUES
(1, 'manager1', 'melat123', 'Manager'),
(2, 'accountant1', 'Abel22', 'Accountant'),
(3, 'chef1', 'Sara', 'chef'),
(4, 'admin', 'Daniel12', 'Admin'),
(5, 'Assistant2', 'Ruth', 'Assistant chef'),
(6, 'receptionist1', 'Lily34', 'receptionist'),
(7, 'waiter1', 'samuel42', 'Waiter'),
(8, 'waiter2', 'mulu83', 'Waiter'),
(9, 'waiter3', 'yonatan42', 'Waiter'),
(10, 'waiter4', 'bethel25', 'Waiter'),
(11, 'waiter5', 'dawit74', 'Waiter'),
(12, 'waiter6', 'hana56', 'Waiter'),
(13, 'waiter7', 'michael28', 'Waiter'),
(14, 'waiter8', 'selam89', 'Waiter'),
(15, 'waiter9', 'kebede34', 'Waiter');

SELECT*FROM USERSS

CREATE TABLE Employess (
    Employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_position VARCHAR(50),
    base_salary DECIMAL(12,2) NOT NULL,
  );

INSERT INTO Employess
(Employee_id, first_name, last_name, job_position, base_salary) VALUES
(1, 'Melat', 'Eshetu', 'Manager', 10000.00), 
(2, 'Abel', 'Tadesse', 'Accountant', 6000.00), 
(3, 'Sara', 'Mekonnen', 'chef', 7000.00), 
(4, 'Daniel', 'Bekele', 'System Admin', 9000.00), 
(5, 'Ruth', 'Kebede', 'Asistant chef', 4500.00),
(6, 'Samuel', 'Girma', 'Waiter', 2000.00),
(7, 'Lily', 'Tesfaye', 'Receptionist', 2500.00),
(8, 'Mulu', 'Assefa', 'Waiter', 2000.00),
(9, 'Yonatan', 'Hailu', 'Waiter', 2000.00),
(10, 'Bethel', 'Solomon', 'Waiter', 2000.00), 
(11, 'Dawit', 'Abraham', 'Waiter', 2000.00), 
(12, 'Hanna', 'Getachew', 'Waiter', 2000.00), 
(13,  'Michael', 'Wondimu', 'Waiter', 2000.00),
(14, 'Selam', 'Kassa', 'Waiter', 2000.00),
(15, 'Kebede', 'Fikru', 'Waiter', 2000.00);

SELECT*FROM Employess

select * from Employess where first_name LIKE 'N%' ;

select * from Employess where first_name LIKE 's%';

Select first_name, Employee_id from Employess where base_salary between 4000 and 7000;
select * from Employess where base_salary < all
(select Employee_id from Employess where base_salary >=4000);
select * from Employess where base_salary >any
(select job_position from Employess where base_salary > 4000);

CREATE TABLE attendanceS (
    attendance_ID INT IDENTITY (1,5) not null,
    employee_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status char NOT NULL
    );
    
  INSERT INTO Attendances (employee_id ,attendance_date , status) VALUES

(1, '2025-01-01', 'P'),
(2, '2025-01-01', 'L'),
(3,'2025-01-01', 'A'),
(4, '2025-01-01', 'P'),
(5, '2025-01-01', 'L'),
(6, '2025-01-01', 'P'),
(7, '2025-01-01', 'A'),
(8, '2025-01-01', 'P'),
(9, '2025-01-01', 'P'),
(10, '2025-01-01', 'L'),
(11, '2025-01-01', 'A'),
(12, '2025-01-01', 'L'),
(13, '2025-01-01', 'P'),
(14, '2025-01-01', 'P'),
(15, '2025-01-01', 'A');


SELECT * FROM Attendances

CREATE TABLE payrolls (
    payroll_id INT identity (3,3) PRIMARY KEY not null,
    employee_id int not null,
    overtime_hours INT ,
    total_salary DECIMAL(12,2) NOT NULL,
    payroll_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employess(employee_id)
    );

    SELECT*FROM payrolls

INSERT INTO payrolls 
(employee_id, overtime_hours, total_salary, payroll_date)
VALUES
(1, 10, 12000.00, '2025-01-31'),   -- Manager
(2, 5, 6500.00,  '2025-01-31'),   -- Accountant
(3, 8, 7800.00,  '2025-01-31'),   -- Chef
(4, 6, 9600.00,  '2025-01-31'),   -- System Admin
(5, 4, 4800.00,  '2025-01-31'),   -- Assistant Chef
(6, 2, 2200.00,  '2025-01-31'),   -- Waiter
(7, 3, 2800.00,  '2025-01-31'),   -- Receptionist
(8, 2, 2200.00,  '2025-01-31'),   -- Waiter
(9, 2, 2200.00,  '2025-01-31'),   -- Waiter
(10, 1, 2100.00, '2025-01-31'),   -- Waiter
(11, 1, 2100.00, '2025-01-31'),   -- Waiter
(12, 1, 2100.00, '2025-01-31'),   -- Waiter
(13, 2, 2200.00, '2025-01-31'),   -- Waiter
(14, 2, 2200.00, '2025-01-31'),   -- Waiter
(15, 1, 2100.00, '2025-01-31');   -- Waiter

select * FROM payrollS P left outer join Employess e on p.employee_id=e.employee_id;
select * FROM payrollS P RIGHT outer join Employess e on p.employee_id=e.employee_id;
select * FROM payrollS ,Employess SELECT* FROM payrollS p full outer join Employess e on p.employee_id=e.employee_id;
select * from payrollS 

select employee_id FROM Employess except select employee_id FROM payrollS
select employee_id FROM payrollS intersect
select employee_id FROM Employess
select employee_id FROM payrollS union select employee_id FROM employess;
select employee_id FROM payrollS union all select employee_id FROM employess;
select employee_id, payroll_id FROM payrollS UNION SELECT employee_id ,first_name,last_name from employess;

SELECT * FROM Employess order by first_name
SELECT * FROM Employess order by first_name,job_position
SELECT * FROM Employess order by first_name,employee_id,job_position
SELECT first_name ,sum (base_salary) from employess group by first_name;
select first_name ,job_position,sum (base_salary) from Employess GROUP BY employee_id,job_position,first_name;
select first_name,sum (base_salary) FROM Employess group by first_name having sum (base_salary)>=4500

-- ALLOWANCE & DEDUCTION Table

--(Payroll ? AllowanceDeduction = 1 : Many)

CREATE TABLE allowanceDeduction (
    allowance_deduction_id INT PRIMARY KEY ,
    payroll_id INT NOT NULL,
    type varchar NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (payroll_id) REFERENCES payrollS(payroll_id)
);
SELECT * FROM allowanceDeduction

INSERT INTO AllowanceDeduction
(allowance_deduction_id, payroll_id,type, amount)
VALUES
(1, 3, 'Allowance', 1000.00),
(2,6,'Allowance', 800.00),
(3, 9, 'Allowance', 700.00),
(4,12,'Allowance', 900.00),
(5,15, 'Allowance', 600.00),
(6, 18 ,'Dduction', 200.00),
(7, 21,'Dduction', 150.00),
(8,24,  'Dduction', 180.00),
(9, 27,'Dduction', 220.00),
(10,30,'Dduction', 100.00),
(11,33, 'Allowance', 500.00),
(12,36,'Dduction', 120.00),
(13,39,'Allowance', 400.00),
(14,42,'Deduction', 90.00),
(15, 45,'Allowance', 300.00);

-- FEEDBACK Table

--(Employee ? Feedback = 1 : Many)

CREATE TABLE feedbackS (
    feedback_id INT IDENTITY(2,2) PRIMARY KEY NOT NULL,
    employee_id INT NOT NULL,
    feedback_text TEXT NOT NULL,
    response TEXT,
    feedback_date DATE NOT NULL
     FOREIGN KEY (employee_id) REFERENCES Employess(employee_id)
 );
 INSERT INTO feedbacks (employee_id, feedback_text, response, feedback_date)
VALUES
(1, 'System login is slow during peak hours', 'We are optimizing server performance', '2025-01-05'),
(2, 'Payslip format is clear and understandable', 'Thank you for your feedback', '2025-01-06'),
(3, 'Overtime calculation seems incorrect', 'Issue forwarded to payroll team', '2025-01-06'),
(4, 'Would like email notification for salary credit', 'Feature planned for next update', '2025-01-07'),
(5, 'Dashboard UI looks good', NULL, '2025-01-07'),
(6, 'Tax deduction needs clearer explanation', 'Tax breakdown will be added', '2025-01-08'),
(7, 'Salary credited late this month', 'Delay due to bank issue', '2025-01-08'),
(8, 'System is user friendly', 'Glad you like it', '2025-01-09'),
(9, 'Need option to download payslip as PDF', 'PDF option coming soon', '2025-01-09'),
(10, 'Profile update page throws error sometimes', 'Bug fixed in latest patch', '2025-01-10'),
(11, 'Attendance records are accurate', NULL, '2025-01-10'),
(12, 'Bonus calculation was delayed', 'Apologies, process improved', '2025-01-11'),
(13, 'Mobile view needs improvement', 'Mobile UI update in progress', '2025-01-11'),
(14, 'Salary components explanation is helpful', 'Thank you for your feedback', '2025-01-12'),
(15, 'Request dark mode feature', 'Feature request noted', '2025-01-12');
 
 SELECT*FROM feedbacks
 -- REPORT Table

--(Employee ? Report = 1 : Many)

CREATE TABLE report (
    report_id INT PRIMARY KEY ,
    employee_id INT NOT NULL,
    report_type VARCHAR(50),
    report_date DATE NOT NULL
      
);

INSERT INTO report (report_id, employee_id, report_type, report_date)
VALUES
(101, 1, 'Monthly Attendance', '2025-01-07'),
(102, 2, 'Overtime Report', '2025-01-15'),
(103, 3, 'Leave Summary', '2025-01-08'),
(104, 4, 'Salary Report', '2025-01-04'),
(105, 5, 'Tax Report', '2025-01-05'),
(106, 6, 'Bonus Report', '2025-01-06'),
(107, 7, 'Performance Report', '2025-01-01'),
(108, 8, 'Monthly Attendance', '2025-01-03'),
(109, 9, 'Overtime Report', '2025-01-09'),
(010, 10, 'Leave Summary', '2025-01-10'),
(011, 11, 'Salary Report', '2025-01-11'),
(012, 12, 'Tax Report', '2025-01-12'),
(013, 13, 'Bonus Report', '2025-01-13'),
(014,14, 'Performance Report', '2025-01-14'),
(015, 15, 'Monthly Attendance', '2025-01-02');



