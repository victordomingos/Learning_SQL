-- Obter o valor arrecadado pela clinica, retirando IVA a 23%.

SELECT SUM(E.especialidade_preco)/1.23 AS lucro_sem_iva

FROM consulta_medica CM
    INNER JOIN medico M
        ON M.numero_ordem = CM.medico
    INNER JOIN especialidade E
        ON E.especialidade_codigo = M.especialidade

WHERE CM.realizada = 1;
