SELECT -- Helsingborg port
1 as id, ST_MakeEnvelope(729691, 6216949, 730091, 6217349, 25832)
as g
UNION ALL
SELECT -- Goteborg port
2 as id, ST_MakeEnvelope(660000, 6390000, 675000, 6400000, 25832)
as g