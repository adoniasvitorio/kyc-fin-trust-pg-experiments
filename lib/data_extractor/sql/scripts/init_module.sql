-- Create tables
\i ../tables/raw_documents.sql
\i ../tables/extracted_document_data.sql

-- Create function
\i ../functions/simulate_ocr_extraction.sql

-- Create procedure
\i ../procedures/process_document_ocr.sql