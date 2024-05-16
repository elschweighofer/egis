-- !! datestyle
SET datestyle TO postgres, dmy;
--
COPY AISInput(
    T,
    TypeOfMobile,
    MMSI,
    Latitude,
    Longitude,
    NavigationalStatus,
    ROT,
    SOG,
    COG,
    Heading,
    IMO,
    CallSign,
    Name,
    ShipType,
    CargoType,
    Width,
    Length,
    TypeOfPositionFixingDevice,
    Draught,
    Destination,
    ETA,
    DataSourceType,
    SizeA,
    SizeB,
    SizeC,
    SizeD
)
FROM '/Users/lukas/fhmse/MDA/workspace/ais/aisdk-2023-05-20.csv' DELIMITER ',' CSV HEADER;