SELECT CM.data_hora,
       U.nome,
       M.nome,
       E.especialidade_preco
FROM consulta_medica CM
    INNER JOIN utente U
        ON CM.utente = U.numero_utente
    INNER JOIN medico M
        ON CM.medico = M.numero_ordem
    INNER JOIN especialidade E
        ON M.especialidade = E.especialidade_codigo;

