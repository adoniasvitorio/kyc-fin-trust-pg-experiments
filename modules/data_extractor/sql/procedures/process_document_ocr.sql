-- Process a document: simulate OCR and insert extracted data
CREATE OR REPLACE PROCEDURE process_document_ocr(p_raw_document_id INTEGER)
AS $$
DECLARE
    v_doc_type VARCHAR;
    v_field RECORD;
BEGIN
    -- Get document type
    SELECT document_type INTO v_doc_type
    FROM raw_documents
    WHERE id = p_raw_document_id;

    IF v_doc_type IS NULL THEN
        RAISE EXCEPTION 'Document ID % not found.', p_raw_document_id;
    END IF;

    -- Run simulated OCR extraction
    FOR v_field IN SELECT * FROM simulate_ocr_extraction(v_doc_type) LOOP
        INSERT INTO extracted_document_data (raw_document_id, field_name, field_value, extracted_at)
        VALUES (p_raw_document_id, v_field.field_name, v_field.field_value, NOW());
    END LOOP;
END;
$$ LANGUAGE plpgsql;