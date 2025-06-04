CREATE OR REPLACE FUNCTION validate_document(doc_type VARCHAR, doc_number TEXT) RETURNS BOOLEAN AS $$
BEGIN
    IF doc_type = 'CPF' THEN
        RETURN validate_cpf(doc_number);
    ELSIF doc_type = 'RG' THEN
        IF doc_number ~ '^[A-Za-z0-9]{5,12}$' THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    ELSIF doc_type = 'PASSPORT' THEN
        IF doc_number ~ '^[A-Z]{1}[0-9]{7}$' THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;