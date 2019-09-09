-- Listar TODOS os utentes e a data das consultas de cada um 
-- (a data aparece a NULL caso o utente ainda não tenha tido consulta)
SELECT U.nome,
       U.data_nascimento,
       CM.data_hora

FROM utente U 
    LEFT JOIN consulta_medica CM 
        ON U.numero_utente = CM.utente;
