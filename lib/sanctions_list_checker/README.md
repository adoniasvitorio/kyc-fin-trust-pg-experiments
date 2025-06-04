# Sanctions List Checker Module

This module compares customer names with public sanctions lists or politically exposed persons (PEP).

It allows checking if a customer has a full or partial name match with known individuals/entities from official or internal lists, and stores the result with the classification:

- `match`: exact match found
- `possible_match`: partial match found
- `no_match`: no match found

---

## Features

- Table for storing names from public or internal sanctions lists
- Function to compare customer names with the list (exact or partial)
- Procedure to run the comparison and record results
- Simple matching logic (based on text comparisons)
- Test data

---

## Example Test data

| Customer Name     | Sanctioned?       | Match Type |
| ----------------- | ----------------- | ---------- |
| Arthur Dent       | No                | `no_match` |
| Zaphod Beeblebrox | Yes (exact match) | `match`    |
| Ford Prefect      | No                | `no_match` |
| Slartibartfast    | Yes (exact match) | `match`    |

---

## Directory Structure

```sh
sql/
├── tables/
│ ├── sanctions_list.sql
│ └── sanctions_matches.sql
├── functions/
│ └── check_sanctions.sql
├── procedures/
│ └── run_sanctions_check.sql
└── scripts/
└── init_module.sql

tests/
├── test_check_sanctions.sql
├── data_insert_sample_customers.sql
└── data_insert_sanctions_list.sql
```
