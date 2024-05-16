SELECT
NavigationalStatus,
IMO,
ShipType,
TypeOfPositionFixingDevice,
geom
FROM AISInput
WHERE latitude between 40.18 and 84.73 AND
longitude between -16.1 and 32.88
LIMIT 10