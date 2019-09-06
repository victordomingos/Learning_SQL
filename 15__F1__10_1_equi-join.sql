SELECT 
    M.nome,
    E.especialidade 
FROM
    mecanico M,
    especialidade E, 
    especialidade_mecanico EM 
WHERE M.codigo = EM.mecanico 
  AND EM.especialidade = E.codigo;
