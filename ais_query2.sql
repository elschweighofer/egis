-- Query 2
-- Compute and display the trajectories of the ships covering the route between the **your port** and Goteborg. 
-- If you where assigned Goteborg, use Helsinborg as the other port.
-- HELSINGBORG to goteborg


SELECT -- -- HELSINGBORG port
 harbour
1 as id, ST_MakeEnvelope(-- 5 ints tbd--)
as g
UNION ALL
SELECT -- goteborg port
2 as id, ST_MakeEnvelope(-- 5 ints tbd--)
as g