CREATE OR REPLACE FUNCTION validate_document_type(doc_type TEXT) RETURNS BOOLEAN AS $$
BEGIN
    RETURN LOWER(doc_type) IN ('cpf', 'rg', 'passport');
END;
$$ LANGUAGE plpgsql;