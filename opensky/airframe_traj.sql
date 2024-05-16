CREATE TABLE airframe_traj(icao24, trip, velocity, heading,
vertrate, callsign, alert, geoaltitude) AS (
SELECT icao24, tgeompointseq(array_agg
(tgeompoint(geom,et_ts) ORDER BY et_ts)
FILTER (WHERE geom IS NOT NULL)),
tfloatseq(array_agg(tfloat(velocity, et_ts)
ORDER BY et_ts)
FILTER (WHERE velocity IS NOT NULL)),
tfloatseq(array_agg(tfloat(heading, et_ts) ORDER BY et_ts)
FILTER (WHERE heading IS NOT NULL)),
tfloatseq(array_agg(tfloat(vertrate, et_ts) ORDER BY et_ts)
FILTER (WHERE vertrate IS NOT NULL)),
ttextseq(array_agg(ttext(callsign, et_ts) ORDER BY et_ts)
FILTER (WHERE callsign IS NOT NULL)),
tboolseq(array_agg(tbool(alert, et_ts) ORDER BY et_ts)
FILTER (WHERE alert IS NOT NULL)),
tfloatseq(array_agg(tfloat(geoaltitude, et_ts) ORDER BY
et_ts) FILTER (WHERE geoaltitude IS NOT NULL))
FROM Flights
GROUP BY icao24);
