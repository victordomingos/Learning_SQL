USE centro_mecanico_v1_0;

SELECT veiculo.matricula, proprietario.nif, proprietario.nome, (orcamento*0.10) as 'Taxa de orçamento'
FROM intervencao 
INNER JOIN veiculo ON intervencao.veiculo = veiculo.matricula
INNER JOIN proprietario ON veiculo.proprietario=proprietario.nif
WHERE NOT realizou_se;
