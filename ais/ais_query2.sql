-- Query 2
-- Compute and display the trajectories of the ships covering the route between the **your port** and Goteborg. 
-- If you where assigned Goteborg, use Helsinborg as the other port.
-- HELSINGBORG to goteborg
WITH Ports(Helsingborg, Goteborg) AS (
    SELECT ST_MakeEnvelope(728000, 6218000, 730000, 6213300, 25832),
        ST_MakeEnvelope(660000, 6390000, 675000, 6400000, 25832)
)
SELECT S.*,
    Helsingborg,
    Goteborg
FROM Ports P,
    Ships S
WHERE eintersects(S.Trip, P.Helsingborg)
    AND eintersects(S.Trip, P.Goteborg)

-- There actually are none on that day