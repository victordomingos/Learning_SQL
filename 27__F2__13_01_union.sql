-- Mostrar nome e codigo postal de todos os médicos e utentes (juntar numa só consulta)

SELECT nome, codigo_postal
FROM utente
UNION
SELECT nome, codigo_postal
FROM medico;
