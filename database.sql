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

CREATE Table Country(
ID serial PRIMARY KEY NOT NULL,
Name text NOT NULL,
Country_Code text NOT NULL
);

CREATE Table City(
ID serial NOT NULL UNIQUE,
Name text NOT NULL,
Country int NOT NULL REFERENCES Country(ID),
Lat int NOT NULL,
Lng int NOT NULL,
PRIMARY KEY (ID, Country)
);

CREATE Table Precipitation(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan double precision NOT NULL,
Feb double precision NOT NULL,
Mar double precision NOT NULL,
April double precision NOT NULL,
May double precision NOT NULL,
June double precision NOT NULL,
July double precision NOT NULL,
Aug double precision NOT NULL,
Sept double precision NOT NULL,
Oct double precision NOT NULL,
Nov double precision NOT NULL,
Dec double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Temp(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan double precision NOT NULL,
Feb double precision NOT NULL,
Mar double precision NOT NULL,
April double precision NOT NULL,
May double precision NOT NULL,
June double precision NOT NULL,
July double precision NOT NULL,
Aug double precision NOT NULL,
Sept double precision NOT NULL,
Oct double precision NOT NULL,
Nov double precision NOT NULL,
Dec double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table UV_index(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Jan double precision NOT NULL,
Feb double precision NOT NULL,
Mar double precision NOT NULL,
April double precision NOT NULL,
May double precision NOT NULL,
June double precision NOT NULL,
July double precision NOT NULL,
Aug double precision NOT NULL,
Sept double precision NOT NULL,
Oct double precision NOT NULL,
Nov double precision NOT NULL,
Dec double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Mountain_Dist(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Dist int NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Airport(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Exists bool NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Intl_Airport(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Exists bool NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Elevation(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Dist int NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Beach_Dist(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Dist int NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Internet_Speed(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
Speed int NOT NULL,
PRIMARY KEY(ID, CityId)
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
Index double precision NOT NULL,
PRIMARY KEY(ID, CityId)
);

CREATE Table Population(
ID serial NOT NULL,
CityId int NOT NULL REFERENCES City(ID),
M_Child int NOT NULL,
F_Child int NOT NULL, 
M_Young_Adult int NOT NULL,
F_Young_Adult int NOT NULL,
M_Adult int NOT NULL,
F_Adult int NOT NULL,
M_Ederly int NOT NULL,
F_Ederly int NOT NULL,
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
