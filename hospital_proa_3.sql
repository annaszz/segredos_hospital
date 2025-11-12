-- CONVENIOS
INSERT INTO convenio (cnpj, nome) VALUES
('11111111/000111', 'Saúde Total'),
('22222222/000122', 'Bem Estar Saúde'),
('33333333/000133', 'Vida Plena'),
('44444444/000144', 'Medica Mais'),
('55555555/000155', 'Universal Saúde');

-- MEDICOS
INSERT INTO medico (crm, nome, tipo) VALUES
('CRM/SP 123456', 'Dr. Ana Costa', 'especialista'),
('CRM/RJ 789012', 'Dr. Bruno Silva', 'especialista'),
('CRM/MG 345678', 'Dr. Carlos Souza', 'especialista'),
('CRM/SP 901234', 'Dr. Daniela Lima', 'especialista'),
('CRM/BA 567890', 'Dr. Eduardo Nunes', 'residente'),
('CRM/PR 112233', 'Dr. Fernanda Rocha', 'residente'),
('CRM/SC 445566', 'Dr. Gabriel Alves', 'generalista'),
('CRM/RS 778899', 'Dr. Helena Prado', 'generalista'),
('CRM/PE 101010', 'Dr. Igor Meireles', 'especialista'),
('CRM/CE 202020', 'Dr. Julia Ferreira', 'residente');

-- ESPECIALIDADES
INSERT INTO especialidade (nome) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Oftalmologia'),
('Psiquiatria');

-- MEDICO_ESPECIALIDADE
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUES
-- Dra. Ana Costa (1) - Pediatria, Clínica Geral
(1, 1),
(1, 2),
-- Dr. Bruno Silva (2) - Gastrenterologia
(2, 3),
-- Dr. Carlos Souza (3) - Dermatologia
(3, 4),
-- Dra. Daniela Lima (4) - Cardiologia
(4, 5),
-- Dr. Eduardo Nunes (5) - Ortopedia
(5, 6),
-- Dra. Fernanda Rocha (6) - Oftalmologia
(6, 7),
-- Dr. Gabriel Alves (7) - Clínica Geral
(7, 2),
-- Dra. Helena Prado (8) - Clínica Geral
(8, 2),
-- Dr. Igor Meireles (9) - Psiquiatria
(9, 8),
-- Dra. Julia Ferreira (10) - Pediatria
(10, 1),
-- Dr. Bruno Silva (2) - Clínica Geral (multi-especialidade)
(2, 2);


