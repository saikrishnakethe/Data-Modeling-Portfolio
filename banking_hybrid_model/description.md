# Banking Hybrid Model (Normalized + Transaction Fact)

This **Banking Hybrid Model** balances **normalization** for master data and **denormalization for analytical speed** via a fact table.

---

## 🔹 Design Decisions

### 1. Customers (Normalized)
- Stores detailed demographic and contact data.  
- Fully normalized to avoid duplication.  
- Tracks audit fields (`created_at`, `updated_at`).  

### 2. Branches (Normalized)
- Holds bank branch data.  
- Includes region, manager info → helps with regional performance analysis.  

### 3. Accounts (Normalized but linked to Fact)
- Bridge between customers and branches.  
- Holds account-specific metadata (type, status, interest_rate).  

### 4. Transactions_Fact (Fact Table)
- Central **Fact Table** for analytics.  
- Stores all transactional activity (credit, debit, loan_payment).  
- Includes channel and merchant → supports behavioral analytics.  

### 5. Employees (Normalized)
- Employees tied to a branch.  
- Helps with HR + performance reporting.  

---

## 🔹 Data Modeling Concepts
- **Hybrid Design** → Master data normalized, transaction fact denormalized.  
- **Fact Table** → Transactions form the fact for banking analytics.  
- **Surrogate Keys** → Ensures consistency, indexing, SCD readiness.  
- **Reference Separation** → All relationships are defined **at the end of schema** for clarity.  
- **Practical Scope** → Avoided currencies and multi-level hierarchies to keep model readable.  
