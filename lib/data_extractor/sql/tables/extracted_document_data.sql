-- Table to store extracted fields from OCR process
CREATE TABLE IF NOT EXISTS extracted_document_data (
    id SERIAL PRIMARY KEY,
    raw_document_id INTEGER REFERENCES raw_documents(id),
    field_name TEXT NOT NULL,
    field_value TEXT,
    extracted_at TIMESTAMP DEFAULT NOW()
);