-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT
    c.id_consulta,
    p.nome AS paciente,
    m.nome AS medico,
    c.valor_consulta AS valor,
    c.data_realizacao AS data
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id
JOIN medico m ON c.id_medico = m.id
LEFT JOIN paciente_convenio pc ON p.id = pc.id_paciente
WHERE EXTRACT(YEAR FROM c.data_realizacao) = 2020 OR pc.id_convenio IS NOT NULL
ORDER BY c.data_realizacao;

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

UPDATE internacao
SET data_alta = '2018-01-30'
WHERE id = 4;

SELECT
    i.*,
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    q.numero AS numero_quarto
FROM internacao i
JOIN paciente p ON i.id_paciente = p.id
JOIN medico m ON i.id_medico = m.id
JOIN quarto q ON i.id_quarto = q.id
WHERE i.data_alta > i.data_prev_alta;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
WITH consultas_sem_convenio AS (
    SELECT c.*, p.nome AS nome_paciente, m.nome AS nome_medico
    FROM consulta c
    JOIN paciente p ON c.id_paciente = p.id
    JOIN medico m ON c.id_medico = m.id
    LEFT JOIN paciente_convenio pc ON p.id = pc.id_paciente
    WHERE pc.id_convenio IS NULL
),
max_min_valor AS (
    SELECT MAX(valor_consulta) AS max_val, MIN(valor_consulta) AS min_val
    FROM consultas_sem_convenio
)
SELECT *
FROM consultas_sem_convenio csc
WHERE csc.valor_consulta = (SELECT max_val FROM max_min_valor)
   OR csc.valor_consulta = (SELECT min_val FROM max_min_valor);

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
SELECT
    i.id AS id_internacao,
    p.nome AS paciente,
    m.nome AS medico,
    q.numero AS numero_quarto,
    tq.descricao AS tipo_quarto,
    i.data_entrada,
    i.data_alta,
    tq.valor_diaria,
    (i.data_alta - i.data_entrada) + 1 AS dias_internacao,
    ROUND(((i.data_alta - i.data_entrada) + 1) * tq.valor_diaria, 2) AS custo_total_diarias
FROM internacao i
JOIN paciente p ON i.id_paciente = p.id
JOIN medico m ON i.id_medico = m.id
JOIN quarto q ON i.id_quarto = q.id
JOIN tipo_quarto tq ON q.tipo_quarto = tq.id
WHERE i.data_alta IS NOT NULL;

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
SELECT
    i.data_entrada,
    i.procedimento,
    q.numero AS numero_quarto
FROM internacao i
JOIN quarto q ON i.id_quarto = q.id
JOIN tipo_quarto tq ON q.tipo_quarto = tq.id
WHERE tq.descricao = 'Apartamento';

-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta
SELECT
    p.nome AS nome_paciente,
    c.data_realizacao,
    e.nome AS especialidade_medica
FROM consulta c
JOIN paciente p ON c.id_paciente = p.id
JOIN medico m ON c.id_medico = m.id
JOIN medico_especialidade me ON m.id = me.id_medico
JOIN especialidade e ON me.id_especialidade = e.id
WHERE
    (c.data_realizacao - p.data_nascimento) / 365.25 < 18
    AND e.nome <> 'Pediatria'
ORDER BY c.data_realizacao

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria
INSERT INTO paciente (nome, cpf, rg, data_nascimento, email, rua, numero, complemento, estado, cidade) VALUES
('Marcos Vinícius', '17171717171', '17171717', '1995-12-05', 'marcos.v@email.com', 'Av. Nova', 500, NULL, 'SP', 'São Paulo');

INSERT INTO internacao (id_paciente, id_medico, id_quarto, procedimento, data_entrada, data_prev_alta, data_alta) VALUES
(16, 2, 3, 'Tratamento de Úlcera Gástrica', '2021-09-05', '2021-09-10', '2021-09-09');

SELECT
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    i.data_entrada,
    i.procedimento
FROM internacao i
JOIN paciente p ON i.id_paciente = p.id
JOIN medico m ON i.id_medico = m.id
JOIN medico_especialidade me ON m.id = me.id_medico
JOIN especialidade e ON me.id_especialidade = e.id
JOIN quarto q ON i.id_quarto = q.id
JOIN tipo_quarto tq ON q.tipo_quarto = tq.id
WHERE e.nome = 'Gastrenterologia'
  AND tq.descricao = 'Enfermaria';


-- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
SELECT
    m.nome AS nome_medico,
    m.crm,
    COUNT(c.id_consulta) AS total_consultas_realizadas
FROM medico m
LEFT JOIN consulta c ON m.id = c.id_medico
GROUP BY m.id, m.nome, m.crm
ORDER BY total_consultas_realizadas DESC, m.nome;

--Todos os médicos que tenham "Gabriel" no nome. 
SELECT id, nome, crm, tipo
FROM medico
WHERE nome ILIKE '%Gabriel%';

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT
    e.nome AS nome_enfermeiro,
    e.cre,
    COUNT(ie.id_internacao) AS total_internacoes_participadas
FROM enfermeiro e
JOIN internacao_enfermeiro ie ON e.id = ie.id_enfermeiro
GROUP BY e.id, e.nome, e.cre
HAVING COUNT(ie.id_internacao) > 1
ORDER BY total_internacoes_participadas DESC;



  








