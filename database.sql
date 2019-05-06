-- This deletes all the tables. Once the table structures are stable,
-- feel free to remove this.
BEGIN;
-- https://stackoverflow.com/questions/3327312/how-can-i-drop-all-the-tables-in-a-postgresql-database
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';
COMMIT;
SET CLIENT_ENCODING TO 'UTF8';

CREATE Table Country(
ID serial PRIMARY KEY NOT NULL,
Name text NOT NULL
);

CREATE Table City(
ID serial NOT NULL UNIQUE,
Name text NOT NULL,
Country int NOT NULL REFERENCES Country(ID),
Lon numeric NOT NULL,
Lat numeric NOT NULL,
PRIMARY KEY (ID, Country)
);

CREATE Table Precipitation(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan int,
Feb int,
Mar int,
April int,
May int,
June int,
July int,
Aug int,
Sept int,
Oct int,
Nov int,
Dec int,
PRIMARY KEY(ID, CityId)
);

CREATE Table Temp(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan int,
Feb int,
Mar int,
April int,
May int,
June int,
July int,
Aug int,
Sept int,
Oct int,
Nov int,
Dec int,
PRIMARY KEY(ID, CityId)
);

CREATE Table UV_index(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan int,
Feb int,
Mar int,
April int,
May int,
June int,
July int,
Aug int,
Sept int,
Oct int,
Nov int,
Dec int,
PRIMARY KEY(ID, CityId)
);

CREATE Table Coastlines(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
NearCoast boolean NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Airports(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Exists bool NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Intl_Airports(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Exists bool NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Elevation(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
elevation int,
PRIMARY KEY(ID, CityId)
);

CREATE Table Beach_Dist(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Close Boolean,
PRIMARY KEY(ID, CityId)
);

CREATE Table Internet_Speed(
ID serial NOT NULL,
Country int NOT NULL REFERENCES Country(ID),
-- Speed is in Mbps
Speed numeric,
PRIMARY KEY(ID, Country)
);

CREATE Table Homicide(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Rate int NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Palm_Trees(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Palms bool NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table City_Image(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
URL text NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Biome(
ID serial PRIMARY KEY NOT NULL,
Name text NOT NULL
);

CREATE Table Biome_City(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Biome_ID int NOT NULL REFERENCES Biome(ID),
PRIMARY KEY(ID, CityId, Biome_Id)
);

CREATE Table Poverty_Index(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Index double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Air_Pollution(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Index numeric,
PRIMARY KEY(ID, CityId)
);

CREATE Table Population(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Total int NOT NULL,
M_Child int,
F_Child int, 
M_Young_Adult int,
F_Young_Adult int,
M_Adult int,
F_Adult int,
M_Ederly int,
F_Ederly int,
PRIMARY KEY(ID, CityId)
);

CREATE Table Cost_Of_Living(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Cost_Month int NOT NULL,
Cost_Dinner double precision NOT NULL,
Cost_Beer double precision NOT NULL,
Cost_Coffee double precision NOT NULL,
Cost_Apt double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);


\i data/data.sql;
