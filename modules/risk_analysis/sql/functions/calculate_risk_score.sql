-- Function to calculate the risk score and risk level for a customer
CREATE OR REPLACE FUNCTION calculate_risk_score(p_customer_id INTEGER)
RETURNS TABLE(score INTEGER, risk_level VARCHAR) AS $$
DECLARE
    v_age INTEGER;
    v_invalid_docs_count INTEGER;
    v_risky_answers_count INTEGER;
BEGIN
    -- Get customer's age
    SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date))::INTEGER
    INTO v_age
    FROM customers
    WHERE id = p_customer_id;

    IF v_age IS NULL THEN
        RAISE EXCEPTION 'Customer % not found', p_customer_id;
    END IF;

    -- Count invalid documents (assuming 'is_valid' boolean in documents table)
    SELECT COUNT(*) 
    INTO v_invalid_docs_count
    FROM documents
    WHERE customer_id = p_customer_id AND is_valid = FALSE;

    -- Count "yes" answers to risky questions (questions containing 'risky' keyword)
    SELECT COUNT(*)
    INTO v_risky_answers_count
    FROM kyc_questions
    WHERE customer_id = p_customer_id
      AND LOWER(question_text) LIKE '%risky%'
      AND LOWER(answer_text) = 'yes';

    -- Calculate base score by age
    IF v_age < 25 THEN
        score := 20;
    ELSIF v_age <= 60 THEN
        score := 10;
    ELSE
        score := 15;
    END IF;

    -- Add points for invalid documents
    score := score + (v_invalid_docs_count * 30);

    -- Add points for risky answers
    score := score + (v_risky_answers_count * 40);

    -- Determine risk level based on score
    IF score < 30 THEN
        risk_level := 'low';
    ELSIF score <= 60 THEN
        risk_level := 'medium';
    ELSE
        risk_level := 'high';
    END IF;

    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;