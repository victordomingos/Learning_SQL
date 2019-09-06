SELECT P.nome,
       SUM(I.custo)
  FROM intervencao I,
       veiculo V,
       proprietario P 
 WHERE V.matricula=I.veiculo 
   AND V.proprietario=P.nif 
 GROUP BY P.nome;

