# Constraints
#Primary key
#Create a Students table with a student_id column as PRIMARY KEY and name as NOT NULL.
create table students(
student_id int primary key,
name varchar(10) not null);

insert into Students values(1,'kevin'),(2,'raja');

select * from students;
---Create a Courses table where course_id is PRIMARY KEY, and course_name must be unique.---
drop table if exists course;
create table course(
    course_id int primary key,
    course_name varchar(19) unique,
    enrollment_id int,
    foreign key (enrollment_id) references enrollment(enrollment_id)
);
insert into course(course_id, course_name, enrollment_id)
values (1,'science',101),
       (2,'computer',102);
select * from course;
create table enrollment(
    enrollment_id int primary key,
    name varchar(15) unique
);
insert into enrollment values (101,'kevin'),
                              (102,'raja');
select *from enrollment;
select c.course_name ,e.name from course c inner join enrollment e on c.enrollment_id=e.enrollment_id 

CREATE TABLE Patients ( 
Patient_ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Age INT CHECK (Age > 0 AND Age < 120),
Gender CHAR(1), Phone VARCHAR(15) );

INSERT INTO Patients (Patient_ID, Name, Age, Gender, Phone)
VALUES 
(1, 'John Smith', 35, 'M', '9876543210'),
(2, 'Alice Johnson', 219, 'F', '9123456780'),
(3, 'David Miller', 50, 'M', '9988776655'),
(4, 'Sophia Brown', 45, 'F', '9090909090');

select * from Patients
