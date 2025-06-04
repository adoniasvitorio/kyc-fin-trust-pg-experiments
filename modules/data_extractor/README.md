# OCR Data Extractor Module

This module simulates the process of extracting structured data from image-based documents (such as passports or driver's licenses) using OCR.  
Although PostgreSQL doesn't support real image processing, this module mimics the behavior of an OCR pipeline to demonstrate how extracted data would be handled in a KYC process.

---

## Features

- Table for storing uploaded document metadata
- Table for storing extracted field-value pairs from each document
- Function that simulates an OCR engine based on document type
- Procedure to process a document and populate extracted fields
- Test data

---

## Example Behavior

For a `passport` document, simulated fields might include:

| Field Name       | Value         |
|------------------|---------------|
| name             | Arthur Dent   |
| passport_number  | X12345678     |
| nationality      | British       |

For a `cnh` (driver's license):

| Field Name       | Value               |
|------------------|---------------------|
| name             | Zaphod Beeblebrox   |
| cnh_number       | 99999999999         |
| expiration_date  | 2077-01-01          |

---

## Directory Structure

```sh
sql/
├── tables/
│ ├── raw_documents.sql
│ └── extracted_document_data.sql
├── functions/
│ └── simulate_ocr_extraction.sql
├── procedures/
│ └── process_document_ocr.sql
└── scripts/
└── init_module.sql

tests/
├── data_insert_raw_documents.sql
└── test_process_document_ocr.sql
```
