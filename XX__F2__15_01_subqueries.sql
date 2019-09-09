SELECT YEAR(CM.data_hora) AS Ano, 
       MONTH(CM.data_hora) AS Mes,
       DAY(CM.data_hora) AS Dia,
       CM.data_hora,
       U.nome AS Utente,
       M.nome AS Medico


FROM consulta_medica CM
    INNER JOIN utente U ON U.numero_utente = CM.utente
    INNER JOIN medico M ON M.numero_ordem = CM.medico

WHERE CM.realizada = 1

ORDER BY CM.data_hora DESC;




--- Work in progress...
