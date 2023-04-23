-- Seleccione las columnas de interés: Fecha, Día, Mes, Año, Categoría, Proveedor y la suma de la cantidad de productos vendidos
SELECT
    t.Fecha,             -- Fecha de la venta
    t.Dia,               -- Día de la venta
    t.Mes,               -- Mes de la venta
    t.Año,               -- Año de la venta
    c.Nombre AS Categoria,   -- Nombre de la categoría del producto vendido
    pr.Nombre AS Proveedor,  -- Nombre del proveedor del producto vendido
    SUM(fpv.Cantidad) AS TotalProductosVendidos  -- Suma de la cantidad de productos vendidos
FROM
    FactProductosVendidos fpv  -- Tabla de hechos: Productos Vendidos
JOIN
    DimProducto p ON fpv.ProductoID = p.ProductoID  -- Unión de la tabla de hechos con la Dimensión Producto
JOIN
    DimCategoria c ON p.CategoriaID = c.CategoriaID  -- Unión de la Dimensión Producto con la Dimensión Categoría
JOIN
    DimProveedor pr ON p.ProveedorID = pr.ProveedorID  -- Unión de la Dimensión Producto con la Dimensión Proveedor
JOIN
    DimTiempo t ON fpv.Fecha = t.Fecha  -- Unión de la tabla de hechos con la Dimensión Tiempo
GROUP BY
    t.Fecha,  -- Agrupar los resultados por Fecha
    t.Dia,    -- Agrupar los resultados por Día
    t.Mes,    -- Agrupar los resultados por Mes
    t.Año,    -- Agrupar los resultados por Año
    c.Nombre, -- Agrupar los resultados por Nombre de Categoría
    pr.Nombre -- Agrupar los resultados por Nombre de Proveedor
ORDER BY
    t.Fecha,  -- Ordenar los resultados por Fecha
    c.Nombre, -- Ordenar los resultados por Nombre de Categoría
    pr.Nombre;  -- Ordenar los resultados por Nombre de Proveedor