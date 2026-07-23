Create database LifeCareHospital;
use LifeCareHospital;


Create table Departments(
dept_id int Primary Key, 
dept_name varchar(50) UNIQUE,
floor_no varchar(50) NOT NULL);

Create table Doctors(
doctor_id int Primary key, 
doctor_name varchar(50), 
specialization varchar(50), 
salary float,  
dept_id int , 
experience int DEFAULT 0,
foreign key (dept_id) references Departments(dept_id));

create table Patients(
patient_id int primary key, 
patient_name varchar(50),
 age int , 
 gender char(6), 
 city varchar(50),
 admission_date Date DEFAULT (current_date()) );
 
 create table Appointments (appointment_id Int primary Key,
 patient_id int,
 doctor_id int,
appointment_date date,
consultation_fee float,
foreign key (patient_id) references Patients(patient_id),
foreign key (doctor_id) references Doctors(doctor_id)
);


create table Treatments(
treatment_id int  primary key,
 appointment_id int ,
treatment_name varchar(100),
 treatment_cost float,
 foreign key (appointment_id)  references  Appointments(appointment_id)
 );
 
 
 USE LifeCareHospital;

-- =========================
-- Departments (3)
-- =========================
INSERT INTO Departments (dept_id, dept_name, floor_no) VALUES
(1, 'Cardiology', '1st Floor'),
(2, 'Neurology', '2nd Floor'),
(3, 'Orthopedics', '3rd Floor'),
(4, 'General', '1st Floor'),
(5, 'path0logy', '4nd Floor');

-- =========================
-- Doctors (10)
-- =========================
INSERT INTO Doctors
(doctor_id, doctor_name, specialization, salary, dept_id, experience)
VALUES
(101, 'Dr. Ravi Kumar', 'Cardiologist', 120000, 1, 12),
(102, 'Dr. Sneha Rao', 'Cardiologist', 110000, 1, 8),
(103, 'Dr. Arjun Mehta', 'Cardiologist', 95000, 1, 5),
(104, 'Dr. Priya Sharma', 'Neurologist', 130000, 2, 15),
(105, 'Dr. Kiran Patel', 'Neurologist', 115000, 2, 9),
(106, 'Dr. Meena Joshi', 'Neurologist', 98000, 2, 6),
(107, 'Dr. Suresh Reddy', 'Orthopedic Surgeon', 125000, 3, 13),
(108, 'Dr. Nisha Singh', 'Orthopedic Surgeon', 105000, 3, 7),
(109, 'Dr. Vikram Das', 'Orthopedic Surgeon', 98000, 3, 4),
(110, 'Dr. Anjali Verma', 'General Physician', 90000, 1, 3);

-- =========================
-- Patients (50)
-- =========================
INSERT INTO Patients
(patient_id, patient_name, age, gender, city)
VALUES
(201,'Amit Sharma',25,'Male','Bangalore'),
(202,'Priya Nair',31,'Female','Mysore'),
(203,'Rahul Verma',42,'Male','Mandya'),
(204,'Neha Gupta',28,'Female','Hubli'),
(205,'Kiran Kumar',37,'Male','Mangalore'),
(206,'Pooja Reddy',22,'Female','Shimoga'),
(207,'Vijay Rao',46,'Male','Tumkur'),
(208,'Anita Singh',35,'Female','Bangalore'),
(209,'Sanjay Das',29,'Male','Mysore'),
(210,'Deepa Joshi',41,'Female','Mandya'),
(211,'Ramesh Patel',53,'Male','Hubli'),
(212,'Kavya Shetty',24,'Female','Udupi'),
(213,'Lokesh Gowda',32,'Male','Hassan'),
(214,'Divya Rao',27,'Female','Mysore'),
(215,'Mahesh Kumar',38,'Male','Bangalore'),
(216,'Sneha Patel',26,'Female','Belgaum'),
(217,'Harish Bhat',44,'Male','Shimoga'),
(218,'Nandini Rao',30,'Female','Tumkur'),
(219,'Ajay Singh',36,'Male','Mandya'),
(220,'Bhavana Nair',23,'Female','Mangalore'),
(221,'Rohit Gupta',40,'Male','Hubli'),
(222,'Anusha Reddy',33,'Female','Bangalore'),
(223,'Manoj Kumar',48,'Male','Mysore'),
(224,'Preethi Das',21,'Female','Mandya'),
(225,'Girish Rao',55,'Male','Hassan'),
(226,'Lakshmi Devi',39,'Female','Tumkur'),
(227,'Prakash Jain',34,'Male','Belgaum'),
(228,'Shilpa Sharma',29,'Female','Hubli'),
(229,'Vinod Patel',45,'Male','Mysore'),
(230,'Suma Gowda',28,'Female','Bangalore'),
(231,'Akash Verma',26,'Male','Mandya'),
(232,'Ritu Singh',31,'Female','Shimoga'),
(233,'Ganesh Rao',43,'Male','Mangalore'),
(234,'Asha Nair',37,'Female','Tumkur'),
(235,'Dinesh Kumar',52,'Male','Hubli'),
(236,'Pallavi Joshi',24,'Female','Mysore'),
(237,'Sachin Patel',35,'Male','Belgaum'),
(238,'Anjali Gupta',27,'Female','Bangalore'),
(239,'Ravi Bhat',41,'Male','Mandya'),
(240,'Keerthi Rao',30,'Female','Hassan'),
(241,'Mohan Das',49,'Male','Shimoga'),
(242,'Swathi Reddy',22,'Female','Mangalore'),
(243,'Naveen Kumar',38,'Male','Tumkur'),
(244,'Rekha Patel',29,'Female','Hubli'),
(245,'Ashok Singh',47,'Male','Mysore'),
(246,'Pavithra Nair',25,'Female','Bangalore'),
(247,'Umesh Rao',33,'Male','Mandya'),
(248,'Harini Joshi',36,'Female','Belgaum'),
(249,'Krishna Patel',50,'Male','Hassan'),
(250,'Monika Sharma',28,'Female','Mysore');

