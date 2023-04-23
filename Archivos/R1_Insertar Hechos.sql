INSERT INTO FactProductosVendidos (Fecha, ProductoID, Cantidad)
SELECT
    o.OrderDate,
    p.ProductoID,
    od.Quantity
FROM
    [Order Details] od
JOIN
    Orders o ON od.OrderID = o.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID;