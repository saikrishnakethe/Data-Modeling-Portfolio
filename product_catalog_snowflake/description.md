# Product Catalog Data Model (Snowflake Schema)

## Overview
This product catalog model is designed to manage a **hierarchical product inventory** with suppliers and stock analytics.  
It uses a **Snowflake Schema**, breaking down categories into subcategories and products, with an inventory fact table to capture stock levels and pricing.

---

## Fact Table: `inventory_fact`
- Stores **inventory metrics per product per supplier**.  
- Measures include:
  - `stock_qty` – Current stock
  - `reorder_level` – Minimum stock threshold
  - `cost_price` – Supplier price
  - `selling_price` – Retail price
- Can be used to calculate KPIs like stock turnover, supplier performance, and potential revenue.

---

## Dimension Tables

1. **Categories**
   - Top-level product categories.  
   - Supports **multi-level hierarchy** using `parent_category_id`.

2. **Subcategories**
   - Each subcategory belongs to a parent category.  
   - Allows more granular analytics per product line.

3. **Products**
   - Stores product attributes, brand, weight/unit, and description.  
   - Surrogate key used for analytical purposes.  
   - Business key `product_sku` ensures uniqueness in source systems.

4. **Suppliers**
   - Stores supplier contact and location info.  
   - Enables supplier-based analytics for inventory and procurement.

---

## Key Features
- **Snowflake Schema** improves storage efficiency and normalization.  
- **Fact table** captures metrics necessary for inventory and revenue calculations.  
- **Hierarchical categories** allow deep drill-down reporting.  
- Surrogate keys and timestamps allow **SCD Type 2 tracking** if needed.  
- Model is **extendable** for sales, promotions, or order history integration.
