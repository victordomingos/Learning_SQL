SELECT CM.data_hora,
       U.nome,
       E.especialidade_designacao, 
       E.especialidade_preco

FROM utente U
    INNER JOIN consulta_medica CM
        ON U.numero_utente = CM.utente
    INNER JOIN medico M
        ON CM.medico = M.numero_ordem
    INNER JOIN especialidade E
        ON M.especialidade = E.especialidade_codigo

WHERE U.nome LIKE "%Santoro%"
    AND CM.realizada = 1
    AND E.especialidade_preco = (SELECT MAX(especialidade_preco)
                                 FROM especialidade);
