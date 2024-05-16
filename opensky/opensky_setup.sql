CREATE EXTENSION IF NOT EXISTS MobilityDB CASCADE;

CREATE TABLE Flights(
et bigint,
icao24 varchar(20),
lat float,
lon float,
velocity float,
heading float,
vertrate float,
callsign varchar(10),
onground boolean,
alert boolean,
spi boolean,
squawk integer,
baroaltitude numeric(7,2),
geoaltitude numeric(7,2),
lastposupdate numeric(13,3),
lastcontact numeric(13,3)
);