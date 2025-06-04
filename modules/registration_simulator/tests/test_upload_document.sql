-- Clear documents table
DELETE FROM documents;

-- Upload document for existing customer (assume id = 1)
CALL upload_document(1, 'CPF', '529.982.247-25');

-- Invalid document type
DO $$
BEGIN
    CALL upload_document(1, 'DRIVER_LICENSE', 'ABC123');
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Expected error: %', SQLERRM;
END;
$$;

-- Check documents
SELECT * FROM documents;