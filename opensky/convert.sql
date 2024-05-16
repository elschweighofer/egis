ALTER TABLE Flights
ADD COLUMN et_ts timestamptz,
ADD COLUMN lastposupdate_ts timestamptz,
ADD COLUMN lastcontact_ts timestamptz,
ADD COLUMN Geom geometry(Point, 4326);
UPDATE Flights
SET et_ts = to_timestamp(et), lastposupdate_ts =
to_timestamp(lastposupdate),
lastcontact_ts = to_timestamp(lastcontact),
Geom = ST_SetSRID(ST_MakePoint(Lon, Lat), 4326);