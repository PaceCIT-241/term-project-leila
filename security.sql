USE flights;

CREATE ROLE flight_viewer;

GRANT SELECT ON flights.* TO flight_viewer;

CREATE USER 'analyst1'@'localhost' IDENTIFIED BY 'passwords123';
CREATE USER 'analyst2'@'localhost' IDENTIFIED BY 'passwords123';

GRANT flight_viewer TO 'analyst1'@'localhost';
GRANT flight_viewer TO 'analyst2'@'localhost';

SET DEFAULT ROLE flight_viewer FOR 'analyst1'@'localhost';
SET DEFAULT ROLE flight_viewer FOR 'analyst2'@'localhost';

SHOW GRANTS FOR 'analyst1'@'localhost';