-- *nix versions:
-- Country
\copy Country(Name,Country_Code) FROM 'data/country.csv' DELIMITER ',' CSV;

-- City
\copy City(id, name, lat, lon, Country) FROM 'data/city.csv' DELIMITER ',' CSV;

-- Coastlines
\copy Coastlines(CityId, NearCoast) FROM 'data/beaches.csv' DELIMITER ',' CSV;

-- Airports
-- \copy Airports(id, Cityid, Exists) FROM 'data/airport.csv' DELIMITER ',' CSV;

-- Population Totals
-- Build populations for all cities.
\i data/population/population.sql
-- Input those populations into the "City" table.
\i data/population/pop.sql


-- Windows versions: replace all '/' above with '\'.
