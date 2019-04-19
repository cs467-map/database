-- *nix versions:
-- Country
\copy Country(Name,Country_Code) FROM 'data/country.csv' DELIMITER ',' CSV;
-- City
\copy city(id, name, country, lat, lon) FROM 'data/city.csv' DELIMITER ',' CSV;

-- Windows versions:
-- \copy Country(Name,Country_Code) FROM 'data\country.csv' DELIMITER ',' CSV;
-- \copy city(id, name, country, lat, lon) FROM 'data\city.csv' DELIMITER ',' CSV;
