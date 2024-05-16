SELECT mmsi, t, count(geom)
FROM aisinput
WHERE geom is not null
GROUP BY mmsi, t
HAVING count(geom) > 1