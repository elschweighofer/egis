-- Compute and display the trajectories of the ships that enter or leave Helsingborg. 
-- You must be able to distinguish the incoming and outgoing trips.

WITH Goteborg(GoEnv) AS (
SELECT ST_Transform(ST_MakeEnvelope(11.79, 57.64, 12.01, 57.74, 4326), 25832) )
SELECT s.MMSI, trajectory(s.Trip), g.GoEnv
FROM
Goteborg g,
Ships s
WHERE ST_Intersects(trajectory(s.Trip), g.GoEnv)