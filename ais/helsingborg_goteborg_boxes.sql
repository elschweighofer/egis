SELECT -- Helsingborg port
1 as id, ST_MakeEnvelope(728000, 6218000, 730000, 6213300, 25832)
as g
UNION ALL
SELECT -- Goteborg port
2 as id, ST_MakeEnvelope(660000, 6390000, 675000, 6400000, 25832)
as g