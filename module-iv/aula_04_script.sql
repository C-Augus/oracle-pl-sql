SELECT LEVEL, LPAD(' ', 2 * LEVEL - 1) || nome || ' ' || sobrenome AS funcionario
    FROM tb_mais_funcionarios
    START WITH id_funcionario = 1
    CONNECT BY PRIOR id_funcionario = id_gerente;


SELECT id_divisao, SUM(salario)
    FROM tb_funcionarios_2
    GROUP BY id_divisao
    ORDER BY id_divisao;

SELECT id_divisao, SUM(salario)
    FROM tb_funcionarios_2
    GROUP BY ROLLUP (id_divisao)
    ORDER BY id_divisao;
    
SELECT id_divisao, id_cargo, SUM(salario)
    FROM Tb_funcionarios_2
    GROUP BY ROLLUP (id_divisao, id_cargo)
    ORDER BY id_divisao, id_cargo;
    
SELECT id_divisao, id_cargo, SUM(salario)
    FROM tb_funcionarios_2
    GROUP BY CUBE(id_divisao, id_cargo)
    ORDER BY id_divisao, id_cargo;
    
--GROUPING PRECISA TER O ROLLUP NO GROUP BY
SELECT GROUPING(id_divisao), id_divisao, SUM(salario)
    FROM tb_funcionarios_2
    GROUP BY ROLLUP(id_divisao)
    ORDER BY id_divisao;
    
SELECT
    CASE GROUPING(id_divisao)
        WHEN 1 THEN 'Todas as Divisões'
        ELSE id_divisao
    END AS DIV, SUM(salario)
    FROM tb_funcionarios_2
    GROUP BY ROLLUP(id_divisao)
    ORDER BY id_divisao;
    
--DML
INSERT INTO tb_clientes (id_cliente,
                         nome,
                         sobrenome,
                         dt_nascimento,
                         telefone,
                         fg_ativo)
    VALUES
    (7, 'Joaquim', 'Silva', '26-FEB-1977', '800-666-2522', 1);
    
INSERT INTO tb_clientes
    VALUES(8, 'Jane', 'Green', '01-JAN-1970', '800-555-9999', 1);

INSERT INTO tb_clientes
    VALUES(9, 'Sophie', 'White', NULL, NULL, 1);
    
INSERT INTO tb_clientes
    VALUES(10, 'Kyle', 'O''Malley', NULL, NULL, 10);
    
SELECT * FROM tb_clientes;

INSERT INTO tb_produtos (id_produto,
                         id_tipo_produto,
                         nm_produto,
                         ds_produto,
                         preco,
                         fg_ativo)
    VALUES
    (14, 1, 'The "Great" Gatsby', NULL, 12.99, 1);
    
INSERT INTO tb_clientes (id_cliente,
                         nome,
                         sobrenome)
    SELECT 11, nome, sobrenome
    FROM tb_clientes
    WHERE id_cliente = 1;
    
UPDATE tb_clientes
    SET sobrenome = 'Orange'
    WHERE id_cliente = 2;
    
ROLLBACK;

UPDATE tb_produtos
    SET
        preco = preco * 1.20,
        nm_produto = LOWER(nm_produto)
        WHERE preco > 20.00;
   
SET serveroutput ON;   
        
DECLARE media_preco_produto NUMBER;

BEGIN
    UPDATE tb_produtos
        SET preco = preco * 0.75
        RETURNING AVG(preco) INTO media_preco_produto;
    
dbms_output.put_line('Valor da variável: ' || media_preco_produto);
END;

DELETE
    FROM tb_clientes
    WHERE id_cliente = 10;
    
ROLLBACK;

--ORA-00001: unique constraint (LOJA.PK_TB_CLIENTES_ID_CLIENTE) violated
INSERT INTO Tb_clientes (id_cliente,
                         nome,
                         sobrenome,
                         dt_nascimento,
                         telefone,
                         fg_ativo)
    VALUES
    (1, 'Jason', 'Price', '01-JAN-60', '800-555-1211', 1);
    
--ORA-00001: unique constraint (LOJA.PK_TB_CLIENTES_ID_CLIENTE) violated
UPDATE tb_clientes
    SET id_cliente = 1
    WHERE id_cliente = 2;
    
