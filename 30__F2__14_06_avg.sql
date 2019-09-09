-- 

SELECT U.nome,
       AVG(E.especialidade_preco) AS despesa_media

FROM utente U
    INNER JOIN consulta_medica CM
        ON U.numero_utente = CM.utente
    INNER JOIN medico M
        ON M.numero_ordem = CM.medico
    INNER JOIN especialidade E
        ON M.especialidade = E.especialidade_codigo

WHERE CM.realizada = 1

GROUP BY U.nome;