-- PACIENTES
INSERT INTO paciente (nome, cpf, rg, data_nascimento, email, rua, numero, complemento, estado, cidade) VALUES
('João da Silva', '11111111111', '11111111', '1985-05-20', 'joao.silva@email.com', 'Rua A', 100, 'Apto 101', 'SP', 'São Paulo'),
('Maria Oliveira', '22222222222', '22222222', '1990-10-15', 'maria.oliveria@email.com', 'Av. B', 250, NULL, 'RJ', 'Rio de Janeiro'),
('Pedro Santos', '33333333333', '33333333', '2000-03-01', 'pedro.santos@email.com', 'Rua C', 50, 'Casa', 'MG', 'Belo Horizonte'),
('Ana Pereira', '44444444444', '44444444', '1975-12-10', 'ana.pereira@email.com', 'Av. D', 1200, 'Bloco 5', 'SP', 'Campinas'),
('Lucas Costa', '55555555555', '55555555', '1998-07-25', 'lucas.costa@email.com', 'Rua E', 330, NULL, 'PR', 'Curitiba'),
('Carla Mendes', '66666666666', '66666666', '1962-01-30', 'carla.mendes@email.com', 'Av. F', 75, 'Apt 22', 'SC', 'Florianópolis'),
('Rafaela Lima', '77777777777', '77777777', '2005-08-08', 'rafaela.lima@email.com', 'Rua G', 900, 'Fundos', 'RS', 'Porto Alegre'),
('Felipe Rocha', '88888888888', '88888888', '1989-04-12', 'felipe.rocha@email.com', 'Av. H', 15, 'Sala 404', 'BA', 'Salvador'),
('Isabela Alves', '99999999999', '99999999', '1993-11-03', 'isabela.alves@email.com', 'Rua I', 555, NULL, 'PE', 'Recife'),
('Guilherme Neves', '00000000000', '00000000', '1980-06-17', 'guilherme.neves@email.com', 'Av. J', 10, 'Cobertura', 'CE', 'Fortaleza'),
('Juliana Torres', '12121212121', '12121212', '1995-02-28', 'juliana.t@email.com', 'Rua K', 45, 'Casa 2', 'SP', 'São Paulo'),
('Marcelo Gomes', '13131313131', '13131313', '1970-09-05', 'marcelo.gomes@email.com', 'Av. L', 88, NULL, 'RJ', 'Niterói'),
('Viviane Castro', '14141414141', '14141414', '2010-01-01', 'viviane.c@email.com', 'Rua M', 777, 'Apto 3', 'MG', 'Contagem'),
('Alexandre Mello', '15151515151', '15151515', '1988-08-18', 'alexandre.m@email.com', 'Av. N', 99, 'Loja 1', 'SP', 'Santos'),
('Patricia Dias', '16161616161', '16161616', '1992-04-04', 'patricia.d@email.com', 'Rua O', 202, NULL, 'PR', 'Londrina');

-- TELEFONE PACIENTE
INSERT INTO telefone_paciente (id_paciente, numero_telefone) VALUES
(1, '1199991111'),
(1, '1133331111'),
(2, '2199992222'),
(3, '3199993333'),
(4, '1999994444'),
(5, '4199995555'),
(6, '4899996666'),
(7, '5199997777'),
(8, '7199998888'),
(9, '8199999999'),
(10, '8599990000'),
(11, '11988887777'),
(12, '21977776666'),
(13, '31966665555'),
(14, '13955554444'),
(15, '43944443333');

-- PACIENTE_CONVENIO
INSERT INTO paciente_convenio (id_paciente, id_convenio, tempo_carencia) VALUES
(1, 1, 0), -- João da Silva -> Saúde Total
(4, 2, 30), -- Ana Pereira -> Bem Estar Saúde
(6, 3, 90), -- Carla Mendes -> Vida Plena
(10, 4, 0), -- Guilherme Neves -> Medica Mais
(12, 1, 0), -- Marcelo Gomes -> Saúde Total
(15, 2, 120); -- Patricia Dias -> Bem Estar Saúde


-- CONSULTAS
INSERT INTO consulta (id_paciente, id_medico, valor_consulta, hora_realizacao, data_realizacao) VALUES
(1, 7, 200.00, '10:00:00', '2015-02-10'), -- Paciente 1 (Convenio 1) - Clínica Geral
(2, 1, 350.00, '11:30:00', '2015-05-20'), -- Pediatria
(3, 2, 400.00, '14:00:00', '2016-01-05'), -- Gastrenterologia
(4, 3, 300.00, '09:30:00', '2016-08-18'), -- Paciente 4 (Convenio 2) - Dermatologia
(5, 4, 450.00, '16:00:00', '2017-03-22'), -- Cardiologia
(6, 5, 250.00, '10:00:00', '2017-11-11'), -- Paciente 6 (Convenio 3) - Ortopedia
(7, 10, 350.00, '08:30:00', '2018-04-04'), -- Pediatria
(8, 6, 300.00, '13:00:00', '2018-09-29'), -- Oftalmologia
(9, 7, 200.00, '15:30:00', '2019-01-15'), -- Clínica Geral
(10, 8, 200.00, '17:00:00', '2019-06-01'), -- Paciente 10 (Convenio 4) - Clínica Geral
(1, 7, 200.00, '09:00:00', '2019-12-05'), -- Paciente 1 (Convenio 1) - Clínica Geral (2ª consulta)
(11, 9, 500.00, '11:00:00', '2020-03-10'), -- Psiquiatria
(12, 1, 350.00, '14:30:00', '2020-07-07'), -- Paciente 12 (Convenio 1) - Pediatria
(13, 3, 300.00, '16:30:00', '2020-11-20'), -- Dermatologia
(14, 4, 450.00, '08:00:00', '2021-02-14'), -- Cardiologia
(2, 2, 400.00, '12:00:00', '2021-05-01'), -- Gastrenterologia (Paciente 2 - 2ª consulta)
(15, 5, 250.00, '15:00:00', '2021-08-25'), -- Ortopedia
(4, 6, 300.00, '10:30:00', '2021-10-10'), -- Paciente 4 (Convenio 2) - Oftalmologia (2ª consulta)
(5, 8, 200.00, '13:30:00', '2021-12-01'), -- Clínica Geral (Paciente 5 - 2ª consulta)
(10, 9, 500.00, '16:00:00', '2022-01-01'); -- Paciente 10 (Convenio 4) - Psiquiatria (2ª consulta)


