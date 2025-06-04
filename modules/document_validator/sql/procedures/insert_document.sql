CREATE OR REPLACE PROCEDURE insert_document(doc_type VARCHAR, doc_number TEXT) AS $$
DECLARE
    is_valid BOOLEAN;
BEGIN
    is_valid := validate_document(doc_type, doc_number);

    INSERT INTO identity_documents (document_type, document_number, validated)
    VALUES (doc_type, doc_number, is_valid);
END;
$$ LANGUAGE plpgsql;