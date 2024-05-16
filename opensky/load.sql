DO
$$DECLARE
prefixpath text= '/Users/lukas/fhmse/MDA/workspace/opensky/opensky_csv/states_2022-03-28-';
path text;
BEGIN
FOR rec in 0..23 LOOP
path:= prefixpath || trim(to_char(rec, '09')) ||
'.csv'; -- fill with 0s
EXECUTE format('COPY flights(et, icao24, lat, lon,
velocity, heading, vertrate, callsign,
onground, alert, spi, squawk, baroaltitude,
geoaltitude, lastposupdate, lastcontact)
FROM %L WITH DELIMITER '','' CSV HEADER', path);
COMMIT;
Raise Notice 'inserting %', path;
END LOOP;
END
$$;