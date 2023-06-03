--01
INSERT INTO tb_homem
  VALUES
    (10, Anserdson, NULL);
INSERT INTO tb_homem
  VALUES
    (20, Jander, 1);
INSERT INTO tb_homem
  VALUES
    (30, Rogerio, 2);

--02
INSERT INTO tb_mulher
  VALUES
    (1, Edna);
INSERT INTO tb_mulher
  VALUES
    (2, Stefanny);
INSERT INTO tb_mulher
  VALUES
    (3, Cassia);
    
--03
----a)
SELECT nome_homem, nome_mulher
  FROM tb_homem h, tb_mulher m
  WHERE h.id_mulher = m.id_mulher;
----b)
SELECT nome_homem, nome_mulher
  FROM tb_homem h
  NATURAL JOIN tb_mulher m;
----c)
SELECT nome_homem, nome_mulher
  FROM tb_homem h
  INNER JOIN tb_mulher m
  USING (id_mulher);
----d)
SELECT nome_homem, nome_mulher
  FROM tb_homem h
  INNER JOIN tb_mulher m
    ON (h.id_mulher = m.id_mulher);
----e)
SELECT nome_homem  nome_mulher
  FROM tb_homem h
  CROSS JOIN tb_mulher m;
  
SELECT nome_homem, nome_mulher
  FROM tb_homem h, tb_mulher m;

--04
----a)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  LEFT JOIN tb_mulher m
    USING (id_mulher);
----b)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  RIGHT JOIN tb_mulher m
    USING (id_mulher);
----c)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  OUTER JOIN tb_mulher m
  WHERE h.id_mulher (+) = m.id_mulher;
----d)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h, tb_mulher m
  WHERE h.id_mulher = m.id_mulher (+);
----e)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  RIGHT OUTER JOIN tb_mulher m
  USING(id_mulher);
  
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  RIGHT OUTER JOIN tb_mulher m
  ON (h.id_mulher = m.id_mulher);
----f)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  FULL OUTER JOIN tb_mulher m
  USING(id_mulher);
----g)
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  FULL OUTER JOIN tb_mulher m
  USING(id_mulher);
  
SELECT h.nome_homem, m.nome_mulher
  FROM tb_homem h
  FULL OUTER JOIN tb_mulher m
  ON (h.id_mulher = m.id_mulher);