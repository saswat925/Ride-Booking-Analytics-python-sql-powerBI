CREATE DATABASE Ride_Booking_ETL;
GO

use Ride_Booking_ETL;
go

--verify
SELECT COUNT(*) AS Total_Rows
FROM stg_bookings;--103024 rows

--Check Sample Data
SELECT TOP 10 *
FROM stg_bookings;
--Create Final Table
SELECT *
INTO bookings
FROM stg_bookings
WHERE 1 = 0;
--Create Stored Procedure
CREATE OR ALTER PROCEDURE usp_Load_Bookings
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE bookings;

    INSERT INTO bookings
    SELECT *
    FROM stg_bookings;

    PRINT 'Data Loaded Successfully';
END;
GO
---Execute Stored Procedure
EXEC usp_Load_Bookings;
--Verify Final Table
SELECT COUNT(*) AS Total_Rows
FROM bookings;

select * from bookings;    

 ---create view_bookings for power BI
 CREATE VIEW view_Bookings AS
SELECT
    Date,
    Time,
    Booking_ID,
    Booking_Status,
    Customer_ID,
    Vehicle_Type,
    Pickup_Location,
    Drop_Location,
    V_TAT,
    C_TAT,
    Canceled_Rides_by_Customer,
    Canceled_Rides_by_Driver,
    Incomplete_Rides,
    Incomplete_Rides_Reason,
    Booking_Value,
    Payment_Method,
    Ride_Distance,
    Driver_Ratings,
    Customer_Rating,
    booking_day,
    booking_hour,
    time_slot
FROM bookings;


--verify view table
select * from view_Bookings










