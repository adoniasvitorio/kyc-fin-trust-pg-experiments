-- Table to store current KYC status for each customer
CREATE TABLE IF NOT EXISTS customer_kyc_status (
    customer_id INTEGER PRIMARY KEY REFERENCES customers(id),
    status VARCHAR(20) CHECK (status IN ('approved', 'pending', 'rejected')),
    last_updated TIMESTAMP DEFAULT NOW()
);