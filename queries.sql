USE flights; 

-- top 100 rows -- 
SELECT * FROM Airport LIMIT 100;

SELECT * FROM City LIMIT 100;

SELECT * FROM Route LIMIT 100;

SELECT * FROM Flight LIMIT 100;

-- flights to routesn join query --
SELECT
    Flight.fly_date,
    Flight.passengers,
    Route.origin_airport,
    Route.destination_airport,
    Route.distance
FROM Flight JOIN Route 
ON Flight.route_id = Route.route_id
LIMIT 100;

-- aggregate query (sum, count, avg) --
SELECT 
    route_id, 
    SUM(passengers) AS total_passengers
FROM Flight GROUP BY route_id ORDER BY total_passengers DESC
LIMIT 10;

SELECT AVG(distance) AS average_distance
FROM Route;

SELECT 
    Route.origin_airport,
    Route.destination_airport,
    SUM(Flight.passengers) AS total_passengers
FROM Flight JOIN Route
ON Flight.route_id = Route.route_id
GROUP BY Route.origin_airport, Route.destination_airport
ORDER BY total_passengers DESC
LIMIT 10;