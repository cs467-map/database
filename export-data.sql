DROP TABLE IF EXISTS export;
CREATE TABLE export AS
    SELECT c.name AS city, co.name AS country, TRUNC(c.lon, 2) AS lon, TRUNC(c.lat,2) AS lat, c.id,
    p.total AS population, i.speed AS mbps,
    cl.NearCoast AS beach, a.Exists AS airport, ia.Exists AS intlairport,
    e.elevation AS elevation, ap.Index as pollution,
    pt.palms as palms, h.totalrate as totalhomicides, h.femalerate as femalehomicides,

    -- temperature
    t.Jan AS tempJan, t.Feb AS tempFeb, t.Mar AS tempMar, t.April AS tempApr, t.May AS tempMay, t.June AS tempJun, t.July AS tempJul, t.Aug AS tempAug, t.Sept AS tempSep, t.Oct AS tempOct, t.Nov AS tempNov, t.Dec AS tempDec,

    -- precipitation
    pr.Jan AS precipJan, pr.Feb AS precipFeb, pr.Mar AS precipMar, pr.April AS precipApr, pr.May AS precipMay, pr.June AS precipJun, pr.July AS precipJul, pr.Aug AS precipAug, pr.Sept AS precipSep, pr.Oct AS precipOct, pr.Nov AS precipNov, pr.Dec AS precipDec,

    -- uv
    uv.Jan AS uvJan, uv.Feb AS uvFeb, uv.Mar AS uvMar, uv.April AS uvApr, uv.May AS uvMay, uv.June AS uvJun, uv.July AS uvJul, uv.Aug AS uvAug, uv.Sept AS uvSep, uv.Oct AS uvOct, uv.Nov AS uvNov, uv.Dec AS uvDec,

    -- socioeconomic
    ppp.ppp AS purchasingpower,
    pi.percent AS povertyIndex,

    --- city image
    ci.src AS image

    FROM City c
    INNER JOIN Air_pollution ap ON ap.CityId = c.id
    INNER JOIN Airports a ON a.CityId = c.id
    INNER JOIN Coastlines cl ON  cl.CityId = c.id
    INNER JOIN Country co ON co.id = c.country
    INNER JOIN Elevation e ON e.CityId = c.id
    INNER JOIN Homicide h ON co.id = h.country
    INNER JOIN Internet_Speed i ON i.Country = co.id
    INNER JOIN Palm_Trees pt ON pt.CityId = c.id
    INNER JOIN Population p ON p.CityId = c.id
    INNER JOIN Poverty_Index pi ON pi.Country = co.id
    INNER JOIN Precipitation pr ON pr.CityId = c.id
    INNER JOIN Puchasing_Power_Parity ppp ON ppp.Country = co.id
    INNER JOIN Temp t ON t.CityId = c.id
    INNER JOIN UV_Index uv ON uv.CityId = c.id
    INNER JOIN Intl_Airports ia ON ia.CityId = c.id
    LEFT JOIN City_Image ci ON ci.CityId = c.id
    ORDER BY P.total desc
    ;

-- CSV export
\copy (SELECT * FROM export) To 'voyager-index-data.csv' With CSV DELIMITER ',' HEADER;

-- JSON export
-- https://ethanmick.com/outputting-a-postgres-table-as-json/
\copy (SELECT array_to_json(array_agg(row_to_json(t))) FROM (SELECT * FROM export) t) TO 'voyager-index-data.json'
;
