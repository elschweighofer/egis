-- Choose the capital cities (say A and B) of two neighbouring countries of Germany
-- Compute and display the trips between A, B, and the capital city of Germany.
WITH Cities (Sydney, Auckland, Melbourne) AS (
    SELECT ST_MakeEnvelope(150.3, -34.8, 151.8, -33.0, 4326),
        ST_MakeEnvelope(174.0, -37.67, 176.17, -36.12, 4326),
        ST_MakeEnvelope(143.9479, -38.8696, 146.3209, -37.0898, 4326)
),
AuckSyd AS (
    SELECT ICAO24,
        CallSign,
        Trip,
        VertRate,
        Velocity,
        GeoAltitude,
        trajectory(Trip) AS Traj,
        Sydney,
        Auckland
    FROM Cities c,
        Flight f
    WHERE ST_Intersects(trajectory(f.Trip), c.Sydney)
        AND ST_Intersects(trajectory(f.Trip), c.Auckland)
),
AuckMel AS (
    SELECT ICAO24,
        CallSign,
        Trip,
        VertRate,
        Velocity,
        GeoAltitude,
        trajectory(Trip) AS Traj,
        Sydney,
        Auckland
    FROM Cities c,
        Flights f
    WHERE ST_Intersects(trajectory(f.Trip), c.Melbourne)
        AND ST_Intersects(trajectory(f.Trip), c.Auckland)
)
SELECT *
FROM AuckMel
UNION
SELECT *
FROM AuckSyd;