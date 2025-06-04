-- Run the sanctions check on customers

-- Expected: no match
CALL run_sanctions_check((SELECT id FROM customers WHERE name = 'Arthur Dent'));

-- Expected: exact match
CALL run_sanctions_check((SELECT id FROM customers WHERE name = 'Zaphod Beeblebrox'));

-- Expected: no match (similar, but not exact)
CALL run_sanctions_check((SELECT id FROM customers WHERE name = 'Ford Prefect'));

-- Expected: exact match
CALL run_sanctions_check((SELECT id FROM customers WHERE name = 'Slartibartfast'));

-- View results
SELECT * FROM sanctions_matches ORDER BY checked_at;