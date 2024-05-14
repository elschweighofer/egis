-- extension
CREATE EXTENSION IF NOT EXISTS MobilityDB CASCADE;
-- Clean, uncomment
-- DROP TABLE IF EXISTS AISInput;

-- Create Empty table

CREATE TABLE  IF NOT EXISTS AISInput(
T timestamp,
TypeOfMobile varchar(50),
MMSI integer,
Latitude float,
Longitude float,
navigationalStatus varchar(60),
ROT float,
SOG float,
COG float,
Heading integer,
IMO varchar(50),
Callsign varchar(50),
Name varchar(100),
ShipType varchar(50),
CargoType varchar(100),
Width float, Length float,
TypeOfPositionFixingDevice varchar(50),
Draught float,
Destination varchar(50),
ETA varchar(50),
DataSourceType varchar(50),
SizeA float,
SizeB float,
SizeC float,
SizeD float
);

