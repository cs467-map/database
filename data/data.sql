-- Country
\copy Country(Name,Country_Code) FROM 'data/country.csv' DELIMITER ',' CSV;

-- City
-- Test cities for server development.
-- Currently, all cities below are assigned to Morocco for convenience.
INSERT INTO City(Name, Country, Lon, Lat, Rank) VALUES('New York', 1, -74, 40.7, 4.5);
INSERT INTO City(Name, Country, Lon, Lat, Rank) VALUES('San Diego', 1, -117, 33, 2.7);
INSERT INTO City(Name, Country, Lon, Lat, Rank) VALUES('Dallas', 1, -96, 33, 1.2);
