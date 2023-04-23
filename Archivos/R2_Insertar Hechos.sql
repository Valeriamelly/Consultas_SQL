INSERT INTO FactVentasTotales (Fecha, EmpleadoID, RegionID, VentaTotal)
SELECT
    o.OrderDate,
    e.EmpleadoID,
    r.RegionID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS VentaTotal
FROM
    [Order Details] od
JOIN
    Orders o ON od.OrderID = o.OrderID
JOIN
    Employees e ON o.EmployeeID = e.EmployeeID
JOIN
    EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
JOIN
    Territories t ON et.TerritoryID = t.TerritoryID
JOIN
    Region r ON t.RegionID = r.RegionID
GROUP BY
    o.OrderDate,
    e.EmpleadoID,
    r.RegionID;