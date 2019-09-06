SELECT CM.data_hora,
       U.nome,
       M.nome,
       E.especialidade_preco

FROM consulta_medica CM, 
     utente U, 
     medico M,
     especialidade E

WHERE CM.utente = U.numero_utente
  AND CM.medico = M.numero_ordem
  AND M.especialidade = E.especialidade_codigo;
