-- Procedure to run the check and store the result in sanctions_matches
CREATE OR REPLACE PROCEDURE run_sanctions_check(p_customer_id INTEGER)
AS $$
DECLARE
    v_match RECORD;
BEGIN
    FOR v_match IN SELECT * FROM check_sanctions(p_customer_id) LOOP
        INSERT INTO sanctions_matches (customer_id, matched_name, match_type, checked_at)
        VALUES (p_customer_id, v_match.matched_name, v_match.match_type, NOW());
    END LOOP;
END;
$$ LANGUAGE plpgsql;