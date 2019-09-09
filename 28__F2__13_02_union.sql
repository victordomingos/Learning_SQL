-- Listar todos os códigos postais de medicos e utentes, sem repeticoes.

SELECT codigo_postal
FROM utente
UNION
SELECT codigo_postal
FROM medico;
