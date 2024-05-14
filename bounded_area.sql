--clean
ALTER TABLE AISInput
DROP COLUMN geom
-- modify ; 25832 is denmark - 4326 for worldwide
ALTER TABLE AISInput
ADD COLUMN geom geometry(Point, 25832)
-- check
SELECT Find_SRID('public', 'aisinput', 'geom');