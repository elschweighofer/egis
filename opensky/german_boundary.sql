SELECT row_number() over () AS _uid0_, * FROM (
SELECT -- Germanbox
1 as id, ST_MakeEnvelope(6, 47, 15, 55, 4326)
as g
) AS _subq_0_
