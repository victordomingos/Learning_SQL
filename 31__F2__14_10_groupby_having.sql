--Obter a lista dos utentes que já foram consultados (exatamente) 3 vezes.

SELECT U.nome

FROM utente U
    INNER JOIN consulta_medica CM
        ON U.numero_utente = CM.utente

WHERE CM.realizada = 1

GROUP BY U.nome
HAVING COUNT(U.nome) = 3;
