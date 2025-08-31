# Healthcare Data Model with SCD Type 2

## Overview
This healthcare model captures **patient visits, doctor activities, and hospital performance** using a **Star Schema** with a Visit Fact table.  
It includes **historical tracking** using **SCD Type 2** and **surrogate keys** for dimension uniqueness.

---

## Fact Table: `visit_fact`
- Each row represents a **single patient visit**.  
- Measures:
  - `total_fee`  
- References all dimensions: Patient, Doctor, Hospital, Diagnosis Codes, Treatments, Visit Status.  
- Timestamps allow analytics by visit period.

---

## Dimension Tables

1. **Patients**
   - Tracks patient personal info, location, and insurance.  
   - Implements **SCD Type 2**: `start_date`, `end_date`, `current_flag` for historical changes.  
   - Surrogate key: `patient_sk`.  
   - Natural key: `patient_id` for source reference.  

2. **Doctors**
   - Tracks specialization, department, and location.  
   - Implements **SCD Type 2**: `start_date`, `end_date`, `current_flag`.  
   - Surrogate key: `doctor_sk`.  
   - Natural key: `doctor_id`.  

3. **Hospitals**
   - Stores basic location and contact information.  
   - No SCD required (can add if needed).  

4. **Diagnosis Codes**
   - Standardized codes for diseases or conditions.  

5. **Treatments**
   - Stores treatment/procedure details with category.  

6. **Visit Status**
   - Tracks visit lifecycle: COMPLETED, CANCELLED, PENDING.

---

## Key Features
- Surrogate keys in all dimensions for uniqueness.  
- SCD Type 2 implemented for dimensions where history matters (Patients, Doctors).  
- Star Schema ensures analytical performance.  
- Ready for queries like revenue per doctor, patient visit trends, treatment analysis, and historical reporting.  
