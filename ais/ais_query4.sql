--Compute and display the vessel activity in an area close to Helsingborg
-- (you choose it), defining an alert belt region.

SELECT row_number() over () AS _uid1_, * FROM (SELECT row_number() over () AS _uid0_, * FROM (WITH Alertbelt(belt) AS (
    SELECT ST_MakeEnvelope(726000, 6210000, 730000, 6218000, 25832)
)
SELECT 
activity.*,
alert.belt
FROM aisinputfiltered3 as activity, Alertbelt as alert
WHERE ST_Intersects(activity.geom, alert.belt)
) AS _subq_0_

) AS _subq_1_
