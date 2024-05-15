-- Query 2
-- Compute and display the trajectories of the ships covering the route between the **your port** and Goteborg. 
-- If you where assigned Goteborg, use Helsinborg as the other port.
-- HELSINGBORG to goteborg
WITH Ports(Helsingborg, Goteborg) AS (
    SELECT ST_MakeEnvelope(729691, 6216949, 730091, 6217349, 25832),
        ST_MakeEnvelope(671606, 6397400, 672206, 6398000, 25832)
)
SELECT S.*,
    Helsingborg,
    Goteborg
FROM Ports P,
    Ships S
WHERE eintersects(S.Trip, P.Helsingborg)
    AND eintersects(S.Trip, P.Goteborg)