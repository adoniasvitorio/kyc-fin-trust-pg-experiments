-- Insert sample documents

-- Assume documents table has columns: id, customer_id, document_type, document_number, is_valid

INSERT INTO documents (customer_id, document_type, document_number, is_valid)
VALUES
((SELECT id FROM customers WHERE email = 'arthur.dent@example.com'), 'CPF', '529.982.247-25', TRUE),
((SELECT id FROM customers WHERE email = 'arthur.dent@example.com'), 'RG', 'MG1234567', FALSE),  -- invalid document
((SELECT id FROM customers WHERE email = 'trillian.astra@example.com'), 'CPF', '123.456.789-09', TRUE),
((SELECT id FROM customers WHERE email = 'ford.prefect@example.com'), 'CPF', '987.654.321-00', TRUE);