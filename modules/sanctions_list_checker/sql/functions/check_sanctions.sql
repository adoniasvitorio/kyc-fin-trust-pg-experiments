-- Function that compares a customer name to the sanctions list
CREATE OR REPLACE FUNCTION check_sanctions(p_customer_id INTEGER)
RETURNS TABLE(matched_name TEXT, match_type VARCHAR) AS $$
DECLARE
    v_name TEXT;
BEGIN
    -- Get customer's full name
    SELECT name INTO v_name FROM customers WHERE id = p_customer_id;

    IF v_name IS NULL THEN
        RAISE EXCEPTION 'Customer with ID % does not exist.', p_customer_id;
    END IF;

    -- Exact match
    RETURN QUERY
    SELECT full_name, 'match'
    FROM sanctions_list
    WHERE LOWER(full_name) = LOWER(v_name);

    -- Partial match
    RETURN QUERY
    SELECT full_name, 'possible_match'
    FROM sanctions_list
    WHERE LOWER(full_name) LIKE LOWER('%' || v_name || '%')
      AND LOWER(full_name) <> LOWER(v_name);

    -- No match fallback
    IF NOT FOUND THEN
        RETURN QUERY
        SELECT NULL::TEXT, 'no_match';
    END IF;
END;
$$ LANGUAGE plpgsql;