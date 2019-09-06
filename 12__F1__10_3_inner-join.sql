SELECT I.codigo AS cod, I.veiculo, E.especialidade 
  FROM intervencao I 
    INNER JOIN veiculo V 
        ON V.matricula=I.veiculo  
    INNER JOIN mecanico M 
        ON I.mecanico=M.codigo 
    INNER JOIN especialidade_mecanico EM 
        ON EM.mecanico=M.codigo 
    INNER JOIN especialidade E
        ON EM.especialidade=E.codigo;