-- =========================
-- Appointments (30)
-- =========================
INSERT INTO Appointments
(appointment_id, patient_id, doctor_id, appointment_date, consultation_fee)
VALUES
(301,201,101,'2025-01-05',500),
(302,202,102,'2025-01-06',500),
(303,203,103,'2025-01-07',450),
(304,204,104,'2025-01-08',600),
(305,205,105,'2025-01-09',550),
(306,206,106,'2025-01-10',550),
(307,207,107,'2025-01-11',700),
(308,208,108,'2025-01-12',650),
(309,209,109,'2025-01-13',600),
(310,210,110,'2025-01-14',400),
(311,211,101,'2025-01-15',500),
(312,212,102,'2025-01-16',500),
(313,213,103,'2025-01-17',450),
(314,214,104,'2025-01-18',600),
(315,215,105,'2025-01-19',550),
(316,216,106,'2025-01-20',550),
(317,217,107,'2025-01-21',700),
(318,218,108,'2025-01-22',650),
(319,219,109,'2025-01-23',600),
(320,220,110,'2025-01-24',400),
(321,221,101,'2025-01-25',500),
(322,222,102,'2025-01-26',500),
(323,223,103,'2025-01-27',450),
(324,224,104,'2025-01-28',600),
(325,225,105,'2025-01-29',550),
(326,226,106,'2025-01-30',550),
(327,227,107,'2025-01-31',700),
(328,228,108,'2025-02-01',650),
(329,229,109,'2025-02-02',600),
(330,230,110,'2025-02-03',400);

-- =========================
-- Treatments (40)
-- =========================
INSERT INTO Treatments
(treatment_id, appointment_id, treatment_name, treatment_cost)
VALUES
(401,301,'ECG',1200),
(402,301,'Blood Test',800),
(403,302,'Heart Checkup',2000),
(404,303,'ECG',1200),
(405,304,'Brain MRI',6500),
(406,305,'EEG',3000),
(407,306,'Neurological Assessment',1800),
(408,307,'X-Ray',1000),
(409,308,'Fracture Casting',3500),
(410,309,'Bone Density Test',2500),
(411,310,'General Checkup',700),
(412,311,'ECG',1200),
(413,312,'Blood Pressure Monitoring',600),
(414,313,'Stress Test',2200),
(415,314,'Brain MRI',6500),
(416,315,'EEG',3000),
(417,316,'Nerve Conduction Study',2800),
(418,317,'Joint X-Ray',1200),
(419,318,'Physiotherapy',1800),
(420,319,'Knee Support',900),
(421,320,'General Checkup',700),
(422,321,'Blood Test',800),
(423,322,'Heart Scan',3500),
(424,323,'ECG',1200),
(425,324,'CT Scan',5000),
(426,325,'Neurology Consultation',1500),
(427,326,'Brain MRI',6500),
(428,327,'Hip X-Ray',1300),
(429,328,'Shoulder Therapy',2200),
(430,329,'Bone Scan',3200),
(431,330,'General Checkup',700),
(432,302,'Cholesterol Test',900),
(433,304,'Medication Review',1000),
(434,306,'Vitamin Test',850),
(435,308,'Orthopedic Review',1200),
(436,310,'Diabetes Screening',950),
(437,315,'Blood Test',800),
(438,320,'ECG',1200),
(439,325,'EEG',3000),
(440,330,'Health Counseling',500);



