/* -- Option A: Assuming that the values are close to each other, we can
-- consider a representative lat/lon pair as the average of latitudes and
-- the average of longitudes, respectively. The query for this, reads:
CREATE TABLE AISInputFiltered1 AS
select t, max(typeofmobile) as typeofmobile, mmsi,
avg(latitude) as latitude, avg(longitude) as longitude,
max(navigationalstatus) as navigationalstatus,
max(rot) as rot, max(sog) as sog, max(cog) as cog,
max(heading) as heading, max(imo) as imo, max(callsign) as callsign,
max(name) as name, max(shiptype) as shiptype,
max(width) as width, max(length) as length,
max(typeofpositionfixingdevice) as typeofpositionfixingdevice,
max(draught) as draught, max(destination) as destination,
max(eta) as eta, max(datasourcetype) as datasourcetype,
ST_Transform(ST_SetSRID(ST_MakePoint(avg(Longitude), avg(Latitude)
), 4326), 25832) as geom
FROM aisinput
WHERE geom is not null
GROUP BY mmsi, t
 */
/* Option B: Ignore those points. We assume that the vessels’
instruments had problems during the transmission. The decision is to
ignore those tuples where for the same MMSI there is more than one
location reported (either the same or not), considering that
instruments were not reliable at those instants. We run the following
query: */
/* 
CREATE TABLE AISInputFiltered2 AS
SELECT *
FROM aisinput
WHERE geom IS NOT NULL AND
(mmsi, t) IN
(
SELECT mmsi, t
FROM aisinput
WHERE geom IS NOT NULL
GROUP BY mmsi, t
HAVING count(geom) = 1
) */

-- /* Option C: Choose one representative element. For instance, for those
-- (MMSI, t) pairs with more than one location, choose the first one. The
-- Postgres SQL: “SELECT DISTINCT ON (expression) LISTAATTR from
-- TABLE” returns the first tuple in each group. If we want to control which
-- tuple we want to keep, an ORDER BY clause should be used. Usually,
-- we sort the table with respect to the time dimension, and keep the first
-- occurrence. But in our case, that is not useful because the temporal
-- attribute “t” is part of the grouping attributes. Thus, we cannot write
-- “SELECT DISTINCT ON(MMSI,T) * FROM AISInput ORDER BY t”
-- In our case, there is no information that can help us to decide which
-- tuple is preferable to keep. Thus, we do not use ORDER BY clause. The
-- query for this solution is as follows: */

CREATE TABLE AISInputFiltered3 AS
SELECT DISTINCT ON(MMSI,T) *
FROM AISInput
WHERE geom IS NOT NULL