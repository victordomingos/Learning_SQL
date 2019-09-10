-- Qual o utente com menos consultas realizadas?

SELECT U.nome, COUNT(*) as total_consultas

FROM utente U
    INNER JOIN consulta_medica CM
        on U.numero_utente = CM.utente

WHERE CM.realizada = 1
GROUP BY CM.utente

HAVING total_consultas = (
    SELECT COUNT(*) as total_consultas

    FROM utente U
        INNER JOIN consulta_medica CM
            on U.numero_utente = CM.utente
    
    WHERE CM.realizada = 1
    GROUP BY U.numero_utente
    ORDER BY total_consultas DESC
    LIMIT 1
    );
