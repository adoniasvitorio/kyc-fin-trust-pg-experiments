CREATE OR REPLACE PROCEDURE register_customer(
    p_full_name TEXT,
    p_email TEXT,
    p_birthdate DATE
)
AS $$
BEGIN
    IF NOT validate_email(p_email) THEN
        RAISE EXCEPTION 'Invalid email format: %', p_email;
    END IF;

    INSERT INTO customers (full_name, email, birthdate)
    VALUES (p_full_name, p_email, p_birthdate);
END;
$$ LANGUAGE plpgsql;