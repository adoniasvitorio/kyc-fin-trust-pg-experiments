# Module – Registration Simulator

This module simulates the KYC customer registration process. It includes:

---

## Features
- Customer registration
- Email format validation
- Upload of documents with type validation
- KYC question storage (structure only)

---

## Structure

```sh
sql/
├── tables/
│   ├── customers.sql
│   ├── documents.sql
│   └── kyc_questions.sql
├── functions/
│   ├── validate_email.sql
│   └── validate_document_type.sql
├── procedures/
│   ├── register_customer.sql
│   └── upload_document.sql
└── scripts/
    └── init_module.sql

tests/
├── test_register_customer.sql
└── test_upload_document.sql
```
---

## Setup

Run the following script to create all objects:

```sh
psql -d <kyc_database> -f lib/registration_simulator/sql/scripts/init_module.sql
```