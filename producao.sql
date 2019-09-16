--  Victor Domingos
--  2019-09-13
--  Producao SQL


-- 1.
CREATE DATABASE postais_control;

-- 1.1
USE postais_control
\. criacao_database_postais.sql
\. insercoes.sql
-- Nota: o script de insercao de dados apresenta varios problemas relacionados com referencias de chave estrangeira referentes a valores inexistentes de chave primaria nas tabelas referenciadas. Para solucionar, seria necessario decidir o que fazer com esses registos, dependendo da situacao: ou apagar as linhas referentes à insercao desses registos específicos, ou alterar de modo a que as chaves estrangeiras correspondessem ao codigo (chave primaria) na tabela referenciada, ou criando previamente os registos com a chave primeira em questao nas tabelas referenciadas com as chaves estrangeiras. Para a realizacao desta producao, optei por adicionar ao script de insercao os registos em falta.


-- 2.1
SELECT codigo, tipo, ano FROM postal;


-- 2.2
SELECT DISTINCT postal FROM oferta;


-- 2.3
SELECT R.nome AS Recetor, 
       COUNT(postal) as 'Postais recebidos' 
FROM oferta O 
    RIGHT JOIN recetor R 
        ON O.recetor=R.codigo 

GROUP BY R.nome 
ORDER BY 'Postais recebidos' DESC;


-- 2.4
SELECT postal, 
       COUNT(postal) AS 'ofertas' 
FROM oferta 
GROUP BY postal 
HAVING ofertas = (SELECT MAX(C) 
                  FROM (SELECT COUNT(postal) as C
                        FROM oferta O
                        GROUP BY postal
                       )OF
                 );


-- 2.5
SELECT R.nome AS Recetor, 
       COUNT(postal)*0.50 as 'Valor Gasto' 
FROM oferta O 
    RIGHT JOIN recetor R 
        ON O.recetor=R.codigo 

GROUP BY R.nome 
ORDER BY 'valor gasto' DESC;


-- 2.6
SELECT R.nome, T.designacao AS Recetor, 
       COUNT(postal)*0.50 as 'Valor Gasto' 
FROM oferta O 
    RIGHT JOIN recetor R 
        ON O.recetor=R.codigo 
    INNER JOIN postal P
        ON P.codigo=O.postal
    INNER JOIN tipo T
        ON T.codigo = P.codigo

GROUP BY R.nome, T.designacao;


-- 2.7
SELECT YEAR(O.data_hora) as Ano,
       COUNT(postal) as 'Num. Postais',
       COUNT(postal)*0.50 as 'Valor Gasto' 
FROM oferta O 

GROUP BY Ano;


-- 2.8
SELECT O.codigo as 'N. oferta', 
       DATE(O.data_hora) as Data,
       OF.nome as 'Oferecedor', 
       R.nome as 'Recebedor',
       T.designacao as 'Tipo'

FROM oferta O 
    INNER JOIN oferecedor OF 
        ON O.oferecedor=OF.codigo
    INNER JOIN recetor R 
        ON O.recetor=R.codigo
    INNER JOIN postal P
        ON P.codigo=O.postal
    INNER JOIN tipo T
        ON T.codigo=P.tipo

WHERE MONTH(O.data_hora)=8;


-- 2.9 
SELECT O.codigo as 'N. oferta', 
       DATE(O.data_hora) as Data,
       OF.nome as 'Oferecedor', 
       R.nome as 'Recebedor',
       T.designacao as 'Tipo'

FROM oferta O 
    INNER JOIN oferecedor OF 
        ON O.oferecedor=OF.codigo
    INNER JOIN recetor R 
        ON O.recetor=R.codigo
    INNER JOIN postal P
        ON P.codigo=O.postal
    INNER JOIN tipo T
        ON T.codigo=P.tipo

WHERE O.data_hora BETWEEN '2016-12-21' AND '2016-12-28';



-- 2.10
SELECT codigo, nome, morada FROM oferecedor WHERE contacto is NULL
UNION
SELECT codigo, nome, morada FROM recetor WHERE contacto is NULL;

-- 2.11
SELECT O.codigo as 'N. oferta', 
       DATE(O.data_hora) as Data,
       OF.nome as 'Oferecedor', 
       R.nome as 'Recebedor',
       T.designacao as 'Tipo'

FROM oferta O 
    INNER JOIN oferecedor OF 
        ON O.oferecedor=OF.codigo
    INNER JOIN recetor R 
        ON O.recetor=R.codigo
    INNER JOIN postal P
        ON P.codigo=O.postal
    INNER JOIN tipo T
        ON T.codigo=P.tipo

WHERE DAY(data_hora) IN (2, 6, 19);


-- 3.1 
DELETE FROM oferta
WHERE YEAR(data_hora)<2017;


-- 4.1

INSERT INTO oferecedor VALUES(NULL, 'Neca', 'Rua Sesamo', NULL);
-- Nota: O registo acima recebeu o codigo 9 na minha base de dados.

INSERT INTO recetor VALUES(NULL, 'Mica', 'Rua Sesamo', NULL);
-- Nota: O registo acima recebeu o codigo 8 na minha base de dados.

INSERT INTO postal VALUES(NULL, 3, 2018);
-- Nota: O registo acima recebeu o codigo 10 na minha base de dados.

INSERT INTO oferta VALUES(NULL, '2019-08-12 12:00:00', 9, 8, 10);


-- 5.1
UPDATE tipo SET preco_compra=(preco_compra+0.20);
-- Nota: Como o enunciado não especifica quais os registos a alterar, a instrução acima altera todos os preços.


-- 6.1
CREATE VIEW lista_postais_oferecidos AS (SELECT * FROM postal);
--Nota: selecionei da tabela postal uma vez que o enunciado refere 'postais existentes'.

-- 6.2 
CREATE VIEW lista_postais_sem_repeticao 
AS (SELECT DISTINCT P.codigo, P.tipo, P.ano 
    FROM postal P 
        INNER JOIN oferta O 
        ON O.postal=P.codigo);
-- Nota: selecionei também da tabela oferta uma vez que o enunciado referia 'postais oferecidos'.



