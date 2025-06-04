-- Sample raw document records
INSERT INTO raw_documents (customer_id, document_type, file_name)
VALUES
((SELECT id FROM customers WHERE full_name = 'Arthur Dent'), 'passport', 'arthur_passport.jpg'),
((SELECT id FROM customers WHERE full_name = 'Zaphod Beeblebrox'), 'cnh', 'zaphod_cnh.png');