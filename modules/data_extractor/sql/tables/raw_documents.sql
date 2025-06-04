-- Table to store raw document metadata (e.g., file name, type)
CREATE TABLE IF NOT EXISTS raw_documents (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    document_type VARCHAR(20), -- e.g. 'passport', 'cnh'
    file_name TEXT,
    uploaded_at TIMESTAMP DEFAULT NOW()
);