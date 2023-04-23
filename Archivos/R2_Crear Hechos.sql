CREATE TABLE FactVentasTotales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE FOREIGN KEY REFERENCES DimTiempo(Fecha),
    EmpleadoID INT FOREIGN KEY REFERENCES DimEmpleado(EmpleadoID),
    RegionID INT FOREIGN KEY REFERENCES DimRegion(RegionID),
    VentaTotal DECIMAL(18, 2) NOT NULL
);