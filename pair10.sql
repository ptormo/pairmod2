USE northwind;
-- Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?

SELECT trabajador.first_name, trabajador.last_name, trabajador.country, trabajador.reports_to, jefa.employee_id, jefa.first_name, jefa.last_name, jefa.country
FROM employees AS trabajador
	LEFT JOIN employees AS jefa
    ON trabajador.reports_to = jefa.employee_id;
-- una lista con todas las categorías de productos, incluso si no tienen productos asociados. Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. 
-- Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'.

SELECT *
FROM products;
SELECT * FROM categories;

SELECT p.product_name, c.category_name -- no hay null???
FROM products AS p
	RIGHT JOIN categories AS c
    ON p.product_id = c.category_id;
-- ista de todos los pedidos junto con los datos de las empresas clientes. Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. 
-- Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.
SELECT o.order_id, c.customer_id, c.company_name -- null??
FROM orders AS o
LEFT JOIN customers AS c
	ON o.customer_id = c.customer_id;
-- qué empleadas han gestionado pedidos y cuáles no. Queremos obtener una lista con todas las empleadas 
-- y, si han gestionado pedidos, mostrar los detalles del pedido.
SELECT e.employee_id, e.first_name, o.order_id, o.employee_id, od.order_id, od.product_id, od.unit_price, od.quantity
FROM employees AS e
LEFT JOIN orders AS o
 ON o.employee_id = e.employee_id
	LEFT JOIN order_details AS od
    ON o.order_id = od.order_id;
    
--  los transportistas (shippers) y los pedidos que han enviado. 
-- Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.

SELECT * FROM shippers;

SELECT s.shipper_id, o.order_id, o.ship_via
FROM shippers AS s
LEFT JOIN orders AS o
ON s.shipper_id = o.ship_via;