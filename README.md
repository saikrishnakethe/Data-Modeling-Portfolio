# 📊 Data Modeling Portfolio

This repository showcases my collection of **end-to-end data models** designed across multiple domains.  
Each model is documented with **ERD diagrams, schema definitions, and detailed explanations** of business context, design decisions, and trade-offs (Star Schema, Snowflake Schema, 3NF, Denormalization, SCD handling).  

These models demonstrate my ability to design **scalable, efficient, and business-driven data warehouses and databases**.  

---

## 📁 Models Included

### 1. Retail Sales (Star Schema)
- **Fact**: Sales Fact (measures: sales amount, quantity, discount)  
- **Dimensions**: Customer, Store, Product, Date  
- **Why Star Schema?** Optimized for OLAP reporting and dashboards like sales by region, top-selling products, etc.  
- **Use Case**: Retail analytics – revenue trends, customer purchase patterns.

---

### 2. Uber Trips (SCD Type 2)
- **Fact**: Trip Fact (trip id, start time, end time, distance, fare)  
- **Dimensions**: Driver (with SCD2 history), Rider (SCD2), Date  
- **Why SCD2?** Captures historical driver/rider profile changes (e.g., address, license, rating).  
- **Use Case**: Historical trip analysis, loyalty programs, driver performance over time.

---

### 3. Healthcare Model (Hybrid: Normalized + Star)
- **Normalized**: Patient, Doctor, Hospital tables for OLTP consistency  
- **Fact**: Visit Fact (patient visits, diagnoses, prescriptions)  
- **Dimensions**: Patient, Doctor, Date, Treatment  
- **Why Hybrid?** OLTP-like patient master + OLAP-ready visit facts.  
- **Use Case**: Patient care history, doctor workload analysis, hospital visit trends.

---

### 4. Product Catalog (Snowflake Schema)
- **Fact**: Product Sales Fact  
- **Dimensions**: Product → Subcategory → Category (normalized hierarchy), Supplier, Date  
- **Why Snowflake?** Reduces redundancy, enforces consistency in product hierarchy.  
- **Use Case**: E-commerce catalog analysis, multi-level category sales reporting.

---

### 5. Netflix Watch Data (Denormalized)
- **Fact (wide table)**: User ID, Movie/Show, Device, Watch Duration, Region  
- **Why Denormalized?** Speeds up query performance for high-volume streaming analytics.  
- **Use Case**: Real-time viewing trends, recommendations, binge behavior analysis.  
- **Trade-off**: Storage-heavy but query-optimized.

---

### 6. Banking Hybrid Model
- **Normalized**: Account Master, Customer Master for OLTP transactions  
- **Fact**: Transaction Fact (debits, credits, balance changes)  
- **Dimensions**: Account, Branch, Date  
- **Why Hybrid?** Ensures consistency of account master data while supporting analytical queries.  
- **Use Case**: Fraud detection, customer transaction patterns, regulatory reporting.

---

### 7. Course Platform User Engagement (Star Schema)
- **Fact**: Engagement Fact (video views, quiz attempts, course completions)  
- **Dimensions**: User, Course, Activity Type, Date  
- **Why Star Schema?** Supports fast engagement analysis across dimensions.  
- **Use Case**: Learning progress tracking, course popularity analysis, student retention metrics.

---

## 🛠️ Tools & Technologies Used
- **Modeling**: [dbdiagram.io](https://dbdiagram.io/)  
- **Databases**: PostgreSQL  
- **References**: Kimball Toolkit, Vertabelo Blog, SQLBI Guides, Snowflake Docs  

---

## 📌 Structure of Each Model
Each folder contains:
- `schema.dbml` → DBML code for reproducibility in dbdiagram.io  
- `schema.png` → ERD diagram for visualization  
- `description.md` → Context, design decisions, DDL examples, and example queries  

---

## 🎯 How This Portfolio Helps
- Demonstrates **data modeling expertise** across multiple industries  
- Covers **different modeling techniques**: Star, Snowflake, 3NF, Denormalization, Hybrid, SCD Type-2  
- Provides **real-world use cases** for each model  
- Ready-to-use ERDs and schemas for interview discussions  

---

## 📬 Contact
👤 Sai Krishna +91 6302810779 
🔗 [LinkedIn](www.linkedin.com/in/kette-sai-krishna-bab25a214)  
💡 Passionate about building scalable and efficient data pipelines.