select * from Doctors;

select patient_name from Patients where gender = 'female';

-- 3. Doctors earning above 1,20,000.
SELECT 
doctor_id, 
doctor_name
FROM Doctors WHERE salary >  120000 ;


-- 4. Today's appointments.
SELECT
appointment_id ,consultation_fee 
FROM Appointments WHERE appointment_date =current_date();

-- 5. Patients from Bangalore

SELECT 
patient_id,
patient_name
FROM Patients WHERE city = 'Bangalore';


-- 6. Treatments costing above 20,000.
SELECT 
treatment_id,
treatment_name 
FROM Treatments WHERE  treatment_cost = 20000;

-- 7. Doctors ordered by experience.

select * from Doctors ORDER BY experience;

-- 8. Departments alphabetically.
select dept_name from Departments ORDER BY  dept_name;


-- ===============================================
-- Aggregate Functions
-- ===============================================

-- 1. Count doctors.
SELECT count(doctor_name) FROM Doctors;

-- 2. Average salary.
SELECT AVG(salary) FROM Doctors;

-- 3. Highest consultation fee.
SELECT MAX(consultation_fee) FROM Appointments ;

-- 4. Lowest treatment cost.
SELECT MIN( treatment_cost) FROM Treatments ;

-- 5. Total treatment revenue.
SELECT SUM( treatment_cost) FROM Treatments ;

-- 6. Patients by city.
SELECT city, COUNT(*) FROM Patients group by city;

-- 7. Average patient age.
SELECT AVG(age) FROM Patients;

-- 8. Total appointments.
SELECT COUNT(*) FROM Appointments ;

-- ========================================
-- GROUP BY & HAVING
-- ========================================

-- 1. Doctors per department.
SELECT  de.dept_name ,count(*)  FROM Doctors d LEFT JOIN Departments de ON d.dept_id =de.dept_id  GROUP BY d.dept_id;
  
-- 2. Average salary per department.
SELECT AVG(salary) FROM Doctors GROUP BY dept_id;

-- 3. Departments with more than two doctors.
SELECT  de.dept_name ,count(*)  FROM Doctors d LEFT JOIN Departments de ON d.dept_id =de.dept_id  GROUP BY d.dept_id Having count(*);
  
-- 4. Cities with more than three patients.
 SELECT city, COUNT(*) FROM Patients GROUP BY city HAVING COUNT(*) >3;

-- 5. Average consultation fee by department.
 SELECT de.dept_name ,avg(consultation_fee) FROM Appointments a left join Doctors d on a. doctor_id = d. doctor_id left join Departments de on d.dept_id = de.dept_id group by de.dept_id ; 

-- 6. Departments generating treatment revenue above 2,00,000.
 SELECT de.dept_name ,avg(t.treatment_cost) FROM  Treatments t left join   Appointments a on t.appointment_id = a.appointment_id left join Doctors d on a. doctor_id = d. doctor_id left join Departments de on d.dept_id = de.dept_id group by de.dept_id ; 


-- 7. Doctors handling more than five appointments.
SELECT  d.doctor_name FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id  group by d.doctor_id having count(a.appointment_id) >5;
  

-- 8. Departments with average experience above 8 years.
SELECT  de.dept_name,  avg(d.experience)     FROM Doctors d LEFT JOIN Departments de ON d.dept_id =de.dept_id  GROUP BY d.dept_id order by avg(d.experience)  desc limit 1 offset 1;
  
-- ===================================================
--                      Subqueries
-- ===================================================

-- 1. Doctors earning above average salary.
Select doctor_name,salary  from Doctors where salary > (
Select avg(salary)  from Doctors );


-- 2. Highest-paid doctor.
Select doctor_name,salary  from Doctors where salary > (
Select max(salary)  from Doctors );



-- 3. Treatments above average cost.
Select treatment_name ,  treatment_cost  from Treatments where  treatment_cost > (
Select avg( treatment_cost)  from Treatments );

