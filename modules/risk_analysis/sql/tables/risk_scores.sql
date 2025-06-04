CREATE TABLE IF NOT EXISTS risk_scores (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE REFERENCES customers(id),
    risk_level VARCHAR(10) NOT NULL, -- 'low', 'medium', 'high'
    score INTEGER NOT NULL,          -- numeric score for details
    calculated_at TIMESTAMP DEFAULT NOW()
);