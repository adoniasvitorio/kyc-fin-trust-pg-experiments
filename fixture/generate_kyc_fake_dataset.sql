-- Clean existing data
TRUNCATE TABLE customer_kyc_status, sanctions_matches, risk_scores,
    raw_documents, extracted_document_data, identity_documents, customers RESTART IDENTITY CASCADE;

-- Insert fake customers
INSERT INTO customers (full_name, email, birth_date) VALUES
('Arthur Dent', 'arthur@galaxy.com', '1980-04-01'),
('Zaphod Beeblebrox', 'zaphod@galaxy.com', '1975-05-05'),
('Ford Prefect', 'ford@galaxy.com', '1990-03-03'),
('Trillian Astra', 'trillian@galaxy.com', '1985-06-10'),
('Marvin the Paranoid Android', 'marvin@galaxy.com', '1960-01-01');

-- Insert fake identity documents
INSERT INTO identity_documents (customer_id, document_type, document_number, is_valid) VALUES
(1, 'CPF', '529.982.247-25', TRUE),
(2, 'CPF', '111.111.111-11', FALSE),
(3, 'RG', 'MG1234567', TRUE),
(4, 'RG', 'MG@123!', FALSE),
(5, 'CPF', '123.456.789-09', FALSE);

-- Insert fake risk scores
INSERT INTO risk_scores (customer_id, risk_score, risk_level, evaluated_at) VALUES
(1, 20, 'low', NOW()),
(2, 75, 'high', NOW()),
(3, 50, 'medium', NOW()),
(4, 45, 'medium', NOW()),
(5, 90, 'high', NOW());

-- Insert fake sanctions matches
INSERT INTO sanctions_matches (customer_id, match_type, checked_at) VALUES
(1, 'no_match', NOW()),
(2, 'match', NOW()),
(3, 'no_match', NOW()),
(4, 'possible_match', NOW()),
(5, 'no_match', NOW());

-- Insert raw documents
INSERT INTO raw_documents (customer_id, document_type, file_name, uploaded_at) VALUES
(1, 'passport', 'arthur_passport.jpg', NOW()),
(2, 'cnh', 'zaphod_cnh.jpg', NOW()),
(3, 'passport', 'ford_passport.jpg', NOW()),
(4, 'cnh', 'trillian_cnh.jpg', NOW()),
(5, 'passport', 'marvin_passport.jpg', NOW());

-- Simulate OCR process (simplified loop)
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT id FROM raw_documents LOOP
        CALL process_document_ocr(r.id);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Run status refresh to populate customer_kyc_status
CALL refresh_kyc_status();

-- Done