SELECT id_produto, id_cliente 
FROM tb_compras 
GROUP BY id_produto, id_cliente;

SELECT id_tipo_produto, COUNT(ROWID)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT p.id_tipo_produto, t.nm_tipo_produto, ROUND(AVG(p.preco), 2)
FROM tb_produtos p,
INNER JOIN tb_tipos_produtos t ON (p.id_tipo_produto = t.id_tipo_produto)
GROUP BY p.id_tipo_produto, t.nm_tipo_produto
ORDER BY p.id_tipo_produto ASC;



