CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Disease VARCHAR(50),
    BillAmount DECIMAL(10,2)
);
INSERT INTO Patients (Patient_ID, Name, Age , Gender,Disease,BillAmount)
VALUES
(101, 'Alice', 30, 'F', 'Diabetes', 5000),
(102, 'Bob', 45, 'M', 'Cancer', 15000),
(103, 'Charlie', 28, 'M', 'Fever', 2000),
(104, 'Diana', 60, 'F', 'Heart Disease', 25000),
(105, 'Ethan', 35, 'M', 'Diabetes', 8000),
(106, 'Fiona', 50, 'F', 'Cancer', 12000);
/*Increase each patient’s bill by 10%.*/
select Name,BillAmount ,BillAmount *1.10 as updated_bill from Patients;
/*Find patients whose bill is greater than 10000.*/
select Name,BillAmount as higher_billamount  from patients where BillAmount > 10000;
/*Find patients who are female AND above 40 years*/
select Name,Gender,Age as new_entry from Patients where Gender = 'f' and age>=40;
/*: Find patients whose bill is between 5000 and 20000.*/
select Name,BillAmount from Patients where BillAmount between 5000 and 20000;
/*Find patients who have Diabetes or Fever.*/
select Name,Disease from Patients where Disease in ('Diabetes','Fever');
/*Find patients whose name starts with 'A'*/
select Name as First_letter from Patients where name like 'A%';
/*(Suppose some patients don’t have a disease recorded)*/
select Name from Patients where Disease is  null;
