SELECT M.nome, E.especialidade 
FROM mecanico M
    INNER JOIN especialidade_mecanico EM 
        ON M.codigo = EM.mecanico 
    INNER JOIN especialidade E 
        ON EM.especialidade = E.codigo;
