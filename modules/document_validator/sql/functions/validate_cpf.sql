CREATE OR REPLACE FUNCTION validate_cpf(cpf TEXT) RETURNS BOOLEAN AS $$
DECLARE
    cpf_clean TEXT;
    sum INTEGER;
    i INTEGER;
    digit1 INTEGER;
    digit2 INTEGER;
BEGIN
    cpf_clean := regexp_replace(cpf, '[^0-9]', '', 'g');

    IF length(cpf_clean) <> 11 THEN
        RETURN FALSE;
    END IF;

    IF cpf_clean ~ '^(.)\1{10}$' THEN
        RETURN FALSE;
    END IF;

    sum := 0;
    FOR i IN 1..9 LOOP
        sum := sum + (CAST(substring(cpf_clean, i, 1) AS INTEGER) * (11 - i));
    END LOOP;
    digit1 := (sum * 10) % 11;
    IF digit1 = 10 THEN
        digit1 := 0;
    END IF;

    sum := 0;
    FOR i IN 1..10 LOOP
        sum := sum + (CAST(substring(cpf_clean, i, 1) AS INTEGER) * (12 - i));
    END LOOP;
    digit2 := (sum * 10) % 11;
    IF digit2 = 10 THEN
        digit2 := 0;
    END IF;

    IF digit1 = CAST(substring(cpf_clean, 10, 1) AS INTEGER)
        AND digit2 = CAST(substring(cpf_clean, 11, 1) AS INTEGER) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;