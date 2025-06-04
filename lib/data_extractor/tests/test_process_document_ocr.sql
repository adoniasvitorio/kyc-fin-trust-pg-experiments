-- Run OCR simulation on inserted documents
CALL process_document_ocr((SELECT id FROM raw_documents WHERE file_name = 'arthur_passport.jpg'));
CALL process_document_ocr((SELECT id FROM raw_documents WHERE file_name = 'zaphod_cnh.png'));

-- View extracted fields
SELECT * FROM extracted_document_data ORDER BY extracted_at;