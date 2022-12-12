-- EXERCÍCIOS SUBQUERIES ############################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

WITH numero_de_visitas AS (

SELECT 
	customer_id, 
	count(visit_page_date) AS numero_visitas	
FROM sales.funnel 
GROUP BY customer_id 
)



SELECT 
	cus.*,
	numero_visitas
FROM sales.customers AS cus
LEFT JOIN numero_de_visitas AS num
ON cus.customer_id  = num.customer_id


	