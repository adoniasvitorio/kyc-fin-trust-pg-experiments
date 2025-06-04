# Risk Profile Analyzer Module

This module implements a simple risk profiling system for customers.  
It calculates a risk score and classifies customers into risk levels (`low`, `medium`, `high`) based on personal data and behavioral answers collected in the KYC process.

---

## Features

- Table to store risk scores linked to customers
- Function to calculate risk score and risk level using business rules
- Procedure to insert or update the risk score for a given customer
- Simple scoring logic based on:
  - Customer age
  - Presence of invalid documents
  - Answers to "risky" behavioral questions

---

## Logic Score calc
Simple logic for score calculation (example)

- Points based on answers to behavioral questions (kyc_questions)
- Points based on the customer's age (from the customers table)
- Points based on valid documents (example)

Simple example:
| Criterion                        | Points |
| -------------------------------- | ------ |
| Age < 25                         | +20    |
| Age 25-60                        | +10    |
| Age > 60                         | +15    |
| Has any invalid document         | +30    |
| Answered “Yes” to risky question | +40    |

Final sum:
- Score < 30 → low
- Score 30-60 → medium
- Score > 60 → high

---

## Directory Structure

```sh
sql/
├── tables/
│   └── risk_scores.sql
├── functions/
│   └── calculate_risk_score.sql
├── procedures/
│   └── generate_risk_score.sql
└── scripts/
    └── init_module.sql

tests/
├── data_insert_documents.sql
├── data_insert_kyc_questions.sql
├── test_calculate_risk_score.sql
└── test_generate_risk_score.sql
```