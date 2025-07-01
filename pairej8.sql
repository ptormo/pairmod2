USE northwind;
-- Productos más baratos y caros de nuestra la bases de datos:
--  conocer el precio de los productos que tienen el precio más alto y más bajo. 
-- Dales el alias lowestPrice y highestPrice.

SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
FROM products;

-- otra consulta para conocer el número de productos 
-- y el precio medio de todos ellos (en general, no por cada producto).

SELECT COUNT(product_id), ROUND(AVG(unit_price), 2) -- redondea a 2
FROM products;

--  devuelva la máxima y mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom).
SELECT MAX(freight) AS MAXIMACARGA, MIN(freight) AS MinimoCarga
FROM orders
WHERE ship_country = "UK";

-- ué productos en concreto se venden por encima del precio medio para todos los productos de la empresa, ya que sospechan que dicho número es demasiado elevado. 
-- También quieren que ordenemos los resultados por su precio de mayor a menor.

SELECT AVG(unit_price)
FROM products;

SELECT unit_price, product_name
FROM products
WHERE unit_price > 28.87
ORDER BY unit_price DESC;

-- Qué productos se han descontinuado: De cara a estudiar el histórico de la empresa nos piden una consulta para conocer el número de productos que se han descontinuado. 
-- El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.

SELECT discontinued, product_name
FROM products
WHERE discontinued = 1;

--  aquellos productos no descontinuados, sobre todo el ProductID y ProductName. Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado, que serán los más recientes. No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.

-- ej.5 y 6 ???

-- ej7 esde logística nos piden 
-- el número de pedidos y la máxima cantidad de carga de entre los mismos (freight) que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).

SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
GROUP BY employee_id;

-- ej Descartar pedidos sin fecha y ordénalos:
-- En el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía, por lo que tenemos que mejorar la consulta en este aspecto. 
-- También nos piden que ordenemos los resultados según el ID de empleado para que la visualización sea más sencilla.

SELECT *
FROM orders
WHERE shipped_date != 0000-00-00
ORDER BY employee_id ASC;
-- . Por lo tanto, tendremos que generar una consulta que nos saque el 
-- número de pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).

SELECT COUNT(order_id), (DAY(order_date)), (MONTH(order_date)), (YEAR(order_date))
FROM orders
GROUP BY order_date;

-- La consulta anterior nos muestra el número de pedidos para cada día concreto, pero esto es demasiado detalle. 
-- Genera una modificación de la consulta anterior para que agrupe los pedidos por cada mes concreto de cada año.

SELECT COUNT(order_id), (MONTH(order_date)), (YEAR(order_date))
FROM orders
GROUP BY order_date
	HAVING COUNT(DISTINCT(MONTH(order_date)));
    