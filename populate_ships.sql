DROP TABLE Ships;
CREATE TABLE Ships(MMSI, Trip, SOG, COG) AS
SELECT MMSI,
tgeompointseq(array_agg(
tgeompoint(geom , t) ORDER BY t )),
tfloatseq(array_agg(
tfloat(SOG , t) ORDER BY t
) FILTER (WHERE SOG IS NOT NULL ) ),
tfloatseq(array_agg(
tfloat (COG, t) ORDER BY t
) FILTER (WHERE COG IS NOT NULL ) )
FROM AISInputFiltered3
GROUP BY MMSI;