-- 4. Patients paying highest consultation fee.
SELECT patient_name
FROM Patients
WHERE patient_id = (
    SELECT patient_id
    FROM Appointments
    ORDER BY consultation_fee DESC
    LIMIT 1
);

-- 5. Departments containing highest-paid doctor.
select dept_name from Departments where dept_id  =
 (select dept_id from Doctors order by salary limit 1 offset 1);
 

-- 6. Patients treated by Cardiology doctors.
SELECT DISTINCT p.patient_name
FROM Patients p
JOIN Appointments a
    ON p.patient_id = a.patient_id
JOIN Doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiology';


-- 7. Doctors with appointments.
select doctor_name from Doctors where doctor_id in ( 
select doctor_id from Appointments where appointment_date =  current_date());

-- 8. Doctors without appointments.
select doctor_name from Doctors where doctor_id not in  ( 
select doctor_id from Appointments where appointment_date =  current_date());


-- 9. Patients with MRI/CT Scan.
select patient_name from  Patients where patient_id  in (
select a.patient_id from Appointments a left join Treatments t on t.appointment_id = a. appointment_id where treatment_name = 'MRI'); 


-- 10. Departments having doctors earning above 2,00,000.

-- 11. Patients treated by highest-paid doctor
SELECT DISTINCT p.patient_id, p.patient_name
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE a.doctor_id =
(
    SELECT doctor_id
    FROM Doctors
    WHERE salary = (SELECT MAX(salary) FROM Doctors)
);

 -- 12. Department of doctor handling costliest treatment
SELECT DISTINCT d.dept_name
FROM Departments d
JOIN Doctors doc
ON d.dept_id = doc.dept_id
JOIN Appointments a
ON doc.doctor_id = a.doctor_id
JOIN Treatments t
ON a.appointment_id = t.appointment_id
WHERE t.treatment_cost =
(
    SELECT MAX(treatment_cost)
    FROM Treatments
);

-- 13. Doctors in department with highest average salary
SELECT doctor_name, dept_id
FROM Doctors
WHERE dept_id =
(
    SELECT dept_id
    FROM Doctors
    GROUP BY dept_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);

-- ==================================================
-- Correlated Subqueries
-- ==================================================


-- 1. Doctors earning above department average
SELECT doctor_name, salary
FROM Doctors d1
WHERE salary >
(
    SELECT AVG(salary)
    FROM Doctors d2
    WHERE d1.dept_id = d2.dept_id
);

-- 2. Highest-paid doctor in each department

SELECT doctor_name, dept_id, salary
FROM Doctors d1
WHERE salary =
(
    SELECT MAX(salary)
    FROM Doctors d2
    WHERE d1.dept_id = d2.dept_id
);

-- 3. Patients paying above average fee for same doctor
SELECT p.patient_name,
       d.doctor_name,
       a.consultation_fee
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id
WHERE a.consultation_fee >
(
    SELECT AVG(a2.consultation_fee)
    FROM Appointments a2
    WHERE a2.doctor_id = a.doctor_id
);

-- 4. Doctors handling more appointments than average doctor

SELECT doctor_name
FROM Doctors d
WHERE
(
    SELECT COUNT(*)
    FROM Appointments a
    WHERE a.doctor_id = d.doctor_id
)
>
(
SELECT AVG(total)
FROM
(
SELECT COUNT(*) total
FROM Appointments
GROUP BY doctor_id
) x
);



-- 5. Treatments above average cost of same appointment
SELECT treatment_name, treatment_cost
FROM Treatments t1
WHERE treatment_cost >
(
SELECT AVG(treatment_cost)
FROM Treatments t2
WHERE t1.appointment_id = t2.appointment_id
);

-- 6. Latest appointment of each patient
SELECT treatment_name, treatment_cost
FROM Treatments t1
WHERE treatment_cost >
(
SELECT AVG(treatment_cost)
FROM Treatments t2
WHERE t1.appointment_id = t2.appointment_id
);

-- 7. Oldest patient in each city

SELECT patient_name, city, age
FROM Patients p1
WHERE age =
(
SELECT MAX(age)
FROM Patients p2
WHERE p1.city = p2.city
);

-- 8. Doctors with experience above department average

SELECT doctor_name, experience
FROM Doctors d1
WHERE experience >
(
SELECT AVG(experience)
FROM Doctors d2
WHERE d1.dept_id = d2.dept_id
);

