-- Since postgres was built on linux, this works for all OS'. No need to change '/' to '\' for windows.
-- Country
\copy Country(id, Name) FROM 'data/country.csv' DELIMITER ',' CSV HEADER;

-- City
\copy City(id, name, lat, lon, Country) FROM 'data/city.csv' DELIMITER ',' CSV HEADER;

-- Coastlines
\copy Coastlines(CityId, NearCoast) FROM 'data/beaches.csv' DELIMITER ',' CSV HEADER;

-- Airports
\copy Airports(Cityid, Exists) FROM 'data/airport.csv' DELIMITER ',' CSV HEADER;

-- Intl Airports
\copy Intl_Airports(Cityid, Exists) FROM 'data/intlairports.csv' DELIMITER ',' CSV HEADER;

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
\copy Internet_Speed(Country, Speed) FROM 'data/internet_speed.csv' DELIMITER ',' CSV HEADER;

-- City Images
\copy City_Image(CityId,Src) FROM 'data/city_images.csv' DELIMITER ',' CSV HEADER;

-- Purchasing power
\copy Puchasing_Power_Parity(Country, ppp) FROM 'data/purchasing_power.csv' DELIMITER ',' CSV HEADER;

--Percent of population living in 'Severe poverty'
\copy Poverty_Index(Country, percent) FROM 'data/severe_poverty_percent.csv' DELIMITER ',' CSV HEADER;

--Palm Trees
\copy Palm_Trees(CityId, Palms) FROM 'data/palms.csv' DELIMITER ',' CSV HEADER;

--Homicides (Total, female, per 100,000 people)\
\copy Homicide(Country,TotalRate,FemaleRate) FROM 'data/homicide.csv' DELIMITER ',' CSV HEADER;