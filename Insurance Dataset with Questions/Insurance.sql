create database insurance;
use insurance;
select * from insu;

/*Count for each categories of ‘region*/
select region, count(region) from insu group by region;

/*Find 50 records of highest ‘age’ and export data/table to desktop*/
select * from insu order by age desc limit 50;

/*Add index name ‘quick’ on ‘id’*/
create index quick on insu(id);

/*Describe the schema of table*/
describe insu;

/*Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view]*/
create view gender as select id, age, bmi, children, smoker, region, charges from insu ;
select * from gender;

/*6. Rename the view as ‘type’*/
rename table gender to type;
select * from type;

/*Count how many are ‘northwest’ insurance holders*/
select region, count(region) from insu where region = "northwest";

/*Count how many insurance holders were ‘female’*/
select sex, count(sex) from insu where sex= "female";

/*Create Primary key on a suitable column*/
alter table insu add primary key(id);

/*Create a new column ‘ratio’ which is age multiply by bmi*/
alter table insu
add column ratio float(50);
select * from insu;
update insu 
set ratio = age*bmi;

/*Arrange the table from high to low according to charges*/
select * from insu order by charges desc;

/*Find MAX of ‘charges’*/
select max(charges) from insu;

/*Find MIN of ‘charges’*/
select min(charges) from insu;

/*Find average of ‘charges’ of male and female*/
select sex, avg(charges) as average_charges from insu group by sex;

/*Write a Query to rename column name sex to Gender*/
alter table insu change column sex gender varchar(255);
select * from insu;

/*Add new column as HL_Charges where more than average charges should be 
categorized as HIGH and less than average charges should be categorized as LOW*/
alter table insu add column HL_Charges varchar(10);

set @avg_charges = (select avg(charges) from insu);

update insu set HL_Charges = case when charges > @avg_charges then "HIGH" else "LOW" end; 

/*Change location/position of ‘smoker’ and bring before ‘children*/
alter table insu modify column smoker text after bmi;
describe insu;

/*Show top 20 records*/
select * from insu limit 20;

/*Show bottom 20 records*/
select * from insu limit 20 offset 20;

/*Remove column ‘ratio’*/
alter table insu drop column ratio;

/*Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children*/
create view Female_HL_Charges as select HL_Charges, gender, smoker, children from insu where HL_charges = "HIGH" and smoker="yes" and children=0 and gender = "female";
select * from female_hl_charges;
drop view female_hl_charges;

/*Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, 
if 2 then two_children, if 3 then three_children, if 4 then four_children if 5 then five_children else print it as More_than_five_children.*/
alter table insu modify column children text;
update insu set children = case when children = 0 then "Zero Children" 
when children = 1 then "one_children" when children = 2 then "two_children" when children = 3 then "three_children" when children = 4 then "four_children" when children = 5 then "five_children"
else "More_than_five_children" end;
select * from insu;
/**/
/**/
/**/
/**/
/**/
/**/
/**/