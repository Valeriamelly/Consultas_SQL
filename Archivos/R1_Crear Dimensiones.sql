-- Crear la tabla DimTiempo
CREATE TABLE DimTiempo (
    Fecha DATE PRIMARY KEY,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Año INT NOT NULL
);

-- Crear la tabla DimCategoria
CREATE TABLE DimCategoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);

-- Crear la tabla DimProveedor
CREATE TABLE DimProveedor (
    ProveedorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);

-- Crear la tabla DimProducto
CREATE TABLE DimProducto (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    CategoriaID INT FOREIGN KEY REFERENCES DimCategoria(CategoriaID),
    ProveedorID INT FOREIGN KEY REFERENCES DimProveedor(ProveedorID)
);
