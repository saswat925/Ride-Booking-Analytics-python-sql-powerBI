# Ride Booking Analytics Dashboard | End-to-End ETL Project

## Project Overview

This project demonstrates an end-to-end Data Analytics pipeline using Python, SQL Server, and Power BI. The objective was to analyze ride booking transactions and generate actionable business insights related to booking performance, customer behavior, payment patterns, ride operations, and service quality.

The project covers the complete analytics lifecycle:

* Data Cleaning and Validation using Python
* ETL Pipeline using SQL Server
* Stored Procedures for Data Loading
* SQL Analysis using 25+ Business Queries
* Interactive Dashboard Development using Power BI
* Business Insights and KPI Reporting

---

## Tech Stack

| Technology            | Usage                      |
| --------------------- | -------------------------- |
| Python                | Data Cleaning & Validation |
| Pandas                | Data Transformation        |
| SQL Server 2022       | Database & ETL             |
| SQL Stored Procedures | Automated Data Loading     |
| Power BI Desktop      | Dashboard Development      |
| GitHub                | Version Control            |

---

## Dataset Information

| Metric        | Value                         |
| ------------- | ----------------------------- |
| Total Records | 103,024                       |
| Period        | July                          |
| Source        | Ride Booking Transactions     |
| Columns       | 22                            |
| Data Type     | Structured Transactional Data |

### Dataset Columns

* Date
* Time
* Booking_ID
* Booking_Status
* Customer_ID
* Vehicle_Type
* Pickup_Location
* Drop_Location
* V_TAT
* C_TAT
* Canceled_Rides_by_Customer
* Canceled_Rides_by_Driver
* Incomplete_Rides
* Incomplete_Rides_Reason
* Booking_Value
* Payment_Method
* Ride_Distance
* Driver_Ratings
* Customer_Rating
* booking_day
* booking_hour
* time_slot

---

## Project Architecture

```text
Excel Dataset
      │
      ▼
Python (Jupyter Notebook)
      │
      ├── Data Cleaning
      ├── Null Handling
      ├── Data Validation
      ├── Data Type Conversion
      └── Feature Engineering
      │
      ▼
SQL Server
      │
      ├── stg_bookings
      ├── bookings
      ├── Stored Procedure
      └── SQL Analysis
      │
      ▼
Power BI Dashboard
      │
      └── Business Insights
```

---

## Python ETL Process

### Data Cleaning Steps

* Loaded Excel dataset using Pandas.
* Checked missing values.
* Removed duplicates.
* Performed datatype conversions.
* Validated records.
* Created derived columns:

  * booking_day
  * booking_hour
  * time_slot

### Feature Engineering

| Column       | Description                        |
| ------------ | ---------------------------------- |
| booking_day  | Day Name                           |
| booking_hour | Hour extracted from booking time   |
| time_slot    | Morning, Afternoon, Evening, Night |

---

## SQL Server Implementation

### Database

```sql
CREATE DATABASE Ride_Booking_ETL;
```

### Tables

* stg_bookings
* bookings

### Stored Procedure

```sql
CREATE OR ALTER PROCEDURE usp_Load_Bookings
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE bookings;

    INSERT INTO bookings
    SELECT *
    FROM stg_bookings;
END;
```

### SQL View

```sql
CREATE VIEW view_Bookings AS
SELECT *
FROM bookings;
```

---

## SQL Analysis

The project includes 25+ SQL queries covering:

### Booking Analysis

* Total Bookings
* Total Revenue
* Average Booking Value

### Vehicle Analysis

* Revenue by Vehicle Type
* Vehicle-wise Distance

### Payment Analysis

* Revenue by Payment Method
* Payment Distribution

### Location Analysis

* Top Pickup Locations
* Top Drop Locations

### Rating Analysis

* Average Customer Rating
* Average Driver Rating

### Time Analysis

* Peak Booking Hours
* Time Slot Analysis
* Daily Booking Trends
* Revenue by Day

### Operational Analysis

* Success Rate
* Cancellation Rate
* Driver Not Found Analysis

---

## Power BI Dashboard

### KPIs

| KPI                     |
| ----------------------- |
| Total Bookings          |
| Total Revenue           |
| Total Distance          |
| Success %               |
| Cancellation %          |
| Average Customer Rating |
| Average Driver Rating   |

### Visualizations

| Visual       | Description                 |
| ------------ | --------------------------- |
| Card         | Total Bookings              |
| Card         | Total Revenue               |
| Card         | Success %                   |
| Card         | Cancellation %              |
| Line Chart   | Daily Booking Trend         |
| Column Chart | Revenue by Day              |
| Donut Chart  | Booking Status Analysis     |
| Bar Chart    | Revenue by Vehicle Type     |
| Donut Chart  | Payment Method Analysis     |
| Bar Chart    | Top Pickup Locations        |
| Bar Chart    | Top Drop Locations          |
| Column Chart | Peak Booking Hours          |
| Column Chart | Time Slot Analysis          |
| Table        | Vehicle Performance Summary |

---

## Dashboard Slicers

* Booking Day
* Booking Status
* Vehicle Type
* Payment Method
* Pickup Location
* Drop Location
* Time Slot

---

## Key Business Insights

### Operational Performance

* The platform completed 103K bookings and generated ₹56.5M in revenue during July.

### Service Reliability

* Booking Success Rate: 62%
* Cancellation Rate: 28%

### Vehicle Performance

* Prime Sedan generated the highest revenue (₹8.3M).
* eBike was the second best-performing category (₹8.2M).

### Payment Analysis

* Cash and UPI remain the preferred payment methods.
* "Not Applicable" payments indicate potential canceled rides or missing payment information.

### Customer Experience

* Average Customer Rating: 4.0/5
* Average Driver Rating: 4.0/5

### Time Analysis

* Night is the busiest time slot with 34.3K bookings.

### Location Analysis

Top Pickup Locations:

* Sarjapur Road
* Vijayanagar
* Shivajinagar

Top Drop Locations:

* Peenya
* Mysore Road
* MG Road

---

## Project Metrics

| Metric              | Value         |
| ------------------- | ------------- |
| Total Bookings      | 103,024       |
| Total Revenue       | ₹56.5 Million |
| Total Distance      | 1 Million     |
| Success Rate        | 62%           |
| Cancellation Rate   | 28%           |
| Avg Customer Rating | 4.0           |
| Avg Driver Rating   | 4.0           |

---

## Repository Structure

```text
Ride-Booking-Analytics/
│
├── Data/
│   └── Ride_Booking.xlsx
│
├── Python/
│   └── Bookings_Data_Cleaning.ipynb
│
├── SQL/
│   ├── store_procedure_Ride_booking.sql
│   └── Analysis_Part_Ride_booking.sql
│
├── PowerBI/
│   └── Ride_Booking_Dashboard.pbix
│
├── Dashboard/
│   └── ride_booking.pdf
│
└── README.md
```

---

## Conclusion

This project successfully demonstrates an end-to-end data analytics workflow using Python, SQL Server, and Power BI. The dashboard provides actionable insights into booking trends, customer behavior, operational performance, and service quality, enabling data-driven decision-making for ride booking businesses.

---

## Author

**Saswat Betta Aptakam**

* Role: Data Analyst
* Skills: Python, SQL Server, Power BI, Excel, Pandas
* Location: Bhubaneswar, Odisha, India
