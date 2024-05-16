CREATE TABLE Flight(ICAO24, CallSign, FlightPeriod, Trip,
Velocity, Heading, VertRate, Alert, GeoAltitude) AS
SELECT ICAO24,
(rec).value AS CallSign,
(rec).time AS
FlightPeriod,
atTime(Trip, (rec).time),
atTime(Velocity, (rec).time),
atTime(Heading, (rec).time),
atTime(VertRate,(rec).time),
atTime(Alert, (rec).time),
atTime(GeoAltitude, (rec).time)
FROM airframe_traj f, unnest(f.CallSign) rec;