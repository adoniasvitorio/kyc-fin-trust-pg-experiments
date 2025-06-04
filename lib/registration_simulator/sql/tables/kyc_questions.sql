CREATE TABLE IF NOT EXISTS kyc_questions (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    question_text TEXT NOT NULL,
    answer_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);