-- Delete the NULL values for latitude
-- icao24_with_null_lat is used to indicate the list of
-- rows to be deleted
WITH icao24_with_null_lat AS (
SELECT icao24, COUNT(lat)
FROM flights
GROUP BY icao24
HAVING COUNT(lat) = 0
)
DELETE
FROM Flights
WHERE icao24 IN
-- this SELECT statement is needed for the IN statement to
--compare against a list
(SELECT icao24 FROM icao24_with_null_lat);