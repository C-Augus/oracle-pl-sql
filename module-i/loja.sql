CREATE TABLE tb_clientes (
    id_cliente INTEGER, 
    nome VARCHAR2(10) NOT NULL, 
    sobrenome VARCHAR2(10) NOT NULL, 
    dt_nascimento DATE, 
    telefone VARCHAR2(12),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_clientes_id_cliente PRIMARY KEY (id_cliente)
); 

CREATE TABLE tb_tipos_produts(
    id_tipo_produto INTEGER,
    nm_tipo_produto VARCHAR2(10) NOT NULL,
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_tipos_produtos_id_tipo_produto PRIMARY KEY (id_tipo_produto)

);

CREATE TABLE tb_produtos(
    id_produto INTEGER,
    id_tipo_produto INTEGER, 
    nm_produto VARCHAR2(30) NOT NULL, 
    ds_produto VARCHAR2(50), 
    preco NUMBER(5,2),
    fg_ativo INTEGER, 
    CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY(id_produto), 
    CONSTRAINT fk_tb_produtos_id_tipo_produto
        FOREIGN KEY (id_tipo_produto)
            REFERENCES tb_tipos_produts(id_tipo_produto)
);


CREATE TABLE tb_compras(
    id_produto INTEGER, 
    id_cliente INTEGER, 
    quantidade INTEGER,
    fg_ativo INTEGER,

    CONSTRAINT fk_compras_id_produto FOREIGN KEY(id_produto)
        REFERENCES tb_produtos(id_produto),
    CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY (id_cliente)
        REFERENCES tb_clientes(id_cliente),
    CONSTRAINT pk_tb_compras_id_product_id_cliente
        PRIMARY KEY(id_produto, id_cliente)
 );
 
 CREATE TABLE tb_funcionarios(
    id_funcionario INTEGER,
    id_gerente INTEGER, 
    nome VARCHAR2(10) NOT NULL, 
    sobrenome VARCHAR2(10) NOT NULL, 
    cargo VARCHAR(20), 
    salario NUMBER(8,2),
    fg_ativo INTEGER, 
    CONSTRAINT pk_tb_funcionarios_id_func PRIMARY KEY(id_funcionario),
    CONSTRAINT fk_tb_funcionarios_id_gerente FOREIGN KEY(id_gerente)
        REFERENCES tb_funcionarios(id_funcionario)

 );
 
 CREATE TABLE tb_grades_salarios(
    id_salario INTEGER, 
    base_salario NUMBER(8,2),
    teto_salario NUMBER(8,2),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_grades_salario_id_salario PRIMARY KEY(id_salario)
 );
 
 UPDATE tb_clientes set  sobrenome = 'Orange' WHERE id_cliente = 2;

SELECT * FROM tb_clientes;

ROLLBACK;

DELETE FROM tb_clientes WHERE id_cliente = 2;


CREATE OR REPLACE PROCEDURE get_cliente(
    p_id_cliente IN tb_clientes.id_cliente%TYPE) 
    
AS 
v_nome        tb_clientes.nome%TYPE;
v_sobrenome   tb_clientes.sobrenome%TYPE;
v_controle    INTEGER;

BEGIN 

    SELECT COUNT(*) INTO v_controle
        FROM tb_clientes WHERE id_cliente = p_id_cliente;
    
    IF(v_controle = 1) THEN 
        SELECT nome, sobrenome INTO v_nome, v_sobrenome
        FROM tb_clientes
        WHERE id_cliente = p_id_cliente;
    
    DBMS_OUTPUT.PUT_LINE('Cliente Localizado: ' || v_nome || '' || v_sobrenome); 
    
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Cliente Não Localizado');
    END IF;
    
    EXCEPTION 
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Erro');
            
END get_cliente;


SET SERVEROUTPUT ON 
BEGIN 
    get_cliente(2);
END;

SET SERVEROUTPUT ON 
BEGIN 
    get_cliente(90);
END;

    


   
    
