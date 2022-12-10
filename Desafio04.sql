-- EXERCÍCIOS  JOINS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

SELECT 
	pro.brand, 
	count(visit_page_date) AS visitas
FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
	ON fun.product_id = pro.product_id 
GROUP BY pro.brand
ORDER BY visitas DESC


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT 
	sto.store_name , 
	count(fun.visit_page_date) AS visitas
	
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
	ON fun.store_id = sto.store_id 
GROUP BY sto.store_name 
ORDER BY visitas DESC


-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

SELECT 
	r."size", 
	count(c.state) AS quantidade_clientes
FROM sales.customers c 
LEFT JOIN temp_tables.regions r 
	ON lower(c.state) = lower(r.state)
	AND lower(c.city) = lower(r.city)
GROUP BY r."size"
ORDER BY quantidade_clientes DESC









