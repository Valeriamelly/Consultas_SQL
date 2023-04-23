CREATE TABLE FactProductosVendidos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE FOREIGN KEY REFERENCES DimTiempo(Fecha),
    ProductoID INT FOREIGN KEY REFERENCES DimProducto(ProductoID),
    Cantidad INT NOT NULL
);