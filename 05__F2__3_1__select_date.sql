USE clinica_V1_0;

SELECT numero_ordem, nome, data_nascimento
FROM medico
WHERE data_nascimento > '1969-12-10';
