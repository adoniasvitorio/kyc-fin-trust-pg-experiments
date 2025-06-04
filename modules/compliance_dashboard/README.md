# KYC Compliance Dashboard Module

This module provides a consolidated view of customer KYC (Know Your Customer) status for compliance and risk analysis purposes.  
It calculates an overall status per customer based on results from other KYC modules, such as sanctions checks and risk scoring.

The final status can be:

- `approved`: No red flags detected
- `pending`: High risk but not sanctioned
- `rejected`: Sanctioned or blocked

---

## Features

- Aggregates data from multiple KYC sources (sanctions, risk score)
- Generates a status for each customer based on defined rules
- Stores results in a status table with update timestamps
- Includes a SQL view for dashboard-style queries
- Refresh procedure to recalculate status for all customers

---

## Status Logic (Rule Engine)

| Condition                               | Result     |
|----------------------------------------|------------|
| Match found on sanctions list          | `rejected` |
| High risk level from risk scoring      | `pending`  |
| Otherwise                              | `approved` |

---

## Example output

| customer\_id | name              | match\_type | risk\_level | final\_status | last\_updated       |
| ------------ | ----------------- | ----------- | ----------- | ------------- | ------------------- |
| 1            | Arthur Dent       | no\_match   | low         | approved      | 2025-06-04 10:00:00 |
| 2            | Zaphod Beeblebrox | match       | high        | rejected      | 2025-06-04 10:00:00 |
| 3            | Ford Prefect      | no\_match   | high        | pending       | 2025-06-04 10:00:00 |

---

## Directory Structure

```sh
sql/
├── views/
│ └── kyc_compliance_status.sql
├── functions/
│ └── get_customer_kyc_status.sql
├── procedures/
│ └── refresh_kyc_status.sql
├── tables/
│ └── customer_kyc_status.sql
└── scripts/
└── init_module.sql

tests/
└── test_view_kyc_status.sql
```