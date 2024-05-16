--Compute and display the flights taking-off in Germany * between 8 a.m. and 9 a.m.
-- Bounding box around Germany
WITH Germany(GerEnv) AS (
    SELECT ST_MakeEnvelope(6, 47, 15, 55, 4326)
),
-- Span for determining ascending planes
AscSpan(Span) AS (
    SELECT floatspan '[1,50]'
),
-- Time period we are interested in
TimeInterval(Period) AS (
    SELECT tstzspan '[2022-03-28 08:00:00, 2022-03-28 09:00:00)'
),
-- Planes over Germany in the given time period
AUFlight(
    ICAO24,
    CallSign,
    RestFlight,
    RestGeoAlt,
    RestVertRate
) AS (
    SELECT ICAO24,
        CallSign,
        atTime(Trip, Period),
        atTime(GeoAltitude, Period),
        atTime(VertRate, Period)
    FROM Flight,
        Germany,
        TimeInterval
    WHERE atTime(Trip, Period) IS NOT NULL
        AND ST_Intersects(GerEnv, trajectory(atTime(Trip, Period)))
),
-- Ascending planes
GerFlightAscent(ICAO24, CallSign, AscTrip, AscVertRate) AS (
    SELECT ICAO24,
        CallSign,
        atTime(
            RestFlight,
            timeSpan(sequenceN(atValues (RestVertRate, Span), 1))
        ),
        atTime(
            RestVertRate,
            timeSpan(sequenceN(atValues (RestVertRate, Span), 1))
        )
    FROM AUFlight,
        AscSpan
    WHERE atValues(RestVertRate, Span) IS NOT NULL
) -- Result
SELECT ICAO24,
    CallSign,
    trajectory(AscTrip) AS Geom
FROM GerFlightAscent,
    Germany
WHERE atGeometry(AscTrip, GerEnv) IS NOT NULL;