CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    document_type VARCHAR(20) NOT NULL,
    document_number TEXT NOT NULL,
    uploaded_at TIMESTAMP DEFAULT NOW()
);