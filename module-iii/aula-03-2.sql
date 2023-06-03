SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(TO_CHAR(dt_nascimento, 'YYYY'), '196[5-8]$');

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes 
WHERE REGEXP_LIKE(nome, 'j', 'i');

SELECT  
    REGEXP_INSTR('Teste de expressão regular', 'e', 6, 2)
FROM dual;

SELECT 
    REGEXP_REPLACE('Teste de expressão regular', 'd[[:alpha:]]{1}', 'Oracle') as Resultado
FROM dual;

SELECT 
    REGEXP_SUBSTR('Teste de expressão regular', 'e[[:alpha:]]{8}') as Resultado
FROM dual;


SELECT 
    REGEXP_COUNT('teste teste teste expressão regular', 't[[:alpha:]]{4}') as Resultado
FROM dual;

SELECT ROUND(AVG(preco),2) AS MEDIA
FROM tb_produtos;

SELECT CAST(AVG(preco) AS NUMBER(5, 2)) AS MEDIA
FROM tb_produtos;

SELECT AVG(preco + 2.00)
FROM tb_produtos;

SELECT AVG(DISTINCT(preco))
FROM tb_produtos;

SELECT COUNT(id_produto)
FROM tb_produtos;

SELECT COUNT(ROWID)
FROM tb_produtos;

SELECT nm_produto, preco
FROM tb_produtos
WHERE preco = 
    (SELECT MAX(preco) 
    FROM tb_produtos);

SELECT MAX(nm_produto), MIN(nm_produto)
FROM tb_produtos;

SELECT MAX(dt_nascimento), MIN(dt_nascimento)
FROM tb_clientes;

SELECT STDDEV(preco)
FROM tb_produtos;

SELECT SUM(preco)
FROM tb_produtos;

SELECT VARIANCE(preco)
FROM tb_produtos;

SELECT id_produto, id_cliente
FROM tb_compras
GROUP BY id_produto, id_cliente;

