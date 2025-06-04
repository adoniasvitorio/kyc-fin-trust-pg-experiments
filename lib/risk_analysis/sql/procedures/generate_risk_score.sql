-- Procedure to generate or update risk score for a customer
CREATE OR REPLACE PROCEDURE generate_risk_score(p_customer_id INTEGER)
AS $$
DECLARE
    v_score INTEGER;
    v_risk_level VARCHAR;
BEGIN
    -- Calculate risk score and level
    SELECT score, risk_level INTO v_score, v_risk_level
    FROM calculate_risk_score(p_customer_id);

    -- Insert or update risk score record
    INSERT INTO risk_scores (customer_id, score, risk_level, calculated_at)
    VALUES (p_customer_id, v_score, v_risk_level, NOW())
    ON CONFLICT (customer_id) DO UPDATE SET
        score = EXCLUDED.score,
        risk_level = EXCLUDED.risk_level,
        calculated_at = EXCLUDED.calculated_at;
END;
$$ LANGUAGE plpgsql;