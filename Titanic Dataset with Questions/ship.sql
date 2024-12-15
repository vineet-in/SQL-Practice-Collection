create database ship;
use ship;
select * from titanic;

/*Basic Level Questions:*/

/*1. How many passengers are in the Titanic dataset?*/
select count(adult_male) as total_passengers from titanic;

/*2. What are the distinct classes of passengers onboard?*/
select distinct(class) from titanic;

/*3. How many passengers survived the Titanic disaster?*/
select count(alive) from titanic where alive = "yes";

/*4. What is the average age of passengers onboard?*/
select avg(age) as average_age from titanic;

/*5. How many male passengers were there?*/
select count(sex) from titanic where sex = "male";

/*6. What is the highest fare paid for a ticket?*/
select max(fare) as highest_fare from titanic;

/*7. How many siblings/spouses were onboard for each passenger?*/
select distinct sibsp from titanic
order by sibsp asc;

/*8. What is the percentage of passengers who survived?*/
select survived, count(*) * 100/ sum(count(*)) over()
from  titanic group by survived;

/*9. What is the most common port of embarkation?*/
select distinct embarked , count(embarked) as common_occurence
from titanic
group by embarked 
order by common_occurence desc
limit 1;
/*10. How many passengers have missing values for the 'age' column?*/
    update titanic
set  age=nullif(age, '');
select count(*) - count(age) as 'Null', count(age) as 'Not Null' from titanic;

/*Intermediate Level Questions:*/

/*1. What is the survival rate among passengers in each class?*/
select * from titanic;
select pclass, avg(survived) as survival_rate from titanic group by pclass order by pclass asc;

/*2. What is the average fare paid by passengers who survived vs. those who didn't?*/
select alive, avg(fare) from titanic group by alive order by alive desc;

/*3. What is the age distribution of passengers who survived?*/
select age , count(*) as survivedcount
from titanic
where survived = 1
group by age
order by age;

/*4. How many passengers traveled alone (without 
siblings/spouses or parents/children)?*/
select count(sibsp) from titanic where sibsp = 0; 

/*5. What is the average fare paid by passengers 
from each port of embarkation?*/
select embark_town, avg(fare) from titanic
group by embark_town;

/*6. What is the survival rate among 
passengers of different 
age groups (e.g., children, */
select case when age < 18 Then "Child"
when age >= 18 and age < 65 Then "Adult"
else "Senior"
end as age_group,
count(*) as total_passengers,
sum(survived) as survived_passengers,
avg(survived) as survival_rate
from titanic
group by 
case when age<18 then "Child"
when age>= 18 and age < 65 then "Adult"
else "Senior"
End 
order by 
Min(age);

/*7. What is the survival rate among male vs. female passengers in each class?*/
select sex, avg(survived) from titanic group by sex;
/*8. What is the average age of passengers who survived vs. those who didn't?*/
select alive, avg(age) from titanic group by alive;

/*9. How many passengers have siblings/spouses onboard but no parents/children?*/
select count(*) as numpassengers
from titanic
where sibsp>0
and parch = 0;

/*10. What is the survival rate among passengers with different numbers of siblings/spouses?*/
select sibsp, count(*) as total_passengers,
sum(survived) as survived,
avg(survived) as surv_rate
from titanic
group by sibsp
order by sibsp;

/*Advanced Level Questions:*/

/*1. What is the survival rate among passengers of different age groups and genders?*/
SELECT
    CASE
        WHEN Age < 18 THEN 'Child'
        WHEN Age >= 18 AND Age < 65 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup,
    Sex,
    COUNT(*) AS TotalPassengers,
    SUM(Survived) AS SurvivedPassengers,
    AVG(Survived) AS SurvivalRate
FROM
    titanic
GROUP BY
    CASE
        WHEN Age < 18 THEN 'Child'
        WHEN Age >= 18 AND Age < 65 THEN 'Adult'
        ELSE 'Senior'
    END,
    Sex
ORDER BY
    AgeGroup, Sex;

/*2. What is the survival rate among passengers who paid high vs. low fares, considering 
each class separately?*/
