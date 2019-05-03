-- *nix versions:
-- Country
\copy Country(Country_Code, Name) FROM 'data/country.csv' DELIMITER ',' CSV HEADER;

-- City
\copy City(id, name, lat, lon, Country) FROM 'data/city.csv' DELIMITER ',' CSV HEADER;

-- Coastlines
\copy Coastlines(CityId, NearCoast) FROM 'data/beaches.csv' DELIMITER ',' CSV HEADER;

-- Airports
\copy Airports(Cityid, Exists) FROM 'data/airport.csv' DELIMITER ',' CSV HEADER;

--Elevation
\copy Elevation(id, elevation) FROM 'data/elevationdata.csv' DELIMITER ',' CSV HEADER;

--Air Pollution
\copy Air_pollution(id, pollution_idx) FROM 'data/air_pollution.csv' DELIMITER ',' CSV HEADER;

--Temperature (Degrees C * 10)
\copy Temperature(id, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec) FROM 'data/temp.csv' DELIMITER ',' CSV HEADER;

--Precipitation (mm)
\copy Precipitation(id, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec) FROM 'data/precip.csv' DELIMITER ',' CSV HEADER;

--UV (Values 0-255. divide by 16 to get UV index. i.e. Value of 32 means UV index of 2.)
\copy UV_Index(id, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec) FROM 'data/uv.csv' DELIMITER ',' CSV HEADER;

-- Internet Speed
CREATE Table temp_internet(
    ID serial NOT NULL,
    Country text NOT NULL,
    Speed float NOT NULL,
    PRIMARY KEY(ID)
);

\copy temp_internet(Country, Speed) FROM 'data/internet-speed.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Internet_Speed(Country, Speed)
SELECT C.id, TI.Speed FROM Country C
INNER JOIN temp_internet TI ON (TI.Country = C.name);

-- Population Totals
-- Build populations for all cities.
\i data/population/population.sql
-- Input those populations into the "City" table.
-- \i data/population/pop.sql
\copy Population(CityId,Total) FROM 'data/population/population-total.csv' DELIMITER ',' CSV HEADER;


-- Windows versions: replace all '/' above with '\'.
-- %s:\:\\:g
