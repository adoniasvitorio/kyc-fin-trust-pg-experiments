CREATE OR REPLACE PROCEDURE answer_kyc_question(
    p_customer_id INTEGER,
    p_question_text TEXT,
    p_answer_text TEXT
)
AS $$
BEGIN
    -- Verifica se o cliente existe
    IF NOT EXISTS (SELECT 1 FROM customers WHERE id = p_customer_id) THEN
        RAISE EXCEPTION 'Customer with id % does not exist.', p_customer_id;
    END IF;

    -- Insere a pergunta e a resposta
    INSERT INTO kyc_questions (customer_id, question_text, answer_text)
    VALUES (p_customer_id, p_question_text, p_answer_text);
END;
$$ LANGUAGE plpgsql;