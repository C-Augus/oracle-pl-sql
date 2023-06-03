SELECT id_cliente, nome, sobrenome, dt_nascimento, telefone 
FROM tb_clientes;

SELECT * 
FROM tb_clientes;

SELECT * 
FROM tb_clientes
WHERE id_cliente = 2;

SELECT ROWID, id_cliente
FROM tb_clientes;

DESCRIBE tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 3;

SELECT 2 * 6 
FROM dual;

SELECT 10 * 12 / 3 - 1
FROM dual;

SELECT 10 * (12 / 3 -1)
FROM dual;

SELECT TO_DATE('22/JUN/2020') + 2
FROM dual;

SELECT TO_DATE('31/DEC/2020') - TO_DATE('22/JUN/2020')
FROM dual;

SELECT nm_produto, preco, preco + 2
FROM tb_produtos;

DESCRIBE dual;

SELECT *
FROM dual;

SELECT preco, preco * 2 "Dobro do Preço"
FROM tb_produtos; 

SELECT nome || ' ' || sobrenome AS "Nome do Cliente"
FROM tb_clientes;

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL;

SELECT id_cliente, nome, sobrenome, telefone
FROM tb_clientes
WHERE telefone IS NULL;

-- o valor substituto deve ser do tipo da coluna
SELECT id_cliente, nome, sobrenome,
    NVL(telefone, 'Número do telefone desconhecido') AS Número_Telefone
FROM tb_clientes;

SELECT id_cliente, nome, sobrenome, 
    NVL(dt_nascimento, '22/JUN/2013') AS "Data de Nascimento"
FROM tb_clientes;

SELECT nome, LENGTH(nome) "expressão1",
       sobrenome, LENGTH(sobrenome) "expressão2",
       NULLIF(LENGTH(nome), LENGTH(sobrenome)) "resultado"
FROM tb_funcionarios;

SELECT id_cliente
FROM tb_compras;

SELECT DISTINCT id_cliente
FROM tb_compras;

SELECT * 
FROM tb_clientes
WHERE id_cliente <> 2;

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2;

SELECT ROWNUM, id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;

SELECT *
FROM tb_clientes
WHERE id_cliente > ANY(2, 3, 4);

SELECT * 
FROM tb_clientes
WHERE id_cliente > ALL (2, 3, 4);

SELECT * 
FROM tb_clientes
WHERE nome LIKE '_o%';

SELECT * 
FROM tb_clientes
WHERE nome LIKE '%a';

SELECT * 
FROM tb_clientes
WHERE nome LIKE '____';

SELECT *
FROM tb_clientes
WHERE nome LIKE '%h%';

SELECT nome 
FROM tb_promocao
WHERE nome LIKE '%\%%' ESCAPE '\';

SELECT *
FROM tb_clientes
WHERE id_cliente IN (2, 3, 5);

SELECT *
FROM tb_clientes 
WHERE id_cliente NOT IN (2, 3, 5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NULL);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NVL(NULL, 0));

SELECT * 
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

SELECT * 
FROM tb_clientes 
WHERE id_cliente NOT BETWEEN 1 AND 3;

SELECT * 
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/1970' AND id_cliente > 3;

SELECT *
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/1970' OR id_cliente > 3;

SELECT * 
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/1970' OR id_cliente < 2 
    AND telefone LIKE '%1211';
    



