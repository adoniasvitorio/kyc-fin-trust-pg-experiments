-- View to consolidate all compliance-related indicators
CREATE OR REPLACE VIEW kyc_compliance_status AS
SELECT
    c.id AS customer_id,
    c.full_name,
    s.match_type,
    r.risk_level,
    kyc.status AS final_status,
    kyc.last_updated
FROM
    customers c
LEFT JOIN sanctions_matches s ON s.customer_id = c.id
LEFT JOIN risk_scores r ON r.customer_id = c.id
LEFT JOIN customer_kyc_status kyc ON kyc.customer_id = c.id;