-- TIPO_QUARTO
INSERT INTO tipo_quarto (descricao, valor_diaria) VALUES
('Apartamento', 450.00),
('Quarto Duplo', 280.00),
('Enfermaria', 150.00);


-- QUARTOS
INSERT INTO quarto (tipo_quarto, numero) VALUES
(1, 101), -- Apartamento
(2, 205), -- Quarto Duplo
(3, 310), -- Enfermaria
(1, 102), -- Apartamento
(2, 206); -- Quarto Duplo


-- ENFERMEIROS
INSERT INTO enfermeiro (cpf, cre, nome) VALUES
('11223344555', 'SP 123456', 'Enf. Aline Gomes'),
('22334455666', 'RJ 789012', 'Enf. Bernardo Telles'),
('33445566777', 'MG 345678', 'Enf. Cíntia Dutra'),
('44556677888', 'SP 901234', 'Enf. David Nunes'),
('55667788999', 'PR 112233', 'Enf. Elisa Frota'),
('66778899000', 'SC 445566', 'Enf. Fernando Kross'),
('77889900111', 'RS 778899', 'Enf. Giovana Lins'),
('88990011222', 'BA 101010', 'Enf. Hugo Meira'),
('99001122333', 'PE 202020', 'Enf. Ingrid Matos'),
('10112233444', 'CE 303030', 'Enf. Jorge Lima');

-- INTERNACOES
INSERT INTO internacao (id_paciente, id_medico, id_quarto, procedimento, data_entrada, data_prev_alta, data_alta) VALUES
(1, 2, 1, 'Cirurgia de Apêndice', '2015-03-15', '2015-03-22', '2015-03-20'),
(2, 1, 2, 'Tratamento Pediátrico', '2016-10-01', '2016-10-05', '2016-10-04'),
(3, 3, 3, 'Observação', '2017-05-10', '2017-05-11', '2017-05-10'),
(1, 4, 4, 'Angioplastia', '2018-01-20', '2018-01-28', '2018-01-25'),
(5, 5, 5, 'Cirurgia de Joelho', '2019-09-01', '2019-09-15', '2019-09-10'),
(7, 10, 3, 'Tratamento de Infeção', '2021-07-07', '2021-07-14', NULL); -- Ainda internada

-- INTERNACAO_ENFERMEIRO
INSERT INTO internacao_enfermeiro (id_enfermeiro, id_internacao) VALUES
(1, 1), (2, 1), -- Internação 1
(3, 2), (4, 2), -- Internação 2
(5, 3), (6, 3), -- Internação 3
(7, 4), (8, 4), -- Internação 4
(9, 5), (10, 5), -- Internação 5
(5, 6), (7, 6), (9, 6); -- Internação 6 (3 enfermeiros)






