CREATE DATABASE cereals;
use cereals;
select * from cereals;

/*Add index name fast on name*/
CREATE INDEX fast ON cereals(name(50));

/*Describe the schema of table*/
DESCRIBE cereals;

/*Create view name as see where users can not see type column [first run appropriate query then create view]*/
CREATE VIEW see as 
select name, mfr, calories, protein, fat, sodium, fiber, carbo, sugars, potass, vitamins, shelf, weight, cups, rating from cereals;
select * from see;

/*Rename the view as saw*/
RENAME TABLE see to saw;
select * from saw;

/*Count how many are cold cereals*/
select type, count(type) from cereals
where type = "C";

/*Count how many cereals are kept in shelf 3*/
select shelf, count(shelf) from cereals
where shelf="3";

/*Arrange the table from high to low according to ratings*/
select * from cereals
order by rating desc;

/*Suggest some column/s which can be Primary key*/
# Name can be a primary key but not recomendded.

/*Find average of calories of hot cereal and cold cereal in one query*/
select type, avg(calories) from cereals
group by type;

/*Add new column as HL_Calories where more than average calories should be categorized 
as HIGH and less than average calories should be categorized as LOW*/
alter table cereals add column HL_Calories varchar(5);

SET @avg_calories = (SELECT AVG(calories) FROM cereals);

update cereals 
set HL_Calories = case when calories > @avg_calories then "HIGH" else "LOW" end;

select * from cereals;

/*List only those cereals whose name begins with B*/
select * from cereals where name like "B%";

/*List only those cereals whose name begins with F*/
select * from cereals where name like "F%";

/*List only those cereals whose name ends with s*/
select * from cereals where name like "%S";
/*Select only those records which are HIGH in column HL_calories and 
mail to jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>]*/
select * from cereals where HL_Calories = "HIGH";

/*Find maximum of ratings*/
select max(rating) from cereals;

/*find average ratings of those were High and Low calories*/
select HL_Calories, avg(rating) from cereals group by HL_Calories order by HL_Calories asc;

/*Create two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using #*/


/*Remove column fat*/
alter table cereals drop column fat;
select * from cereals;

/*Count records for each manufacturer [mfr]*/
select mfr, count(mfr) from cereals group by mfr order by count(mfr) asc;

/*Select name, calories and ratings only*/
select name, calories, rating from cereals;