9. Departments where every doctor earns above 100000
SELECT dept_name
FROM Departments d
WHERE NOT EXISTS
(
SELECT *
FROM Doctors doc
WHERE doc.dept_id = d.dept_id
AND salary <=100000
);
10. Patients spending above city average
SELECT patient_name, city
FROM Patients p
WHERE
(
SELECT IFNULL(SUM(a.consultation_fee+t.treatment_cost),0)
FROM Appointments a
LEFT JOIN Treatments t
ON a.appointment_id=t.appointment_id
WHERE a.patient_id=p.patient_id
)
>
(
SELECT AVG(total_bill)
FROM
(
SELECT p2.patient_id,
p2.city,
SUM(a2.consultation_fee+IFNULL(t2.treatment_cost,0)) total_bill
FROM Patients p2
JOIN Appointments a2
ON p2.patient_id=a2.patient_id
LEFT JOIN Treatments t2
ON a2.appointment_id=t2.appointment_id
WHERE p2.city=p.city
GROUP BY p2.patient_id
) x
);


-- ===============================================================
--                    Challenge Exercises
-- ==============================================================
-- 1. Busiest doctor
SELECT doctor_name
FROM Doctors
WHERE doctor_id =
(
SELECT doctor_id
FROM Appointments
GROUP BY doctor_id
ORDER BY COUNT(*) DESC
LIMIT 1
);

-- 2. Least visited department
SELECT dept_name
FROM Departments
WHERE dept_id=
(
SELECT d.dept_id
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.dept_id
ORDER BY COUNT(a.appointment_id)
LIMIT 1
);

-- 3. Patients visiting more than three departments
SELECT p.patient_name
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
JOIN Doctors d
ON a.doctor_id=d.doctor_id
GROUP BY p.patient_id
HAVING COUNT(DISTINCT d.dept_id)>3;

-- 4. Doctors treating patients from more than four cities
SELECT d.doctor_name
FROM Doctors d
JOIN Appointments a
ON d.doctor_id=a.doctor_id
JOIN Patients p
ON a.patient_id=p.patient_id
GROUP BY d.doctor_id
HAVING COUNT(DISTINCT p.city)>4;

-- 5. Departments with no appointments this month
SELECT dept_name
FROM Departments d
WHERE NOT EXISTS
(
SELECT *
FROM Doctors doc
JOIN Appointments a
ON doc.doctor_id=a.doctor_id
WHERE doc.dept_id=d.dept_id
AND MONTH(a.appointment_date)=MONTH(CURDATE())
AND YEAR(a.appointment_date)=YEAR(CURDATE())
);
-- 6. Department with highest revenue
SELECT dept_name
FROM Departments
WHERE dept_id=
(
SELECT d.dept_id
FROM Doctors d
JOIN Appointments a
ON d.doctor_id=a.doctor_id
LEFT JOIN Treatments t
ON a.appointment_id=t.appointment_id
GROUP BY d.dept_id
ORDER BY SUM(a.consultation_fee+IFNULL(t.treatment_cost,0)) DESC
LIMIT 1
);

-- 7. Doctors never prescribing treatments above 
SELECT doctor_name
FROM Doctors d
WHERE NOT EXISTS
(
SELECT *
FROM Appointments a
JOIN Treatments t
ON a.appointment_id=t.appointment_id
WHERE a.doctor_id=d.doctor_id
AND t.treatment_cost>50000
);

-- 8. Patients consulting only one doctor
SELECT patient_name
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
GROUP BY p.patient_id
HAVING COUNT(DISTINCT doctor_id)=1;

-- 9. Most experienced doctor per department
SELECT doctor_name, dept_id, experience
FROM Doctors d1
WHERE experience=
(
SELECT MAX(experience)
FROM Doctors d2
WHERE d1.dept_id=d2.dept_id
);
 -- 10. Patients whose total bill exceeds hospital average
SELECT p.patient_name
FROM Patients p
JOIN Appointments a
ON p.patient_id=a.patient_id
LEFT JOIN Treatments t
ON a.appointment_id=t.appointment_id
GROUP BY p.patient_id
HAVING SUM(a.consultation_fee+IFNULL(t.treatment_cost,0))
>
(
SELECT AVG(total_bill)
FROM
(
SELECT patient_id,
SUM(a.consultation_fee+IFNULL(t.treatment_cost,0)) total_bill
FROM Appointments a
LEFT JOIN Treatments t
ON a.appointment_id=t.appointment_id
GROUP BY patient_id
) x
);