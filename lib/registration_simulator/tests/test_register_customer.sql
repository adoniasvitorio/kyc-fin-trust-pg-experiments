-- Clear customers table
DELETE FROM customers;

-- Valid customer registration
CALL register_customer('Arthur Dent', 'arthur.dent@example.com', '1990-05-01');

-- Invalid email
DO $$
BEGIN
    CALL register_customer('Bob Invalid', 'not-an-email', '1980-01-01');
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Expected error: %', SQLERRM;
END;
$$;

-- Check inserted data
SELECT * FROM customers;