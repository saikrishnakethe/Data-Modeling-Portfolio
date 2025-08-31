# Retail Sales Star Schema

## Overview
This enhanced Retail Sales Star Schema is designed for **OLAP analytics** on sales data.  
It now includes **Time and Promotion dimensions** to enable more sophisticated reporting and historical analysis.

---

## Schema Structure

### Fact Table: `sales_fact`
- Contains transactional sales data at the **granularity of a single sale**.  
- Measures include:
  - `quantity`
  - `unit_price`
  - `total_amount`  
- References all relevant dimensions: Customer, Store, Product, Date, Promotion.

### Dimension Tables:

1. **Customers**
   - Stores customer demographic information (name, email, location, DOB).  
   - Enables segmentation by location, gender, or age groups.

2. **Stores**
   - Contains store details like location and opening date.  
   - Enables analysis by city, state, or store-specific performance.

3. **Products**
   - Contains product details and hierarchy (category → sub-category).  
   - Enables analysis by product, category, manufacturer.

4. **Dates**
   - Time dimension with day, month, quarter, year, day_of_week, is_weekend.  
   - Enables **time-series analysis**, monthly/quarterly aggregation, seasonality detection.

5. **Promotions**
   - Tracks promotional campaigns applied to sales.  
   - Includes discount percentage, start/end dates, and description.  
   - Useful for measuring **promotion effectiveness** and **incremental sales impact**.

---

## Why Star Schema?
- **Simplicity**: Fact table surrounded by dimension tables. Easy for reporting and queries.  
- **Performance**: Aggregations and joins are faster because dimension tables are denormalized.  
- **Use Case**: Dashboards like:
  - Total sales by store and month
  - Revenue by product category and promotion
  - Customer purchase behavior during campaigns
  - Time-series analysis and trend detection
