create database movie;
use movie;

/*i. Write a SQL query to find when the movie 'American Beauty' released. Return 
movie release y*/
select mov_title, mov_year from movie
where mov_title = "american beauty";
select act_fname, act_lname as actors_name from actor a inner join cast c using(act_id)
inner join movie m using(mov_id) where mov_title = "american beauty";

/*ii. Write a SQL query to find those movies, 
which were released before 1998. Return 
movie title*/
select mov_title, mov_year from movie 
where mov_year<=1998 order by mov_year desc;

/*iii. Write a query where it should contain all 
the data of the movies which were 
released after 1995 and their movie duration was greater than 120.*/
select * from movie
where mov_year > 1995 and 
mov_time > 120;

/*iv. Write a query to determine the Top 
7 movies which were released in United 
Kingdom. Sort the data in ascending order of the movie year.*/
select mov_title, mov_year, rev_stars, mov_rel_country from movie 
left join ratings on movie.mov_id = ratings.mov_id
where mov_rel_country = "UK"
order by rev_stars desc
limit 7 ;

select * from ratings;
/*v. Set the language of movie language as
 'Chinese' for the movie which has its 
existing language as Japanese and the movie year was 2001.
*/
update movie
set mov_lang = "chinese"
where mov_lang = "japanese"
and mov_year = 2001;

/*vi. Write a SQL query to find name of all the reviewers who rated the movie 
'Slumdog Millionaire'*/
select mov_id, mov_title, rev_name from movie
left join reviewer on movie.mov_id = reviewer.rev_id 
where mov_title = "Slumdog Millionaire";
select * from reviewer;

/*vii. Write a query which fetch the first name, last name & role played by the 
actor where output should all exclude Male actors*/
select * from actor;
select * from cast;
select act_fname, act_lname, role
from actor left join cast on actor.act_id = cast.act_id
where act_gender = "F";

/*viii. Write a SQL query to find the actors who played a role in 
the movie 'Annie Hall'.
Fetch all the fields of actor table. (Hint: Use the IN operator)*/
SELECT * 
FROM actor 
WHERE act_id IN(
  -- Selecting 'act_id' from 'movie_cast' where 'mov_id' is in the subquery result
  SELECT act_id 
  FROM cast 
  WHERE mov_id IN (
    -- Selecting 'mov_id' from 'movie' where 'mov_title' is 'Annie Hall'
    SELECT mov_id 
    FROM movie 
    WHERE mov_title='Annie Hall'
  )
);

/*ix. Write a SQL query to find those movies that have been released in countries other 
than the United Kingdom. Return movie title, movie year, movie time, and date of 
release, releasing country.*/
select * from movie where mov_rel_country != "UK";

/*x. Print genre title, maximum movie duration 
and the count the number of 
movies in each genre. (HINT: By using inner join)*/
select g.gen_title, max(m.mov_time) as max_mov_time, count(g.gen_title)
as gen_count
from movie m 
inner join movie_genres mg on m.mov_id = mg.mov_id
inner join genres g on mg.gen_id = g.gen_id
group by g.gen_title
order by max_mov_time desc;

/*xi. Create a view which should contain the first name, last name, title of the 
movie & role played by particular actor.*/
create view actormovierole as
select act_fname as first_name,
act_lname as last_name,
mov_title as movie_title,
role as role_played
from cast 
join actor on cast.act_id = actor.act_id
join movie on cast.mov_id = movie.mov_id;
select * from actormovierole;

/*xii. Write a SQL query to find the movies with the lowest ratings*/
select mov_title, rev_stars from movie
join ratings on movie.mov_id = ratings.mov_id
order by rev_stars asc;
/*xiii. Finally Mail the script to jeevan.raj@imarticus.com*/
/* Write an sql query to print the actor name, movie name which has the highest rating. */
select * from ratings;
select * from actor;
select * from movie;
select act_fname, act_lname, mov_title, rev_stars from actor inner join cast c using(act_id)
inner join movie using (mov_id)
inner join ratings using (mov_id) # Dense rank
order by rev_stars desc
limit 1;

select * from director;
select concat(act_fname," " ,act_lname)actor,concat(dir_fname," ", dir_lname) director, mov_title, rev_stars  
from actor inner join cast c using (act_id)
inner join movie using(mov_id)
inner join ratings using(mov_id)
inner join movie_direction using(mov_id)
inner join director using (dir_id)
order by rev_stars desc
limit 1;
select * from movie_directio;

/* Write a sql query to print the name actress 
and the role they've played and find the name of the reviewer of the name called aliens*/
select mov_title, concat(act_fname," ", act_lname)actor, role, rev_name from actor 
inner join cast using(act_id)
inner join movie using (mov_id)
inner join ratings using(mov_id)
inner join reviewer using(rev_id)
where mov_title = "aliens";
select * from reviewer;
