USE northwind;
SELECT * FROM northwind.orders;
-- 1  ID cliente, nombre de la empresa, número de pedidos (UK)

SELECT c.customer_id AS Identificador, c.company_name AS nombreempresa, COUNT(DISTINCT o.order_id) AS NumeroPedidos
FROM customers AS c
INNER JOIN orders AS o
	ON c.customer_id = o.customer_id
    WHERE country = 'UK'
    GROUP BY c.customer_id, c.company_name;
    
    
-- Objetos ha tenido cada empresa cliente de UK por año (UK) // conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 

SELECT customers.company_name, YEAR(orders.order_date), SUM(order_details.quantity)
FROM customers
INNER JOIN orders
	ON customers.customer_id = orders.customer_id
INNER JOIN order_details
	ON orders.order_id = order_details.order_id
    WHERE country = 'UK'
    GROUP BY customers.company_name, YEAR(orders.order_date);


-- Nombre de cada compañia cliente con cada pedido realizado y fecha
SELECT customers.company_name AS CompanyName, orders.order_id AS OrderID, orders.order_date AS OrderDate
FROM customers 
INNER JOIN orders 
ON customers.customer_id = orders.customer_id
ORDER BY customers.company_name, orders.order_date


