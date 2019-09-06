SELECT U.nome,
       CM.data_hora,
       E.especialidade_preco

FROM utente U
    INNER JOIN consulta_medica CM
        ON U.numero_utente = CM.utente
    INNER JOIN medico M
        ON CM.medico = M.numero_ordem
    INNER JOIN especialidade E
        ON M.especialidade = E.especialidade_codigo

WHERE E.especialidade_preco > 69;
