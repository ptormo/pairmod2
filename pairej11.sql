USE northwind;

-- una tabla con aquellas compañías afincadas en ciudades que empiezan por "A" o "B"
-- Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.
SELECT * FROM customers
SELECT * FROM order_details
SELECT * FROM orders
SELECT * FROM suppliers

SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';

-- Número de pedidos que han hecho en las ciudades que empiezan con L.
-- devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".

SELECT c.city, c.company_name, c.contact_name, COUNT(o.order_id)
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE city LIKE 'L%'
GROUP BY c.city, c.company_name, c.contact_name;

-- Todos los clientes cuyo "country" no incluya "Sales"
-- Extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . 
-- Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.

SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE '%Sales%'; 

-- Todos los clientes que no tengan una "A" en segunda posición en su nombre.
-- Devolved unicamente el nombre de contacto.

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_a%';

-- devuelva todos los clientes y proveedores 
-- la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente)
-- No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal

SELECT city, company_name, contact_name, "Customers" AS Relationship
FROM customers 

UNION

SELECT city, company_name, contact_name, "Suppliers"
FROM suppliers

-- Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

SELECT * FROM categories

SELECT *
FROM categories
WHERE description LIKE '%Sweet' OR description LIKE '%sweet%';

-- Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:
-- Tendremos que combinar dos columnas usando concat para unir dos columnas. 
SELECT * FROM employees

SELECT contact_name AS NombreCompleto
FROM customers
UNION
SELECT concat(first_name," ", last_name) 
FROM employees;
