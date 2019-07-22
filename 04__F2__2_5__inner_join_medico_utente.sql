USE clinica_V1_1;

SELECT utente.nome, medico.nome
FROM consulta_medica 
INNER JOIN utente ON utente.numero_utente = consulta_medica.utente
INNER JOIN medico ON medico.numero_ordem = consulta_medica.medico;

