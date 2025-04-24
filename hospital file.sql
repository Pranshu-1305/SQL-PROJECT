create table hospital(
Hospital_Name varchar(100),
Location varchar(100),
Department varchar(100),
Doctors_Count int,
Patients_Count int,
Admission_Date date,
Discharge_Date date,
Medical_Expenses real
);
select * from hospital;
/*Total Number of Patients 
o Write an SQL query to find the total number of patients across all hospitals.*/ 
  select sum(patients_count) as total_no_of_patients from hospital;
/*2. Average Number of Doctors per Hospital 
o Retrieve the average count of doctors available in each hospital.*/
  select avg (doctors_count) as avg_doctor_per_hospital from hospital;

  select * from hospital;
/*3. Top 3 Departments with the Highest Number of Patients 
o Find the top 3 hospital departments that have the highest number of patients.*/ 
  select * from hospital order by patients_count limit 3;
  select * from hospital order by patients_count desc limit 3;
/*4. Hospital with the Maximum Medical Expenses 
o Identify the hospital that recorded the highest medical expenses.*/ 
  select * from hospital order by medical_expenses desc;
/*5. Daily Average Medical Expenses 
o Calculate the average medical expenses per day for each hospital.*/
select hospital_name, location, avg(medical_expenses) as avg_medical_expenses from hospital
group by hospital_name,
location;

select hospital_name, location, (medical_expenses/(discharge_date-admission_date))
as per_day_expenses from hospital;
select * from hospital;
/*6. Longest Hospital Stay 
o Find the patient with the longest stay by calculating the difference between 
Discharge Date and Admission Date*/.
select hospital_name, location, (discharge_date-admission_date) as long_stay
from hospital
order by long_stay desc;
/*7. Total Patients Treated Per City 
o Count the total number of patients treated in each city.*/
  select distinct location from hospital;

  select distinct location,
  sum(patients_count) as total_patients
  from hospital
  group by location
  order by total_patients desc;
  

/*8. Average Length of Stay Per Department 
o Calculate the average number of days patients spend in each department.*/
select distinct department, avg(discharge_date-admission_date) as spend_days_in_each_department 
from hospital
group by department;
/*9. Identify the Department with the Lowest Number of Patients
o Find the department with the least number of patients*/.
select distinct department, sum(patients_count) as d_lowest_number_of_patients
from hospital
group by department
order by d_lowest_number_of_patients asc;
/*10. Monthly Medical Expenses Report 
Group the data by month and calculate the total medical 
expenses for each month*/
select hospital_name, location, department, to_char(admission_date, 'mm-yyyy') as month,
sum(medical_expenses) as total_monthly_expenses
from hospital
group by hospital_name,
location, 
department,
to_char(admission_date,'mm-yyyy')
order by
hospital_name,
month;
select count(*) from hospital;

  