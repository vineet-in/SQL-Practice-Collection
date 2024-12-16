use organization;

/*Q-1. Write An SQL Query To Fetch “FIRST_NAME” From 
Worker Table Using The Alias Name As <WORKER_NAME>.*/

select first_name as WORKER_NAME from worker;

/*Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker 
Table In Upper Case.*/

select upper(first_name) as WORKER_NAME from worker;

/*Q-3. Write An SQL Query To Fetch Unique Values 
Of DEPARTMENT From Worker Table.*/

select distinct(department) from worker;

/*Q-4. Write An SQL Query To Print The First Three Characters Of 
FIRST_NAME From Worker Table.*/

select substring(first_name, 1, 3) as Extracted_Three from worker;

/*Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) 
In The First Name Column ‘Amitabh’ From Worker Table.*/

select locate("h", first_name) as Position from 
worker where lower(first_name) = lower("Amitabh");

/*Q-6. Write An SQL Query To Print 
The FIRST_NAME From Worker Table After 
Removing White Spaces From The Right Side.*/

select rtrim(first_name) as trimmed  from worker;

/*Q-7. Write An SQL Query To Print The DEPARTMENT From Worker 
Table After Removing White Spaces From The Left Side.*/

select ltrim(first_name) as left_trimmed from worker;

/*Q-8. Write An SQL Query That Fetches The Unique Values Of 
DEPARTMENT From Worker Table And Prints Its Length.*/

select distinct(department),  length(department) as lengths from worker;


/*Q-9. Write An SQL Query To Print The FIRST_NAME From Worker 
Table After Replacing ‘a’ With ‘K’. (for replacing char is case-sensitive)*/

select replace(replace(first_name, "a", "K"), "A", "K") as updated_name from worker;


/*Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table
 Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.*/
 
 select concat(first_name, " ", last_name) as full_name from worker;
 
 
/*Q-11. Write An SQL Query To Print All Worker Details 
From The Worker Table Order By FIRST_NAME Ascending.*/

select * from worker order by first_name asc;


/*Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By 
FIRST_NAME Ascending And DEPARTMENT Descending.*/

select * from worker order by first_name asc ,department desc;

/*Q-13. Write An SQL Query To Print Details For Workers With The 
First Name As “Vipul” And “Satish” From Worker Table.*/

select * from worker where first_name = "Vipul" or first_name = "Satish";

/*Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, 
“Vipul” And “Satish” From Worker Table.*/

select * from worker where first_name != "Vipul" and first_name != "Satish";

/*Q-15. Write An SQL Query To Print Details Of Workers With 
DEPARTMENT Name As “Admin”.*/

select * from worker where department = "Admin";

/*Q-16. Write An SQL Query To Print Details 
Of The Workers Whose FIRST_NAME Contains ‘A’.*/

select * from worker where first_name like "%a%";

/*Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.*/

select first_name from worker where first_name like "%A";

/*Q-18. Write An SQL Query To Print Details Of The Workers 
Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.*/

select first_name from worker where first_name like "%H" and length(first_name) = 6;

/*Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.*/

select * from worker where salary between 100000;

/*Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.*/

select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;


/*Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.*/

select department, count(worker_id) as count_of_emp from worker where department = "Admin";


/*Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.*/

select concat(first_name, " ", last_name) as worker_full_name, salary 
from worker 
where 
salary >= 50000
and
salary <= 100000;

/*Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.*/

select department, count(worker_id) as number_of_employee
from worker
group by department
order by number_of_employee desc;
select * from title;
/**/
/**/
/**/
/**/
/**/
/**/
/**/


