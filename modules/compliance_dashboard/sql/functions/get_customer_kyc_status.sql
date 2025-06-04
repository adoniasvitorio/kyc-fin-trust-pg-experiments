-- Returns recommended KYC status based on sanctions and risk
CREATE OR REPLACE FUNCTION get_customer_kyc_status(p_customer_id INTEGER)
RETURNS VARCHAR AS $$
DECLARE
    v_risk TEXT;
    v_sanctions TEXT;
BEGIN
    SELECT risk_level INTO v_risk FROM risk_scores WHERE customer_id = p_customer_id;
    SELECT match_type INTO v_sanctions FROM sanctions_matches WHERE customer_id = p_customer_id ORDER BY checked_at DESC LIMIT 1;

    IF v_sanctions = 'match' THEN
        RETURN 'rejected';
    ELSIF v_risk = 'high' THEN
        RETURN 'pending';
    ELSE
        RETURN 'approved';
    END IF;
END;
$$ LANGUAGE plpgsql;