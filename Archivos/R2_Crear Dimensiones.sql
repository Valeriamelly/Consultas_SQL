-- Crear la tabla DimTiempo (Si ya creaste la tabla DimTiempo deja esto en comentarios)
/*CREATE TABLE DimTiempo (
    Fecha DATE PRIMARY KEY,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Año INT NOT NULL
);*/

-- Crear la tabla DimEmpleado
CREATE TABLE DimEmpleado (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Cargo NVARCHAR(50)
);

-- Crear la tabla DimRegion
CREATE TABLE DimRegion (
    RegionID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);