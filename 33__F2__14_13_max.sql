-- Qual o médico que mais consultas deu?

SELECT M.nome, COUNT(*) as total_consultas

FROM medico M
    INNER JOIN consulta_medica CM
        on M.numero_ordem = CM.medico

WHERE CM.realizada = 1
GROUP BY CM.medico
HAVING total_consultas = (
    SELECT COUNT(*) as total_consultas

    FROM medico M
        INNER JOIN consulta_medica CM
            on M.numero_ordem = CM.medico

    WHERE CM.realizada = 1
    GROUP BY CM.medico
    ORDER BY total_consultas DESC
    LIMIT 1
    );
