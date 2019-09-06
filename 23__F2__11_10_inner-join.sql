SELECT CM.data_hora,
       U.nome,
       M.nome

FROM utente U
    INNER JOIN consulta_medica CM
        ON U.numero_utente = CM.utente
    INNER JOIN medico M
        ON CM.medico = M.numero_ordem

WHERE CM.realizada = 0 
    AND CM.data_hora < NOW();
