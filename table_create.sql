USE flights; 

CREATE TABLE City (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    state_code CHAR(2), -- char bc state codes are always the same length --
    population int 
);

CREATE TABLE Airport (
    airport_code CHAR(3) PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

CREATE TABLE Route (
    route_id INT PRIMARY KEY,
    origin_airport CHAR(3),
    destination_airport CHAR(3),
    distance INT,
    FOREIGN KEY (origin_airport) REFERENCES Airport(airport_code),
    FOREIGN KEY (destination_airport) REFERENCES Airport(airport_code)
);

CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    route_id INT,
    fly_date INT, -- YYYYM format + dataset description said INT --
    passangers INT,
    seats INT,
    flight_count INT,
    FOREIGN KEY (route_id) REFERENCES Route(route_id) 
);

ALTER TABLE city
MODIFY city_id INT AUTO_INCREMENT;

CREATE TABLE temp_flight_data (
    origin_airport CHAR(3),
    destination_airport CHAR(3),
    origin_city_state VARCHAR(100),
    destination_city_state  VARCHAR(100),
    passengers INT,
    seats INT,
    flight_count INT,
    distance DECIMAL(10,1),
    fly_date INT, -- YYYYM format + dataset description said INT --
    origin_population INT,
    destination_population INT
);

DROP TABLE temp_flight_data; -- needed to fix columns --
