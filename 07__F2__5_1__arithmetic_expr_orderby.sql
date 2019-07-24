SELECT especialidade_designacao, (especialidade_preco*1.05) AS 'Preço Final'
FROM especialidade
ORDER BY 'Preço Final' DESC;
