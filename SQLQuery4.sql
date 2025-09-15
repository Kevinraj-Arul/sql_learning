drop table  patients;
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0 AND Age < 120),
    Gender CHAR(1),
    Disease VARCHAR(50)
);
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT FOREIGN KEY REFERENCES Patients(Patient_ID),
    Amount DECIMAL(10,2),
    Bill_Date DATE
);
INSERT INTO Patients (Patient_ID, Name, Age, Gender, Disease)
VALUES
(1, 'Alice', 30, 'F', 'Diabetes'),
(2, 'Bob', 45, 'M', 'Hypertension'),
(3, 'Charlie', 29, 'M', 'Diabetes'),
(4, 'Diana', 50, 'F', 'Cancer'),
(5, 'Eva', 35, 'F', 'Hypertension'),
(6, 'Frank', 60, 'M', 'Cancer'),
(7, 'Grace', 25, 'F', 'Diabetes'),
(8, 'Henry', 40, 'M', 'Hypertension');

INSERT INTO Bills (Bill_ID, Patient_ID, Amount, Bill_Date)
VALUES
(101, 1, 5000, '2023-01-10'),
(102, 2, 7000, '2023-01-12'),
(103, 3, 3000, '2023-01-15'),
(104, 4, 9000, '2023-01-18'),
(105, 5, 4000, '2023-01-20'),
(106, 6, 8500, '2023-02-05'),
(107, 7, 2500, '2023-02-10'),
(108, 8, 6000, '2023-02-12');

select * from Patients;
select * from Bills;
select sum(Amount) as total_amount from Bills ;
#Find the average bill amount for patients who are older than 40
select avg(b.Amount) as billamount_age_40 from Bills B join Patients P  on B.Patient_ID=P.Patient_ID where P.Age>40;
select count(*) as Male_count from Patients where Gender= 'M'
select min (Amount) as min_bill_amout_jan2023 from Bills where month(Bill_Date)=1 and year(Bill_Date)=2023 

/*Find the maximum bill amount and sort the result by amount*/
SELECT TOP 1 Bill_ID, Amount FROM Bills ORDER BY Amount DESC;
/*Find the total bill amount per disease using GROUP BY.*/
SELECT P.Disease, SUM(B.Amount) AS Total_Bill
FROM Bills B
JOIN Patients P ON B.Patient_ID = P.Patient_ID
GROUP BY P.Disease;
/*Find the average age of patients per gender.*/
select Gender,avg(age)as ave_age from Patients group by Gender
/*Find the highest bill per patient.*/
select P.name ,max(B.amount)as max_amount from Bills b join Patients p on B.Patient_ID = P.Patient_ID group by P.name