CREATE TABLE Medications (
    Med_ID INT PRIMARY KEY,
    Med_Name VARCHAR(50),
    Patient_ID INT,
    Dose VARCHAR(20),
    Cost DECIMAL(10,2),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Medications VALUES
(301, 'Metformin', 101, '500mg', 200),
(302, 'Insulin', 101, '20 units', 1500),
(303, 'ChemoDrug-A', 102, '50mg', 8000),
(304, 'Paracetamol', 103, '500mg', 100),
(305, 'HeartMed-X', 104, '10mg', 5000),
(306, 'ChemoDrug-B', 106, '100mg', 6000);

/*imple View → Display Medication name, dose, and cost only*/
create view summary as select Med_name,Dose,Cost from Medications ;
select * from summary;
/*Conditional View → Medications with cost greater than 2000*/
create view expensives as select Med_ID,Med_Name,Cost from Medications where cost >2000;
select * from expensives;

/*Join View → Patients and their prescribed medications*/
CREATE VIEW PatientMedications AS
SELECT p.Name AS PatientName, m.Med_Name, m.Dose, m.Cost
FROM Patients p
JOIN Medications m ON p.Patient_ID = m.Patient_ID;

SELECT * FROM PatientMedications;
/*Aggregate View → Total medication cost per patient.*/
CREATE VIEW TotalMedCostPerPatient AS
SELECT p.Name AS PatientName, SUM(m.Cost) AS TotalMedCost
FROM Patients p
JOIN Medications m ON p.Patient_ID = m.Patient_ID
GROUP BY p.Name;

SELECT * FROM TotalMedCostPerPatient;
