-- Create tables
\i ../tables/customers.sql
\i ../tables/documents.sql
\i ../tables/kyc_questions.sql

-- Create functions
\i ../functions/validate_email.sql
\i ../functions/validate_document_type.sql

-- Create procedures
\i ../procedures/register_customer.sql
\i ../procedures/upload_document.sql
\i ../procedures/answer_kyc_question.sql