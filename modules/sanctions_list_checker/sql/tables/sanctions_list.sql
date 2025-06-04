-- Table to store sanctioned individuals/entities
CREATE TABLE IF NOT EXISTS sanctions_list (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    source TEXT NOT NULL, -- e.g. 'OFAC', 'UN', 'Local_PEP'
    country TEXT,
    inserted_at TIMESTAMP DEFAULT NOW()
);