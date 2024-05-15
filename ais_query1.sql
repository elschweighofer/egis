-- Compute and display the trajectories of the ships in Denmark and
--Sweden on the date indicated to you.

-- clean outliers
DELETE FROM Ships
WHERE length(Trip) = 0 OR length(Trip) >= 1500000;
-- Run in qgis, mmsi unique columnn, traj geometry column
SELECT mmsi, traj
FROM ships
-- date is handled by loading only the csv from my date 20.5.23	