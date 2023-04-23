-- Insertar datos en la tabla DimTiempo
INSERT INTO DimTiempo (Fecha, Dia, Mes, Año)
SELECT DISTINCT
    OrderDate,
    DAY(OrderDate) AS Dia,
    MONTH(OrderDate) AS Mes,
    YEAR(OrderDate) AS Año
FROM Orders;

-- Insertar datos en la tabla DimCategoria
INSERT INTO DimCategoria (Nombre)
SELECT DISTINCT CategoryName
FROM Categories;

-- Insertar datos en la tabla DimProveedor
INSERT INTO DimProveedor (Nombre)
SELECT DISTINCT CompanyName
FROM Suppliers;

-- Insertar datos en la tabla DimProducto
INSERT INTO DimProducto (Nombre, CategoriaID, ProveedorID)
SELECT
    p.ProductName,
    c.CategoriaID,
    s.ProveedorID
FROM
    Products p
JOIN
    Categories c ON p.CategoryID = c.CategoryID
JOIN
    Suppliers s ON p.SupplierID = s.SupplierID;