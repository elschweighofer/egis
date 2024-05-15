SELECT -- Helsingborg port
1 as id, ST_MakeEnvelope(729691, 6216949, 730091, 6217349, 25832)
as g
UNION ALL
SELECT -- Goteborg port
2 as id, ST_MakeEnvelope(671606, 6397400, 672206, 6398000, 25832)
as g