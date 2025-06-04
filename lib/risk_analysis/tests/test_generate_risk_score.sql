-- Clean previous risk score for customer 1
DELETE FROM risk_scores WHERE customer_id = 1;

-- Generate risk score for customer 1
CALL generate_risk_score(1);

-- Verify the inserted or updated risk score
SELECT * FROM risk_scores WHERE customer_id = 1;