-- Refreshes or sets the current KYC status for each customer
CREATE OR REPLACE PROCEDURE refresh_kyc_status()
AS $$
DECLARE
    rec RECORD;
    new_status VARCHAR;
BEGIN
    FOR rec IN SELECT id FROM customers LOOP
        new_status := get_customer_kyc_status(rec.id);

        INSERT INTO customer_kyc_status (customer_id, status, last_updated)
        VALUES (rec.id, new_status, NOW())
        ON CONFLICT (customer_id) DO UPDATE
        SET status = EXCLUDED.status,
            last_updated = NOW();
    END LOOP;
END;
$$ LANGUAGE plpgsql;