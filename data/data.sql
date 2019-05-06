-- Since postgres was built on linux, this works for all OS'. No need to change '/' to '\' for windows.
-- Country
\copy Country(id, Name) FROM 'data/country.csv' DELIMITER ',' CSV HEADER;

-- City
\copy City(id, name, lat, lon, Country) FROM 'data/city.csv' DELIMITER ',' CSV HEADER;

-- Coastlines
\copy Coastlines(CityId, NearCoast) FROM 'data/beaches.csv' DELIMITER ',' CSV HEADER;

-- Airports
\copy Airports(Cityid, Exists) FROM 'data/airport.csv' DELIMITER ',' CSV HEADER;

--Elevation
\copy Elevation(CityId, elevation) FROM 'data/elevationdata.csv' DELIMITER ',' CSV HEADER;

--Temperature (Degrees C * 10)
\copy Temp(CityId,Jan,Feb,Mar,April,May,June,July,Aug,Sept,Oct,Nov,Dec) FROM 'data/temp.csv' DELIMITER ',' CSV HEADER;

--Precipitation (mm)
\copy Precipitation(CityId,Jan,Feb,Mar,April,May,June,July,Aug,Sept,Oct,Nov,Dec) FROM 'data/precip.csv' DELIMITER ',' CSV HEADER;

--UV (Values 0-255. divide by 16 to get UV index. i.e. Value of 32 means UV index of 2.)
\copy UV_Index(CityId,Jan,Feb,Mar,April,May,June,July,Aug,Sept,Oct,Nov,Dec) FROM 'data/uv.csv' DELIMITER ',' CSV HEADER;

-- Population Totals
\copy Population(CityId,Total) FROM 'data/population.csv' DELIMITER ',' CSV HEADER;

--Air Pollution
\copy Air_pollution(CityId, Index) FROM 'data/air_pollution.csv' DELIMITER ',' CSV HEADER;

-- Internet Speed
CREATE Table temp_internet(
    Country text NOT NULL,
    Speed numeric NOT NULL,
    PRIMARY KEY(Country)
);

\copy temp_internet(Country, Speed) FROM 'data/internet-speed.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Internet_Speed(Country, Speed)
SELECT C.id, TI.Speed FROM Country C
INNER JOIN temp_internet TI ON (TI.Country = C.name);


