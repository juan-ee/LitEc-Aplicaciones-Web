
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/13/2017 17:41:26
-- Generated from EDMX file: d:\documentos\visual studio 2017\Projects\LitEc\LitEc\LitecDataBaseModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LitEcBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AutorLibro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LibroSet] DROP CONSTRAINT [FK_AutorLibro];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioCompra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraSet] DROP CONSTRAINT [FK_UsuarioCompra];
GO
IF OBJECT_ID(N'[dbo].[FK_CompraLibro_Compra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraLibro] DROP CONSTRAINT [FK_CompraLibro_Compra];
GO
IF OBJECT_ID(N'[dbo].[FK_CompraLibro_Libro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraLibro] DROP CONSTRAINT [FK_CompraLibro_Libro];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO
IF OBJECT_ID(N'[dbo].[CompraSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompraSet];
GO
IF OBJECT_ID(N'[dbo].[LibroSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LibroSet];
GO
IF OBJECT_ID(N'[dbo].[AutorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AutorSet];
GO
IF OBJECT_ID(N'[dbo].[CompraLibro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompraLibro];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [idUsuario] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [userName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CompraSet'
CREATE TABLE [dbo].[CompraSet] (
    [idCompra] int IDENTITY(1,1) NOT NULL,
    [subtotal] decimal(18,0)  NOT NULL,
    [iva] decimal(18,0)  NOT NULL,
    [total] decimal(18,0)  NOT NULL,
    [Usuario_idUsuario] int  NOT NULL
);
GO

-- Creating table 'LibroSet'
CREATE TABLE [dbo].[LibroSet] (
    [idLibro] int IDENTITY(1,1) NOT NULL,
    [tituloLibro] nvarchar(max)  NOT NULL,
    [categoriaLibro] nvarchar(max)  NOT NULL,
    [editorialLibro] nvarchar(max)  NOT NULL,
    [ISBN] nvarchar(max)  NOT NULL,
    [precioLibro] decimal(18,0)  NOT NULL,
    [descripcionLibro] nvarchar(max)  NOT NULL,
    [Autor_idAutor] int  NOT NULL
);
GO

-- Creating table 'AutorSet'
CREATE TABLE [dbo].[AutorSet] (
    [idAutor] int IDENTITY(1,1) NOT NULL,
    [nombresAutor] nvarchar(max)  NOT NULL,
    [apellidosAutor] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CompraLibro'
CREATE TABLE [dbo].[CompraLibro] (
    [Compra_idCompra] int  NOT NULL,
    [Libro_idLibro] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idUsuario] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([idUsuario] ASC);
GO

-- Creating primary key on [idCompra] in table 'CompraSet'
ALTER TABLE [dbo].[CompraSet]
ADD CONSTRAINT [PK_CompraSet]
    PRIMARY KEY CLUSTERED ([idCompra] ASC);
GO

-- Creating primary key on [idLibro] in table 'LibroSet'
ALTER TABLE [dbo].[LibroSet]
ADD CONSTRAINT [PK_LibroSet]
    PRIMARY KEY CLUSTERED ([idLibro] ASC);
GO

-- Creating primary key on [idAutor] in table 'AutorSet'
ALTER TABLE [dbo].[AutorSet]
ADD CONSTRAINT [PK_AutorSet]
    PRIMARY KEY CLUSTERED ([idAutor] ASC);
GO

-- Creating primary key on [Compra_idCompra], [Libro_idLibro] in table 'CompraLibro'
ALTER TABLE [dbo].[CompraLibro]
ADD CONSTRAINT [PK_CompraLibro]
    PRIMARY KEY CLUSTERED ([Compra_idCompra], [Libro_idLibro] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Autor_idAutor] in table 'LibroSet'
ALTER TABLE [dbo].[LibroSet]
ADD CONSTRAINT [FK_AutorLibro]
    FOREIGN KEY ([Autor_idAutor])
    REFERENCES [dbo].[AutorSet]
        ([idAutor])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AutorLibro'
CREATE INDEX [IX_FK_AutorLibro]
ON [dbo].[LibroSet]
    ([Autor_idAutor]);
GO

-- Creating foreign key on [Usuario_idUsuario] in table 'CompraSet'
ALTER TABLE [dbo].[CompraSet]
ADD CONSTRAINT [FK_UsuarioCompra]
    FOREIGN KEY ([Usuario_idUsuario])
    REFERENCES [dbo].[UsuarioSet]
        ([idUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCompra'
CREATE INDEX [IX_FK_UsuarioCompra]
ON [dbo].[CompraSet]
    ([Usuario_idUsuario]);
GO

-- Creating foreign key on [Compra_idCompra] in table 'CompraLibro'
ALTER TABLE [dbo].[CompraLibro]
ADD CONSTRAINT [FK_CompraLibro_Compra]
    FOREIGN KEY ([Compra_idCompra])
    REFERENCES [dbo].[CompraSet]
        ([idCompra])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Libro_idLibro] in table 'CompraLibro'
ALTER TABLE [dbo].[CompraLibro]
ADD CONSTRAINT [FK_CompraLibro_Libro]
    FOREIGN KEY ([Libro_idLibro])
    REFERENCES [dbo].[LibroSet]
        ([idLibro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompraLibro_Libro'
CREATE INDEX [IX_FK_CompraLibro_Libro]
ON [dbo].[CompraLibro]
    ([Libro_idLibro]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------