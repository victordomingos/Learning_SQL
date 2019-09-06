SELECT P.nome,
       SUM(I.custo)
FROM intervencao I
    INNER JOIN veiculo V
        ON V.matricula=I.veiculo 
    INNER JOIN proprietario P 
        ON V.proprietario=P.nif 
GROUP BY P.nome;

