# Netflix Watch Data Model (Denormalized)

## Overview
This model captures **user watch events for Netflix-like streaming analytics**.  
It is **denormalized**, storing key user, content, and device details directly in the fact table to improve query performance.

---

## Fact Table: `watch_fact`
- Central fact table storing every watch event.
- Measures include:
  - `duration_min` – Watch duration in minutes
  - `completed_flag` – Whether content was watched fully
  - `binge_flag` – Multiple episodes watched consecutively
- Denormalized dimensions:
  - `subscription_plan`, `country`, `city` from `users`
  - `content_genre`, `content_type` from `content`
- Optimized for **analytics queries without heavy joins**

---

## Dimension Tables

1. **Users**
   - Stores personal info, subscription, location.
   - Surrogate key used for analytics and SCD handling if needed.

2. **Content**
   - Stores movies, series, documentaries with attributes.
   - Surrogate key for analytics.

3. **Devices**
   - Stores device type and OS details.

---

## Key Features
- **Denormalization** reduces join complexity and speeds up queries.  
- Fact table captures **time-series watch metrics**.  
- Supports KPIs like average watch duration, completion rate, binge sessions, popular genres.  
- Surrogate keys make **SCD handling and historical tracking** easier.  
- Model is **moderately complex** – interview-ready and production-analytical ready.
