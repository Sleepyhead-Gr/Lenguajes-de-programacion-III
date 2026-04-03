-- ================================================
-- ACTIVIDAD 3: CRUD - ZAPATERÍA UMI
-- ================================================

CREATE DATABASE ZapateriaCRUD;
GO

USE ZapateriaCRUD;
GO

-- ================================================
-- TABLA: PROVEEDORES

-- ================================================
CREATE TABLE PROVEEDORES (
    nif        INT IDENTITY(1,1) PRIMARY KEY,
    nombre     NVARCHAR(100) NOT NULL,
    direccion  NVARCHAR(200)
);
GO

-- ================================================
-- TABLA: CLIENTES
-- ================================================
CREATE TABLE CLIENTES (
    dni        INT IDENTITY(1,1) PRIMARY KEY,
    nombre     NVARCHAR(100) NOT NULL,
    apellidos  NVARCHAR(100) NOT NULL,
    fechaNac   DATE,
    tfno       NVARCHAR(20)
);
GO

-- ================================================
-- TABLA: PRODUCTOS
-- nifProveedor es clave foránea de PROVEEDORES
-- ================================================
CREATE TABLE PRODUCTOS (
    codigo       INT IDENTITY(1,1) PRIMARY KEY,
    nombre       NVARCHAR(100) NOT NULL,
    precio       DECIMAL(10, 2) NOT NULL,
    nifProveedor INT,
    CONSTRAINT FK_Productos_Proveedores
        FOREIGN KEY (nifProveedor) REFERENCES PROVEEDORES(nif)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
GO

-- ================================================
-- TABLA: COMPRAS
-- dniCliente -> CLIENTES, codProducto -> PRODUCTOS
-- ================================================
CREATE TABLE COMPRAS (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    dniCliente  INT NOT NULL,
    codProducto INT NOT NULL,
    fechaCompra DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Compras_Clientes
        FOREIGN KEY (dniCliente) REFERENCES CLIENTES(dni)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Compras_Productos
        FOREIGN KEY (codProducto) REFERENCES PRODUCTOS(codigo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- ================================================
-- DATOS 
-- ================================================

INSERT INTO PROVEEDORES (nombre, direccion) VALUES
    ('Calzado del Norte S.A.',   'Av. Industrial 45, Monterrey, NL'),
    ('Zapatería Mexicana S.C.',  'Calle Reforma 12, CDMX'),
    ('Piel Fina Distribuidora',  'Blvd. Atlixco 300, Puebla, PUE');
GO

INSERT INTO CLIENTES (nombre, apellidos, fechaNac, tfno) VALUES
    ('Ana',    'García López',    '1995-03-15', '6671234567'),
    ('Carlos', 'Pérez Ramírez',   '1988-07-22', '6679876543'),
    ('María',  'Hernández Torres','2000-11-05', '6674561234');
GO

INSERT INTO PRODUCTOS (nombre, precio, nifProveedor) VALUES
    ('Sandalia Dama Talla 24',    450.00, 1),
    ('Bota Dama Talla 23',        890.00, 2),
    ('Tenis Caballero Talla 27',  750.00, 3),
    ('Zapato Formal Caballero 26',650.00, 1),
    ('Ballerina Dama Talla 22',   380.00, 2);
GO

INSERT INTO COMPRAS (dniCliente, codProducto, fechaCompra) VALUES
    (1, 1, GETDATE()),
    (1, 2, GETDATE()),
    (2, 3, GETDATE()),
    (3, 5, GETDATE());
GO

PRINT 'Base de datos ZapateriaCRUD creada exitosamente.';
GO
