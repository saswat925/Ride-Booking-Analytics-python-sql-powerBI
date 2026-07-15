--1. Booking Analysis (Basic KPIs) ⭐
-- Total Bookings
SELECT COUNT(*) AS Total_Bookings
FROM bookings;--103024

-- Total Revenue = 56 million
SELECT round(SUM(Booking_Value)/1000000,2) AS Total_Revenue_in_Million
FROM bookings;

-- Average Booking Value = 548
SELECT AVG(Booking_Value) AS Avg_Booking_Value
FROM bookings;

--2. Booking Status Analysis
SELECT
    Booking_Status,
    COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Booking_Status
ORDER BY Total_Bookings DESC;
--Booking_Status	Total_Bookings
--Success	            63967
--Canceled by Driver	18434
--Canceled by Customer	10499
--Driver Not Found	    10124

--Successful Booking Rate
--Success: 63,967 bookings
--Total bookings: 103,024
--Success Rate ≈ 62.1%

---3. Vehicle Type Analysis
SELECT
    Vehicle_Type,
    COUNT(*) AS Total_Bookings,
    round(SUM(Booking_Value)/1000000,2) AS Revenue_million
FROM bookings
GROUP BY Vehicle_Type
ORDER BY Revenue_million DESC;
--Insight 1
--Prime Sedan (14,877 bookings) and eBike (14,816 bookings) generated the highest number of bookings and approximately ₹8 million in revenue, making them the top-performing vehicle categories.
--Insight 2
--Revenue across all vehicle types ranges between ₹7–8 million, indicating a well-balanced demand with no heavy dependence on a single vehicle category. This reflects effective fleet utilization across the business.

--Vehicle_Type	Total_Bookings	Revenue_million
--eBike	          14816	                  8
--Prime Sedan	  14877	                  8
--Prime Plus	  14707	                  8
--Auto	          14755	                  8
--Mini	          14552	                  7
--Prime SUV	      14655	                  7
--Bike	          14662	                  7

---4. Payment Method Analysis
SELECT
    Payment_Method,
    COUNT(*) AS Total_Bookings,
    SUM(Booking_Value) AS Revenue
FROM bookings
GROUP BY Payment_Method
order by Revenue  desc;
---Insight 1
--'Not Applicable' is the most frequent payment category with 39,057 bookings and ₹21.45 million in revenue. This should be investigated, as it may represent cash rides, canceled bookings, or missing payment information.
--Insight 2
--Among the valid payment methods, Cash is the most preferred option with 35,022 bookings and ₹19.26 million in revenue, followed by UPI with 25,881 bookings and ₹14.17 million in revenue, showing that digital payments are also widely adopted.


--5. Location Analysis
--Top Pickup Locations
SELECT TOP 10
    Pickup_Location,
    COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Pickup_Location
ORDER BY Total_Bookings DESC;
--Highly Balanced Demand: Total bookings are incredibly uniform across the top 10 locations, with less than a 5% variance (just 101 bookings) separating the highest-performing zone, Banashankari, from the tenth, Cox Town.
--Broad Geographic Spread: High-volume ride demand is decentralized rather than concentrated in a single tech hub, spanning distinct residential and commercial clusters across South, North, East, and West Bengaluru.

--Top Drop Locations
SELECT TOP 10
    Drop_Location,
    COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Drop_Location
ORDER BY Total_Bookings DESC;
--Industrial and Transit Dominance: Major industrial and arterial transit hubs lead the drop-off demand, with Peenya and Mysore Road securing the top two positions over traditional commercial zones.
--Remarkably Uniform Distribution: Similar to the pickup data, drop-off volumes are highly distributed and consistent, showing a tiny 2.8% drop (just 62 bookings) from the top-ranked destination to the tenth.

--6. Rating Analysis
--Average Customer Rating = 4
SELECT
ROUND(AVG(Customer_Rating),2) AS Avg_Customer_Rating
FROM bookings;
--Average Driver Rating = 4
SELECT
ROUND(AVG(Driver_Ratings),2) AS Avg_Driver_Rating
FROM bookings;

--7. Ride Distance Analysis
--Total Distance = 1461903
SELECT
SUM(Ride_Distance) AS Total_Distance
FROM bookings;
--Average Distance = 14
SELECT
ROUND(AVG(Ride_Distance),2) AS Avg_Distance
FROM bookings;
--Vehicle-wise Distance
SELECT
Vehicle_Type,
SUM(Ride_Distance) AS Total_Distance
FROM bookings
GROUP BY Vehicle_Type
ORDER BY Total_Distance DESC;
---Vehicle_Type	     Total_Distance
--Prime Sedan	        234535
--eBike	                230842
--Bike	                227746
--Prime Plus	        227186
--Mini	                225703
--Prime SUV	            223848
--Auto	                92043

---Premium and Two-Wheeler Dominance: High-tier cabs (Prime Sedan/Plus) and efficient two-wheelers (eBike/Bike) drive the vast majority of total distance traveled, remaining highly competitive and tightly clustered above 220,000 km each.
--Short-Haul Auto Usage: Despite being heavily favored for urban commuting, Autos account for less than half the distance of any individual car or bike tier, highlighting their primary deployment for short, hyper-local trips.


--8. Cancellation Analysis
--Customer Cancelled =10499
SELECT
COUNT(*) AS Customer_Cancelled
FROM bookings
WHERE Booking_Status='Canceled by Customer';
--Driver Cancelled =18434
SELECT
COUNT(*) AS Driver_Cancelled
FROM bookings
WHERE Booking_Status='Canceled by Driver';
--Cancellation Percentage = 28.08
SELECT
ROUND(100.0* SUM(CASE WHEN Booking_Status IN
('Canceled by Customer','Canceled by Driver')
THEN 1 ELSE 0 END)/COUNT(*),2) AS Cancellation_Percentage
FROM bookings;
--9. Time Analysis
--Daily Bookings
SELECT
Date,
COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Date
ORDER BY Date;
--Monthly Revenue
SELECT
DATENAME(MONTH,Date) AS Month_Name,
SUM(Booking_Value) AS Revenue
FROM bookings
GROUP BY DATENAME(MONTH,Date),
MONTH(Date)
ORDER BY MONTH(Date);
--Peak Booking Hours
SELECT
CASE
WHEN DATENAME(WEEKDAY,Date) IN ('Saturday','Sunday')
THEN 'Weekend'
ELSE 'Weekday'
END AS Day_Type,
COUNT(*) AS Total_Bookings,
SUM(Booking_Value) AS Revenue
FROM bookings
GROUP BY
CASE
WHEN DATENAME(WEEKDAY,Date) IN ('Saturday','Sunday')
THEN 'Weekend'
ELSE 'Weekday'
END;
--Day_Type	Total_Bookings	Revenue
--Weekday	76670	        42181289
--Weekend	26354	        14353325