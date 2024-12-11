create database clinic;
use clinic;
select * from cli;

/*Add index name fast on Name*/
alter table cli add index fast(name(50));

/*Describe the schema of table*/
describe cli;

/*Find average of Age*/
select avg(age) from cli;

/*Find minimum of Age*/
select min(age) from cli;

/*Find maximum of Age*/
select max(age) from cli;

/*Find average age of those were pregnant and not pregnant*/
select pregnant, avg(age) from cli
group by pregnant;

/*Find average blood pressure of those had drug reaction and did not had drug reaction*/
select avg(bp), drug_reaction from cli
group by drug_reaction order by drug_reaction desc;

/*Add new column name as ‘Age_group’ and those having age between 16 & 21 
should be categorized as Low, more than 21 and less than  35 should be categorized as Middle and above 35 should be categorized as High.*/
alter table cli add column Age_group varchar(10);
select * from cli;
update cli 
set age_group = case 
when age between 16 and 21 then "low"
when age between 21 and 35 then "Middle"
else "High" end;

/*Change ‘Age’ of Reetika to 32*/
update cli
set age = 32
where name = "Reetika";
 
/*Change name of Reena as Shara’*/
update cli
set name = "Shara"
where name = "Reena";

/*Remove Chlstrl column*/
alter table cli drop column Chlstrl;
select * from cli;

/*Select only Name, Age and BP*/
select name, age, bp from cli;

/*Select ladies whose first name starts with ‘E’*/
select name from cli where name like "E%";

/*Select ladies whose Age_group were Low*/
select * from cli;
select name, age_group from cli where age_group = "low";

/*Select ladies whose Age_group were High*/
select name, age_group from cli where age_group = "high";

/*Select ladies whose name starts with ‘A’ and those were pregnant*/
select name, pregnant from cli where name like "A%" and pregnant="yes";

/*Identify ladies whose BP was more than 120*/
select name, bp from cli where bp>120;
/*Identify ladies whose BP was between 100 and 120*/
select name, bp from cli where bp between 100 and 120 ;

/*Identify ladies who had low anxiety aged less than 30*/
select name, anxty_lh, age from cli where anxty_lh="no" and age<30;

/*Select ladies whose name ends with ‘i’*/
select name from cli where name like "%i";

/*Select ladies whose name ends with ‘a’*/
select name from cli where name like "%a";

/*Select ladies whose name starts with ‘K’*/
select name from cli where name like "k%";

/*Select ladies whose name have ‘a’ anywhere*/
select name from cli where name like "%i%";

/*Order ladies in ascending way based on ‘BP’*/
select * from cli order by bp asc;

/*Order ladies in descending way based on ‘Age’*/
select * from cli order by age desc;