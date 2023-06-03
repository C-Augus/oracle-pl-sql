--01
SELECT nome, sobrenome
    FROM tb_empregado
    WHERE LOWER(nome) LIKE '%li%';

--02
SELECT nome, sobrenome, SUBSTR(nome, 1,1)  ||  ' '  ||  substr(sobrenome, 1, 10)
    FROM tb_empregado
    WHERE LENGTH(nome) + LENGTH(sobrenome) >= 10;

--03
SELECT SUBSTR(TO_CHAR(data_termino), 8, 2), id_funcao, COUNT(*)
    FROM tb_historico_funcao
    GROUP BY substr(to_char(data_termino), 8, 2), id_funcao
    ORDER BY 3;

--04
SELECT TO_CHAR(data_admissao, 'DAY') "Data Contratação", COUNT(*)
    FROM tb_empregado
    GROUP BY TO_CHAR(data_admissao, 'DAY')
    HAVING COUNT(*) >= 20;
         
--05
SET serveroutput ON;

CREATE OR REPLACE PROCEDURE procedure_ex5_lista08(
    p_id_departamento IN tb_departamento_copia.id_departamento%TYPE
)

AS 

v_controle VARCHAR2(30) := 'Ç';

BEGIN 
dbms_output.put_line('entrou begin');


SELECT nm_departamento  INTO v_controle
    FROM tb_departamento_copia
    WHERE id_departamento = p_id_departamento;

          
IF(v_controle != 'Ç')
    THEN dbms_output.put_line('entrou if');
    IF(substr(v_controle, 1, 1) IN ('A', 'E', 'I', 'O', 'U'))
            THEN UPDATE tb_departamento_copia
                SET nm_departamento = lower(v_controle)
                WHERE id_departamento = p_id_departamento;
                
                COMMIT;
                dbms_output.put_line('Nome do departamento alterado para ' || lower(v_controle));
        ELSE
            UPDATE tb_departamento_copia
            SET nm_departamento = upper(v_controle)
            WHERE id_departamento = p_id_departamento;
            
            COMMIT;
            dbms_output.put_line('Nome do departamento alterado para ' || upper(v_controle));
        END IF;

END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put('entrou else');
        ROLLBACK;
        
END procedure_ex5_lista08; 

CALL procedure_ex5_lista08;