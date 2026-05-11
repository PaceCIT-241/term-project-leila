USE flights;

CREATE VIEW busiest_routes AS SELECT    
    Route.origin_airport,
    Route.destination_airport,
    SUM(Flight.passengers) AS total_passengers,
    SUM(Flight.flight_count) AS total_flights
FROM Flight JOIN Route 
ON Flight.route_id = Route.route_id
GROUP BY Route.origin_airport, Route.destination_airport;

SELECT * FROM busiest_routes
ORDER BY total_passengers DESC
LIMIT 20;