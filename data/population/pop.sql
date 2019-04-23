-- Insert population averages from the "ne_10m_populated_places" table
-- into the "Population" table (as "Total")

INSERT INTO Population(CityId, Total)
SELECT C.id, TRUNC((pop_min + pop_max) / 2.0, 1) AS pop_avg
FROM ne_10m_populated_places NE
INNER JOIN City C ON (C.Name = NE.name)
WHERE TRUNC(C.lat, 2) = TRUNC(NE.latitude, 2) AND
TRUNC(C.lon, 2) = TRUNC(NE.longitude, 2)

--NE.name, NE.latitude, NE.longitude, C.lat, C.lon
--ORDER BY pop_avg DESC;
