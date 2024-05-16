-- create ships table
CREATE TABLE IF NOT EXISTS Ships(
MMSI integer,
Trip tgeompoint,
SOG tfloat,
COG tfloat
);
--
SELECT * FROM ships;