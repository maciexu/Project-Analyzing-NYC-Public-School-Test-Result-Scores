-- Task 1: Inspect the first 10 rows of the database.
select * from schools limit 10;

-- Task 2: Finding missing values
-- Count the number of schools not reporting the percentage of students tested and the total number of schools in the database.

-- select count(*) as num_tested_missing
-- from schools 
-- where percent_tested is null;
-- select count(*) as num_schools from schools; 

select ( count(*) - count(percent_tested) ) as num_tested_missing,
count(*) as num_schools 
from schools;

-- Task 3: Schools by building code. Find how many unique schools there are based on building code.
select count(distinct building_code) as num_school_buildings
from schools;

-- Task 4: Best schools for math. Filter the database for all schools with math scores of at least 640.
select school_name, average_math
from schools
where average_math >= 640
order by average_math desc; 


-- Task 5. Lowest reading score
select min(average_reading) as lowest_reading
from schools; 

-- Task 6. Best writing school
select school_name, max(average_writing) as max_writing
from schools
group by school_name
order by max_writing desc
limit 1;


-- Task 7. Top 10 schools. Create total SAT scores and find the top 10 best schools.
select school_name, sum(average_math + average_reading + average_writing) as average_sat
from schools
group by school_name
order by average_sat desc
limit 10;


-- Task 8. Ranking boroughs. We will build a query that calculates the number of schools and the average SAT score per borough!
select borough, count(school_name) as num_schools, sum(average_math + average_reading + average_writing)/count(schools) as average_borough_sat
from schools
group by borough
order by average_borough_sat desc;

-- Task 9. Brooklyn numbers. For our final query of the database, 
-- let's focus on Brooklyn, which has 109 schools. We wish to find the top five schools for math performance.
select school_name, average_math
from schools
where borough = 'Brooklyn'
order by average_math desc
limit 5;
