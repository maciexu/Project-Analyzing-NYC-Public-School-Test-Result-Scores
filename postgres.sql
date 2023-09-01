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






