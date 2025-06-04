-- Ensure a test customer exists
-- Clean previous test data
DELETE FROM kyc_questions;
DELETE FROM customers WHERE email = 'arthur.dent@example.com';

-- Insert test customer
CALL register_customer('Arthur Dent', 'arthur.dent@example.com', '1978-03-11');

-- Get the customer_id just inserted
-- (Assumes no concurrent inserts for simplicity)
\set customer_id (SELECT id FROM customers WHERE email = 'arthur.dent@example.com')

-- Answer KYC questions
CALL answer_kyc_question(:customer_id, 'What is the ultimate answer to life, the universe and everything?', '42');
CALL answer_kyc_question(:customer_id, 'Do you own a Babel fish?', 'Yes, it’s how I understand compliance talk.');
CALL answer_kyc_question(:customer_id, 'Have you misplaced your towel in the last 12 months?', 'Absolutely not. It''s always on my shoulder.');
CALL answer_kyc_question(:customer_id, 'What’s your opinion on Vogon poetry?', 'Painful, yet strangely arousing.');

-- Invalid case: Customer ID does not exist
DO $$
BEGIN
    CALL answer_kyc_question(9999, 'Are you Zaphod Beeblebrox?', 'Possibly.');
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Expected error for non-existent customer: %', SQLERRM;
END;
$$;

-- Query results
SELECT * FROM kyc_questions WHERE customer_id = :customer_id ORDER BY created_at;