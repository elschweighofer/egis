-- Compute and display the shortest distance between any two ships whenever this distance was less than five hundred meters
-- within the belt defined in the previous query.
WITH CloseShips AS(
    SELECT s1.MMSI as b1,
        s1.traj as T1,
        s2.MMSI as b2,
        s2.traj as T2,
        s1.trip | = | s2.trip as smalldist
    FROM Ships s1,
        Ships s2
    WHERE s1.mmsi < s2.mmsi
        and edwithin(s1.trip, s2.trip, 500)
),
AlertBelt(belt) AS(
    SELECT ST_MakeEnvelope(726000, 6210000, 730000, 6218000, 25832)
)
SELECT c.b1,
    c.b2,
    c.T1,
    c.T2,
    a.belt
FROM CloseShips c,
    AlertBelt a
WHERE ST_Intersects(c.T1, alert.belt)
    AND ST_Intersects(c.T2, alert.belt)