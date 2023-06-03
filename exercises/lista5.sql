--01
SELECT 'O identificador da ' || ds_funcao || ' e o ID: ' || id_funcao
 FROM tb_funcao;
 
--02
SELECT (22/7) * 6000 * 6000 AS "Area"
  FROM Dual;
  
--03
SELECT nm_departamento
  FROM tb_departamento
  WHERE nm_departamento LIKE ('%ing');
  
--04
SELECT ds_funcao, base_salario, (teto_salario - base_salario)
  FROM tb_funcao
  WHERE ds_funcao LIKE '%Presidente%' 
     OR ds_funcao LIKE '%Gerente%'
  ORDER BY (teto_salario - base_salario) DESC, ds_funcao ASC;
  
--05
SELECT id_empregado, nome, salario, (salario * 12) "SALARIO ANUAL",
       &&v_aliquota "ALIQUOTA", (&&v_aliquota * (salario * 12)) "ALIQUOTA"
  FROM tb_empregado
  WHERE id_empregado = &v_id_empregado;