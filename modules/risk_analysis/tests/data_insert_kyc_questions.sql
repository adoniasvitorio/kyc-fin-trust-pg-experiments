-- Insert sample KYC behavioral questions and answers

INSERT INTO kyc_questions (customer_id, question_text, answer_text)
VALUES
((SELECT id FROM customers WHERE email = 'arthur.dent@example.com'), 'Do you have any risky investments?', 'yes'),
((SELECT id FROM customers WHERE email = 'arthur.dent@example.com'), 'Do you often travel abroad?', 'no'),
((SELECT id FROM customers WHERE email = 'trillian.astra@example.com'), 'Do you have any risky investments?', 'no'),
((SELECT id FROM customers WHERE email = 'ford.prefect@example.com'), 'Have you been involved in any risky business?', 'yes');