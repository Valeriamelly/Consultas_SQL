SELECT
    t.Fecha,
    t.Dia,
    t.Mes,
    t.Año,
    c.Nombre AS Categoria,
    pr.Nombre AS Proveedor,
    SUM(fpv.Cantidad) AS TotalProductosVendidos
FROM
    FactProductosVendidos fpv
JOIN
    DimProducto p ON fpv.ProductoID = p.ProductoID
JOIN
    DimCategoria c ON p.CategoriaID = c.CategoriaID
JOIN
    DimProveedor pr ON p.ProveedorID = pr.ProveedorID
JOIN
    DimTiempo t ON fpv.Fecha = t.Fecha
GROUP BY
    t.Fecha,
    t.Dia,
    t.Mes,
    t.Año,
    c.Nombre,
    pr.Nombre
ORDER BY
    t.Fecha,
    c.Nombre,
    pr.Nombre;