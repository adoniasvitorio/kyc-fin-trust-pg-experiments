CREATE OR REPLACE PROCEDURE upload_document(
    p_customer_id INTEGER,
    p_doc_type TEXT,
    p_doc_number TEXT
)
AS $$
BEGIN
    IF NOT validate_document_type(p_doc_type) THEN
        RAISE EXCEPTION 'Invalid document type: %', p_doc_type;
    END IF;

    INSERT INTO documents (customer_id, document_type, document_number)
    VALUES (p_customer_id, p_doc_type, p_doc_number);
END;
$$ LANGUAGE plpgsql;