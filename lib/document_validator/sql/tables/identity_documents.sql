CREATE TABLE IF NOT EXISTS identity_documents (
    id SERIAL PRIMARY KEY,
    document_type VARCHAR(20) NOT NULL,   -- 'CPF', 'RG', 'PASSPORT'
    document_number VARCHAR(50) NOT NULL,
    validated BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);