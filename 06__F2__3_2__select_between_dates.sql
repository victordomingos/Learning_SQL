USE clinica_V1_1;

SELECT numero_ordem, nome, data_inicio_atividade
FROM medico
WHERE data_inicio_atividade BETWEEN '2005-01-01' AND '2009-12-31';
