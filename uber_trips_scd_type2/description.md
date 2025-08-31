# Uber Trips SCD Type 2 Data Model

## Overview
This Uber Trips data model captures **trip-level transactions** and tracks historical changes in **Driver and Rider profiles** using **SCD Type 2**.  
It supports analytics such as revenue, trip distances, rider/driver performance, and payment trends.

---

## Fact Table: `trips_fact`
- Captures **all trip metrics**:
  - `trip_distance_km`
  - `trip_duration_min`
  - `base_fare`
  - `surge_multiplier`
  - `tip_amount`
  - `total_amount`
- References dimensions: Drivers, Riders, Vehicles, Trip Status, Payment Methods.

### Dimension Tables

1. **Drivers** (SCD Type 2)
   - Tracks historical driver details and vehicle assignment.
   - Surrogate key, start/end dates, and active_flag maintain historical versions.
   - Includes **ratings** and **total trips** for analytics.

2. **Riders** (SCD Type 2)
   - Tracks historical rider profile changes.
   - Surrogate key, start/end dates, active_flag, ratings, and total trips for engagement analytics.

3. **Vehicles**
   - Contains vehicle details with **capacity**, make, model, license plate.
   - Helps analyze trip distribution by vehicle type.

4. **Trip Status**
   - Stores possible trip states: COMPLETED, CANCELLED, PENDING.
   - Useful for performance and SLA reporting.

5. **Payment Methods**
   - Contains method and provider information.
   - Enables analysis by payment trends and provider performance.

---

## Key Features
- **SCD Type 2 Implementation** for Drivers and Riders.
- **Surrogate Keys** to track historical versions without overwriting.
- **Fact Table** aggregates all trip-level metrics for analytics.
- **Meaningful Dimensions** support revenue, performance, and engagement reporting.
- Model is **ready for dashboards, OLAP queries, and advanced analytics**.
