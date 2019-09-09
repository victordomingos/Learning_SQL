--Qual o montante total arrecadado por cada medico?

SELECT M.nome, SUM(E.especialidade_preco)

FROM medico M 
    INNER JOIN especialidade E
        ON M.especialidade = E.especialidade_codigo
    INNER JOIN consulta_medica CM
        ON M.numero_ordem = CM.medico

GROUP BY M.nome;
