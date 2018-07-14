-- Submitted by
-- Sudhan Maharjan
-- ----------------------------------

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.
-- Ans: The flight number N14228 from EWR to IAH is the furthest in distance.

select tailnum, flight, origin, dest, max(distance) from flights;


-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.

select engines, max(seats) from planes group by engines;

-- 3. Show the total number of flights.

select count(flight) from flights;

-- 4. Show the total number of flights by airline (carrier).

select carrier, count(flight) from flights group by carrier order by carrier asc;

-- 5. Show all of the airlines, ordered by number of flights in descending order.

select carrier, count(*) as FlightCount from flights group by carrier order by FlightCount desc;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

select carrier, count(*) as FlightCount from flights group by carrier order by FlightCount desc Limit 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.

select carrier, count(*) as FlightCount from flights where distance >= 1000 group by carrier order by FlightCount desc Limit 5;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question

-- Question
-- Show the flights that has origined from EWR to different destination and count the total flights for January.

select carrier, origin, month, count(origin) as OriginCount from flights where (origin = "EWR" and month = 1 and year = 2013);