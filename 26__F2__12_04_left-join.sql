-- Listar todos os utentes que nunca realizaram consulta

SELECT U.numero_utente, U.nome

FROM utente U
    LEFT JOIN consulta_medica CM
        ON U.numero_utente = CM.utente

WHERE CM.realizada = 0;        
