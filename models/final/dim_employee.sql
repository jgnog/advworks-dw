--dim_employee
select e.businessentityid as employee_id,
       e.nationalidnumber as national_id_number,
	   e.loginid as log_in_id,
	   e.jobtitle as job_title,
	   e.birthdate as birth_date,
	   e.maritalstatus as marital_status,
	   e.gender,
	   e.hiredate as hire_date,
	   e.salariedflag as salaried_flag,
	   e.vacationhours as vacation_hours,
	   e.sickleavehours as sick_leave_hours,
	   e.modifieddate as modified_date
  from humanresources.employee e