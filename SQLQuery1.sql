create table patient(
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0 AND Age < 120),
    Phone VARCHAR(15) UNIQUE
);
create table doctor(
Doctor_ID INT primary key,
name varchar(100) not null,
specialization varchar(100) not null
);

alter table patient add email varchar(100);
alter table patient alter column phone varchar(20);
alter table patient drop column email;

insert into patient( Patient_ID,Name,age,phone)
values(1,'john smith',45,897767676),(2,'Raja',34,6767554323),
(3,'Ramu',24,7562878382)
insert into doctor(Doctor_ID,name,specialization)
values(101, 'Dr. Mehta', 'Cardiology'),
       (102, 'Dr. Sharma', 'Neurology');

select * from patient;
select * from doctor;
select Name , Age from patient where age <40;

update patient set phone =9996454334 where Patient_Id=1;
select * from patient;

