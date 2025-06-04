-- Clear the table before running tests
DELETE FROM identity_documents;

-- Insert valid CPF
CALL insert_document('CPF', '529.982.247-25');

-- Insert invalid CPF | Todo: Blacklist policy
CALL insert_document('CPF', '123.456.789-09');

-- Insert valid RG (simple format)
CALL insert_document('RG', 'MG1234567');

-- Insert invalid RG (contains invalid characters)
CALL insert_document('RG', 'MG@123!');

-- Check results in the table
SELECT * FROM identity_documents ORDER BY id;
