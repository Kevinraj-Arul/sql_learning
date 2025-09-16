CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Disease VARCHAR(50),
    BillAmount DECIMAL(10,2)
);

INSERT INTO Patients VALUES
(101, 'Alice', 30, 'F', 'Diabetes', 5000),
(102, 'Bob', 45, 'M', 'Cancer', 15000),
(103, 'Charlie', 28, 'M', 'Fever', 2000),
(104, 'Diana', 60, 'F', 'Heart Disease', 25000),
(105, 'Ethan', 35, 'M', 'Diabetes', 8000),
(106, 'Fiona', 50, 'F', 'Cancer', 12000);


CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(50)
);

INSERT INTO Doctors VALUES
(201, 'Dr. Smith', 'Cardiologist'),
(202, 'Dr. John', 'Oncologist'),
(203, 'Dr. Emma', 'General Physician');
/*Create a procedure to fetch all patients*/
create  procedure GetAllPatients
as begin select * from Patients;
end;
exec GetAllPatients;
/*Create a procedure with input parameter (get patient by ID).*/
create procedure getpatient_id
@patientId int
as begin select *from Patients where Patient_ID=@patientId
end;
exec getpatient_id @patientId = 102;

/*Create a procedure with multiple parameters (filter by disease and min age).*/
create procedure filter_disease
@diseases varchar(50),
@minage int
as begin select Name,Age,Disease,BillAmount from Patients where Disease =@diseases and age >=@minage;
end;
EXEC filter_disease @diseases = 'Cancer', @minage = 40;
/*Create a procedure with OUTPUT parameter (get total bill of all patients).*/
CREATE PROCEDURE GetTotalBill
    @Total DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @Total = SUM(BillAmount) FROM Patients;
END;

DECLARE @TotalBill DECIMAL(10,2);
EXEC GetTotalBill @Total = @TotalBill OUTPUT;
PRINT 'Total Bill Amount: ' + CAST(@TotalBill AS VARCHAR);
/*Create a procedure with UPDATE statement (update bill amount)*/
CREATE PROCEDURE UpdateBill
    @PatientID INT,
    @NewBill DECIMAL(10,2)
AS
BEGIN
    UPDATE Patients
    SET BillAmount = @NewBill
    WHERE Patient_ID = @PatientID;
END;


EXEC UpdateBill Patient_ID@PatientID = 103, BillAmount@NewBill = 3000;

