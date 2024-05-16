# Project Part I: AIS
In the file ProjectAssignment.xls you will find the dates you will work with. You must download the data for the date indicated for you. Data must be down- loaded from https://web.ais.dk/aisdata/. In the file you will also find the city you will work with, when indicated in the query. You must determine the bounding box of the city ports. The SRID is the one in the assignment, since we work with data from the Danish Maritime Authority.
2.1 Description
Exercise 1. Write in SQL the following queries.
Query 1 Compute and display the trajectories of the ships in Denmark and
Sweden on the date indicated to you.
Query 2 Compute and display the trajectories of the ships covering the route between the **your port** and Goteborg. If you where assigned Goteborg, use Helsinborg as the other port.
Query 3 Compute and display the trajectories of the ships that enter or leave **your port**. You must be able to distinguish the incoming and outgoing trips.
Query 4 Compute and display the vessel activity in an area close to **your port** (you choose it), defining an alert belt region.
Query 5 Compute and display the shortest distance between any two ships when- ever this distance was less than five hundred meters, within the belt defined in the previous query.
Query 6 Compute and display the ships that were at least 300 m from each other. Check if this also occurred within **your port**.
Query 7 Take **your port** and any five other ones. Compute the number of trips passing through these ports, and use some graphic mechanism (colour, shape, size, etc) to indicate that number. For example, if you use colour, use different intensities to indicate the variation from the most to the least crowded port.



## My port
20.5.23	HELSINGBORG

# Opensky
28.03.2022 Germany

In the file ProjectAssignment.xls you will find the dates you will work with. You must download the data for the date indicated for you. Data must be down- loaded from https://opensky-network.org/datasets/states/. In the file you will also find the country you will work with, when indicated in the query. You must de- termine the bounding box of the country and the corresponding SRID and the type of projection for that SRID.
Exercise 2. Write in SQL the following queries.
Query 1 Compute and display the flights over **your country** between 8:00
a.m and 9:00 a.m.
Query 2 Compute and display the flights taking-off in **your country** be- tween 8 a.m. and 9 a.m.
Query 3 Choose the capital cities (say A and B) of two neighbouring countries of **your country**. Compute and display the trips between A, B, and the capital city of **your country**.
Query 4 Choose two aircraft that have passed over **your country**, and com- pute the minimum distance they have been from each other, and when this oc- curred. Also draw the aircraft routes for the whole day.
Query 5 Compute the routes of the flights taking-off in the capital city of **your country** and display the routes in a map, defining a bounding box for the capital city.
Query 6 Compute and display the flights landing in **your country** between 8 a.m. and 9 a.m. and between 6 p.m and 7 p.m. Display them in different colours to be able to compare them.
Query 7 Compute and display the flights cruising over **your country** at an altitude between 5,000 meters and 10,000 meters. Display them in different colors to be able to compare them.