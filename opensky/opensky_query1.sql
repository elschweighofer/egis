--Query 1 
-- Compute and display the flights 
-- over Germany between 8:00 a.m and 9:00 a.m.
WITH Germany(germany) AS (
    SELECT ST_MakeEnvelope(6, 47, 15, 55, 4326)
),
TimeInterval(Period) AS (
    SELECT tstzspan '[2022-03-28 08:00:00, 2022-03-28 09:00:00)'
)
SELECT icao24,
    CallSign,
    trajectory(trip) as gertrip
FROM Flight,
    Germany
where eintersects(trip, germany) IS NOT NULL
    AND atGeometry(trip, germany) IS NOT NULL
    AND callsign IS NOT NULL
    AND NOT (callsign ~* '[ \t\v\b\r\n\u00a0]')
LIMIT 500