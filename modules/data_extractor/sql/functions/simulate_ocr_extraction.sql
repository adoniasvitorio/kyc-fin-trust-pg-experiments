-- Simulates OCR by returning hardcoded field-value pairs based on document type
CREATE OR REPLACE FUNCTION simulate_ocr_extraction(p_document_type VARCHAR)
RETURNS TABLE(field_name TEXT, field_value TEXT) AS $$
BEGIN
    IF p_document_type = 'passport' THEN
        RETURN QUERY VALUES 
            ('name', 'Arthur Dent'),
            ('passport_number', 'X12345678'),
            ('nationality', 'British');
    ELSIF p_document_type = 'cnh' THEN
        RETURN QUERY VALUES 
            ('name', 'Zaphod Beeblebrox'),
            ('cnh_number', '99999999999'),
            ('expiration_date', '2077-01-01');
    ELSE
        RETURN QUERY VALUES 
            ('note', 'unsupported document type');
    END IF;
END;
$$ LANGUAGE plpgsql;