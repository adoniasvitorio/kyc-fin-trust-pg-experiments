# Module – Document Validator

This module is responsible for validating personal identification documents as part of the KYC (Know Your Customer) process. It supports validation for the following document types:

- CPF (Brazilian Individual Taxpayer Registry)
- RG (Brazilian General Registration)
- Passport (basic format validation)

---

## Features

- Validation logic for CPF, including check digits and blacklist of known invalid values.
- Basic format validation for RG and Passport.
- Table for storing validated documents.
- Procedure for inserting and validating a document in one step.

---

## Structure

``` sh
sql/
├── tables/
│ └── identity_documents.sql
├── functions/
│ ├── validate_cpf.sql
│ └── validate_document.sql
├── procedures/
│ └── insert_document.sql
└── scripts/
└── init_module.sql

tests/
├── test_validate_cpf.sql
└── test_insert_document.sql
```

---


---

## Setup Instructions

> You must be connected to database.

1. Run the initialization script for this module:

```bash
psql -d <kyc_database> -f lib/document_validator/sql/scripts/init_module.sql

