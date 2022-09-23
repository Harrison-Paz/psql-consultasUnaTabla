-- Active: 1663602984203@@127.0.0.1@5433@tienda_informatica

-- Lista el nombre de todos los productos que hay en la tabla producto.

SELECT nombre FROM public.producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio FROM public.producto;

-- Lista todas las columnas de la tabla producto.

SELECT * FROM public.producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre, precio, precio*1.0006000 FROM public.producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT
    nombre as "nombre de producto",
    precio * 1.0006000 as euros,
    precio as dolares
FROM public.producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT
    UPPER(nombre) as nombres,
    precio as precios
FROM public.producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT
    LOWER(nombre) as nombres,
    precio as precios
FROM public.producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, UPPER(LEFT(nombre,2)) FROM public.fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio::numeric) FROM public.producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT
    nombre,
    TRUNC(precio :: numeric) as trucado
FROM public.producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto.

SELECT codigo_fabricante FROM public.producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT codigo_fabricante FROM public.producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre FROM public.fabricante ORDER BY nombre ASC;

-- Listar los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente

SELECT nombre, precio
FROM public.producto
ORDER BY nombre, precio DESC;

-- Devuleve una lista con las 5 primeras filas de la tabla fabricante

SELECT * FROM public.fabricante LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila tambien se debe incluir en la respuesta

SELECT * FROM public.producto LIMIT 2 OFFSET 3;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio FROM public.producto ORDER BY precio LIMIT 1;

-- Lista el nombre y el precio del producto mas caro. (Utilice solamente las clausulas ORDER BY y LIMIT)

SELECT nombre, precio
FROM public.producto
ORDER BY precio DESC
LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo codigo de fabricante es igual a 2;

SELECT nombre
FROM public.producto prod
WHERE
    prod.codigo_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120

SELECT nombre FROM public.producto WHERE precio::numeric <= 120;

-- Listar el nombre de los productos que tienen un precio mayor o igal a 400

SELECT nombre FROM public.producto WHERE precio::numeric >=400;

-- Listar el nombre de los productos que no tienen un precio mayor o igual a 400;

SELECT nombre FROM public.producto WHERE precio::numeric < 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT nombre
FROM public.producto
WHERE
    precio :: numeric >= 80
    AND precio :: numeric <= 300;

-- Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el operador BETWEEN

SELECT *
FROM public.producto
WHERE
    precio :: numeric BETWEEN 60 AND 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.

SELECT *
FROM public.producto
WHERE
    precio :: numeric > 200
    AND codigo_fabricante = 6;

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT *
FROM public.producto
WHERE
    codigo_fabricante = 1
    OR codigo_fabricante = 3
    OR codigo_fabricante = 5;

-- Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT * FROM public.producto WHERE codigo_fabricante IN (1,3,5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT nombre, precio*100 as centimos FROM public.producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT nombre FROM public.fabricante WHERE nombre ILIKE 's%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT nombre FROM public.fabricante WHERE nombre LIKE '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT nombre FROM public.fabricante WHERE nombre ILIKE '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT nombre FROM public.fabricante WHERE nombre LIKE '____';

--o tambie

SELECT nombre
FROM public.fabricante
WHERE
    character_length(nombre) = 4;

--o tambien

SELECT nombre FROM public.fabricante WHERE char_length(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT nombre FROM public.producto WHERE nombre ILIKE '%Portátil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT nombre, precio
FROM public.producto
WHERE
    nombre ILIKE '%Monitor%'
    AND precio :: numeric < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio
FROM public.producto
WHERE precio :: numeric >= 180
ORDER BY precio DESC, nombre;