--ORA-02291: integrity constraint (LOJA.FK_TB_PRODUTOS_ID_TIPO_PRODUTO) violated - parent key not found
INSERT INTO tb_produtos(id_produto,
                        id_tipo_produto,
                        nm_produto,
                        ds_produto,
                        preco,
                        fg_ativo)
    VALUES
    (15, 6, 'Teste', 'Teste', NULL, 1);
    
--ORA-02291: integrity constraint (LOJA.FK_TB_PRODUTOS_ID_TIPO_PRODUTO) violated - parent key not found 
UPDATE tb_produtos
    SET id_tipo_produto = 6
    WHERE id_produto = 1;
    
--ORA-02292: integrity constraint (LOJA.FK_TB_PRODUTOS_ID_TIPO_PRODUTO) violated - child record found 
DELETE 
    FROM tb_tipos_produtos
    WHERE id_tipo_produto = 1;
 
 --CRIANDO TABELA COM UM CAMPO POSSUINDO VALOR PADRÃO
CREATE TABLE tb_status_encomenda(
    id_status_encomenda INTEGER,
    status              VARCHAR2(40) DEFAULT 'Encomenda disponibilizada' NOT NULL,
    ultima_modificacao  DATE DEFAULT SYSDATE,
    PRIMARY KEY (id_status_encomenda)
);

INSERT INTO tb_status_encomenda(id_status_encomenda)
    VALUES (1);
    
INSERT INTO tb_status_encomenda(id_status_encomenda,
                                status,
                                ultima_modificacao)
    VALUES (2, 'Encomenda enviada', '01-MAY_2013');
    
UPDATE tb_status_encomenda 
    SET status = DEFAULT
    WHERE id_status_encomenda = 2;
    
SELECT * FROM tb_produtos_alterados;

MERGE INTO tb_produtos p
    USING tb_produtos_alterados pa ON(p.id_produto = pa.id_produto)
    WHEN MATCHED THEN 
        UPDATE
            SET
            p.id_tipo_produto = pa.id_tipo_produto,
            p.nm_produto = pa.nm_produto,
            p.ds_produto = pa.ds_produto,
            p.preco = pa.preco,
            p.fg_ativo = pa.fg_ativo
    WHEN NOT MATCHED THEN
        INSERT(p.id_produto,
               p.id_tipo_produto,
               p.nm_produto,
               p.ds_produto,
               p.preco,
               p.fg_ativo)
        VALUES(pa.id_produto,
               pa.id_tipo_produto,
               pa.nm_produto,
               pa.ds_produto,
               pa.preco,
               pa.fg_ativo);
               

SELECT id_produto, id_tipo_produto, nm_produto, preco
    FROM tb_produtos
    WHERE id_produto IN (1, 2, 3, 13, 14, 15);
    
INSERT INTO tb_clientes
    VALUES (12, 'Geraldo', 'Henrique', '31-JUL-1988', '800-112233', 1);
    
UPDATE tb_clientes
    SET nome = 'José'
    WHERE id_cliente = 1;
    
SELECT *
    FROM tb_clientes
    ORDER BY 1;
    
ROLLBACK;

SELECT id_produto, preco
    FROM tb_produtos
    WHERE id_produto IN (4, 6);
--  ID_PRODUTO    PRECO
---------- ----------
--         4      13.95
--         6      49.99  

UPDATE Tb_produtos
    SET preco = preco * 1.20
    WHERE id_produto = 4;
    COMMIT;
--A INSTRUÇÃO A SEGUIR DEFINE UM SAVEPOINT CHAMADO SAVE1
    SAVEPOINT save1;
   
UPDATE Tb_produtos
    SET preco = preco * 1.30
    WHERE id_produto = 6;
    
SELECT id_produto, preco
    FROM tb_produtos
    WHERE id_produto IN (4, 6);
--ID_PRODUTO      PRECO
---------- ----------
--         4      16.74
--         6      49.99

ROLLBACK TO SAVEPOINT save1;

SELECT id_produto, preco
    FROM tb_produtos
    WHERE id_produto IN (4, 6);
--ID_PRODUTO      PRECO
---------- ----------
--         4      16.74
--         6      49.99

