-- Table to record matches between customers and the sanctions list
CREATE TABLE IF NOT EXISTS sanctions_matches (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    matched_name TEXT NOT NULL,
    match_type VARCHAR(20) CHECK (match_type IN ('match', 'possible_match', 'no_match')),
    checked_at TIMESTAMP DEFAULT NOW()
);