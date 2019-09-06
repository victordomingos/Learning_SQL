SELECT I.codigo AS cod, I.veiculo, E.especialidade 
  FROM intervencao I, 
       veiculo V, 
       mecanico M, 
       especialidade_mecanico EM, 
       especialidade E
 WHERE V.matricula=I.veiculo 
   AND I.mecanico=M.codigo 
   AND EM.mecanico=M.codigo 
   AND EM.especialidade=E.codigo;
