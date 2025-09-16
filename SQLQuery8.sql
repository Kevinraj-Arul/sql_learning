CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);
INSERT INTO Appointments VALUES
(401, 101, 203, '2025-09-01', 'Completed'),
(402, 102, 202, '2025-09-02', 'Completed'),  
(403, 103, 203, '2025-09-05', 'Scheduled'),  
(404, 104, 201, '2025-09-06', 'Cancelled'),
(405, 105, 203, '2025-09-07', 'Scheduled'), 
(406, 106, 202, '2025-09-08', 'Completed'); 
/*Find patients who have scheduled (not completed) appointments*/
SELECT Name
FROM Patients
WHERE Patient_ID IN (
    SELECT Patient_ID FROM Appointments WHERE Status = 'Scheduled'
);
/*Find doctors who had more than 1 completed appointment*/
SELECT Name, Specialization
FROM Doctors
WHERE Doctor_ID IN (
    SELECT Doctor_ID
    FROM Appointments
    WHERE Status = 'Completed'
    GROUP BY Doctor_ID
    HAVING COUNT(*) > 1
);
/*Find doctors who have at least one cancelled appointment (using EXISTS).*/
SELECT Name, Specialization
FROM Doctors d
WHERE EXISTS (
    SELECT 1 FROM Appointments a
    WHERE a.Doctor_ID = d.Doctor_ID AND a.Status = 'Cancelled'
);

