ALTER TABLE medico
ADD COLUMN em_atividade BOOLEAN NOT NULL DEFAULT TRUE;

UPDATE medico
SET em_atividade = TRUE
WHERE em_atividade IS NULL OR em_atividade = FALSE;


UPDATE medico
SET em_atividade = FALSE
WHERE id IN (5, 10);

SELECT id, nome, crm, tipo, em_atividade
FROM medico
ORDER BY em_atividade DESC, id;

