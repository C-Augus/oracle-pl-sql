SELECT ASCII('a'), ASCII('A'), ASCII('z'), ASCII('Z'), ASCII('0'), ASCII('9')
FROM dual;

SELECT CHR(97), CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

SELECT CONCAT(nome, sobrenome)
FROM tb_funcionarios;

SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos;

SELECT  nm_produto, INSTR(nm_produto, 'Science')
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, INSTR(nm_produto, 'e', 1, 2)
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;


SELECT UPPER(nome), LOWER(sobrenome)
FROM tb_funcionarios;

SELECT RPAD(nm_produto, 30, '.'), LPAD(preco, 8, '+')
FROM tb_produtos;

SELECT 
    LTRIM('  Olá pessoal tudo joia?'), 
    RTRIM('Oi tudo bem!abcabc', 'abc'),
    TRIM('0' FROM '000Treinamento Oracle!0000')
FROM dual;

SELECT id_cliente, NVL(telefone, 'Telefone Inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;

SELECT id_cliente, NVL2(telefone,'Telefone Existente', 'Telefone Inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;

