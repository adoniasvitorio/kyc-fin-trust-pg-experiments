CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    birthdate DATE NOT NULL,
    registration_date TIMESTAMP DEFAULT NOW()
);