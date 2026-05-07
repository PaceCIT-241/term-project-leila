USE Flights; 

SELECT * FROM temp_flight_data LIMIT 5; -- import works! -- 

INSERT INTO City (city_name, state_code, population) -- extracts portions of a string -- 
SELECT DISTINCT
    SUBSTRING_INDEX(origin_city_state, ',', 1) AS city_name,
    TRIM(SUBSTRING_INDEX(origin_city_state, ',', -1)) AS state_code,
    origin_population
FROM temp_flight_data 

UNION 

SELECT DISTINCT 
    SUBSTRING_INDEX(destination_city_state, ',', 1),
    TRIM(SUBSTRING_INDEX(destination_city_state, ',', -1)),
    destination_population
FROM temp_flight_data; -- combines origin and destination cities --

SELECT * FROM City LIMIT 20;

INSERT INTO Airport (airport_code)
SELECT DISTINCT origin_airport FROM temp_flight_data
UNION 
SELECT DISTINCT destination_airport FROM temp_flight_data; 

SELECT * FROM Airport LIMIT 10;

-- Link airport to city using orgin and destination data incase a city only shows it 1 category-- 
UPDATE Airport a JOIN temp_flight_data t ON a.airport_code = t.origin_airport
JOIN City c ON SUBSTRING_INDEX(t.origin_city_state, ',', 1) = c.city_name
AND TRIM(SUBSTRING_INDEX(t.origin_city_state, ',', -1)) = c.state_code
SET a.city_id = c.city_id
WHERE a.city_id IS NULL; 

