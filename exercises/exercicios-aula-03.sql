SELECT e.nome || ' Trabalha para ' || d.nm_departamento || ' Localizado na cidade ' 
    || l.cidade || ' estado ' || l.estado || ' pais ' || p.nm_pais AS "Informações dos empregados"
FROM tb_empregado e
INNER JOIN tb_departamento d USING (id_departamento)
INNER JOIN tb_localizacao l USING (id_localizacao)
INNER JOIN tb_pais p USING (id_pais)
ORDER BY 1 ASC; 


SELECT CONCAT(nome || ' ', sobrenome)  As "Nome Completo"
FROM tb_empregado
WHERE LOWER(CONCAT(nome || ' ', sobrenome)) LIKE ('e_____e%') AND id_departamento = 80 OR id_gerente = 148;


SELECT NVL(g.nome, 'Os Acionistas') || ' Gerencia '|| e.nome AS "Funcionarios"
FROM tb_empregado e
LEFT OUTER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
ORDER BY 1 DESC;

SELECT sobrenome, TRUNC(sysdate - data_admissao) AS "Números de dias trabalhados"
FROM tb_empregado
WHERE id_departamento = 80 
AND TRUNC(sysdate - data_admissao) > 5000;

@\home\oracle\Desktop\scripts\item_5.sql;

SELECT id_empregado || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || telefone || ', ' || data_admissao || ', ' || id_funcao
|| ', ' || percentual_comissao || ', ' || id_gerente || ', ' || id_departamento AS "Saída"
FROM tb_empregado;





