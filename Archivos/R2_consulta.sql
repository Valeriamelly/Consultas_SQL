-- Seleccione las columnas de inter�s: Fecha, D�a, Mes, A�o, Categor�a, Proveedor y la suma de la cantidad de productos vendidos
SELECT
    t.Fecha,             -- Fecha de la venta
    t.Dia,               -- D�a de la venta
    t.Mes,               -- Mes de la venta
    t.A�o,               -- A�o de la venta
    c.Nombre AS Categoria,   -- Nombre de la categor�a del producto vendido
    pr.Nombre AS Proveedor,  -- Nombre del proveedor del producto vendido
    SUM(fpv.Cantidad) AS TotalProductosVendidos  -- Suma de la cantidad de productos vendidos
FROM
    FactProductosVendidos fpv  -- Tabla de hechos: Productos Vendidos
JOIN
    DimProducto p ON fpv.ProductoID = p.ProductoID  -- Uni�n de la tabla de hechos con la Dimensi�n Producto
JOIN
    DimCategoria c ON p.CategoriaID = c.CategoriaID  -- Uni�n de la Dimensi�n Producto con la Dimensi�n Categor�a
JOIN
    DimProveedor pr ON p.ProveedorID = pr.ProveedorID  -- Uni�n de la Dimensi�n Producto con la Dimensi�n Proveedor
JOIN
    DimTiempo t ON fpv.Fecha = t.Fecha  -- Uni�n de la tabla de hechos con la Dimensi�n Tiempo
GROUP BY
    t.Fecha,  -- Agrupar los resultados por Fecha
    t.Dia,    -- Agrupar los resultados por D�a
    t.Mes,    -- Agrupar los resultados por Mes
    t.A�o,    -- Agrupar los resultados por A�o
    c.Nombre, -- Agrupar los resultados por Nombre de Categor�a
    pr.Nombre -- Agrupar los resultados por Nombre de Proveedor
ORDER BY
    t.Fecha,  -- Ordenar los resultados por Fecha
    c.Nombre, -- Ordenar los resultados por Nombre de Categor�a
    pr.Nombre;  -- Ordenar los resultados por Nombre de Proveedor