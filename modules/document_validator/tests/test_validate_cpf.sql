-- Test to validate CPF using the function validate_cpf()

-- Valid CPF (should return true)
SELECT validate_cpf('529.982.247-25') AS result_valid_cpf;

-- Invalid CPF: incorrect format (less digits) | Todo: Blacklist policy
SELECT validate_cpf('123.456.789-0') AS result_invalid_length;

-- Invalid CPF: all digits are the same
SELECT validate_cpf('111.111.111-11') AS result_all_same_digits;

-- Invalid CPF: incorrect check digits
SELECT validate_cpf('529.982.247-26') AS result_invalid_check_digits;