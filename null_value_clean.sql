UPDATE AISInput
SET
NavigationalStatus = CASE NavigationalStatus
WHEN 'Unknown value' THEN NULL END,
IMO = CASE IMO WHEN 'Unknown' THEN NULL END,
ShipType = CASE ShipType WHEN 'Undefined' THEN NULL END,
TypeOfPositionFixingDevice = CASE TypeOfPositionFixingDevice
WHEN 'Undefined' THEN NULL END,
Geom = ST_Transform(ST_SetSRID(ST_MakePoint(Longitude,
Latitude), 4326), 25832)
WHERE latitude between 40.18 and 84.73 AND
longitude between -16.1 AND 32.88