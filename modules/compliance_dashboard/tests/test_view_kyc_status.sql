-- Run the refresh
CALL refresh_kyc_status();

-- Show consolidated compliance data
SELECT * FROM kyc_compliance_status ORDER BY customer_id;