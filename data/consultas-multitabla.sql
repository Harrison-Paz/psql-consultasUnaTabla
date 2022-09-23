-- Active: 1663602984203@@127.0.0.1@5433@tienda_informatica

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT
    prod.nombre Producto,
    prod.precio Precio,
    fab.nombre Fabricante
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT
    prod.nombre Producto,
    prod.precio Precio,
    fab.nombre Fabricante
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
ORDER BY fab.nombre;

-- Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT
    prod.codigo "Codigo producto",
    prod.nombre Producto,
    fab.codigo "Codigo fabricante",
    fab.nombre Fabricante
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT
    prod.nombre Producto,
    prod.precio Precio,
    fab.nombre
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
ORDER BY prod.precio
LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT
    prod.nombre Producto,
    prod.precio Precio,
    fab.nombre Fabricante
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
ORDER BY prod.precio DESC
LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT
    prod.codigo,
    prod.nombre,
    prod.precio
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
WHERE fab.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT
    prod.codigo,
    prod.nombre,
    prod.precio
FROM public.fabricante fab
    INNER JOIN public.producto prod ON fab.codigo = prod.codigo_fabricante
WHERE
    fab.nombre = 'Crucial'
    AND prod.precio :: numeric > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett - Packardy Seagate.Sin utilizar el operador IN.

SELECT
    prod.codigo,
    prod.nombre,
    prod.precio
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
WHERE
    fab.nombre = 'Asus'
    OR fab.nombre = 'Hewlett-Packard'
    OR fab.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett - Packardy Seagate.Utilizando el operador IN.

SELECT
    prod.codigo,
    prod.nombre,
    prod.precio
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
WHERE
    fab.nombre IN (
        'Asus',
        'Hewlett-Packard',
        'Seagate'
    );

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT
    prod.nombre,
    prod.precio
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
WHERE fab.nombre LIKE '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT prod.nombre, precio
FROM public.producto prod
    INNER JOIN public.fabricante fab ON codigo_fabricante = fab.codigo
WHERE fab.nombre LIKE '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT
    prod.nombre,
    prod.precio,
    fab.nombre
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo
WHERE
    prod.precio :: numeric >= 180
ORDER BY
    prod.precio DESC,
    prod.nombre;

-- Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT
    DISTINCT fab.codigo,
    fab.nombre
FROM public.producto prod
    INNER JOIN public.fabricante fab ON prod.codigo_fabricante = fab.codigo;