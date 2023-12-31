USE [master]
GO
/****** Object:  Database [DB_CARRITO]    Script Date: 12/06/2023 18:52:50 ******/
CREATE DATABASE [DB_CARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_CARRITO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_CARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_CARRITO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_CARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_CARRITO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_CARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_CARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_CARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_CARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_CARRITO', N'ON'
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE = OFF
GO
USE [DB_CARRITO]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[TotalProducto] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[IdDistrito] [varchar](10) NULL,
	[FechaCompra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[IdDistrito] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdMunicipio] [varchar](4) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUNICIPIO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUNICIPIO](
	[IdMunicipio] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[EsAdministrador] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Abrigos', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Informal', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Casual', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'Zapatos', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'Accesorios', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'Formal', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'Verano', 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRA] ON 

INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Contacto], [Telefono], [Direccion], [IdDistrito], [FechaCompra]) VALUES (2, 2, 1, CAST(12000.00 AS Decimal(10, 2)), N'rrrrrr', N'32223232', N'dfsfdsfsdfdds', N'0101', CAST(N'2023-06-11T16:28:20.563' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Contacto], [Telefono], [Direccion], [IdDistrito], [FechaCompra]) VALUES (3, 2, 1, CAST(10800.00 AS Decimal(10, 2)), N'rrrr', N'334343434344', N'ridfnfidhf', N'0101', CAST(N'2023-06-11T16:31:51.490' AS DateTime))
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [TotalProducto], [Total], [Contacto], [Telefono], [Direccion], [IdDistrito], [FechaCompra]) VALUES (4, 2, 1, CAST(10800.00 AS Decimal(10, 2)), N'rtrtrtr', N'434344', N'rttertret', N'0306', CAST(N'2023-06-11T16:32:58.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[COMPRA] OFF
GO
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'01', N'Chalatenango')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'San Salvador')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'03', N'Cabanas')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'04', N'Usulutan')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'05', N'San Miguel')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'06', N'La Union')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'07', N'La Libertad')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'08', N'Sonsonate')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'09', N'Ahuachapan')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'10', N'Morazan')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'11', N'Santa Ana')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'12', N'Cuscatlan')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'13', N'La Paz')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'14', N'San Vicente')
INSERT [dbo].[DEPARTAMENTO] ([IdDepartamento], [Descripcion]) VALUES (N'', N'')
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 

INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (3, 2, 38, 10, CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (4, 3, 37, 2, CAST(10800.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [Total]) VALUES (5, 4, 37, 2, CAST(10800.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010101', N'Chalate Sur', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010102', N'Chalate Norte ', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010103', N'Chalate Centro', N'0101', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010104', N'Chalate Sur', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010105', N'Chalate Norte ', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010106', N'Chalate Centro', N'0102', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010107', N'Chalate Sur', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010108', N'Chalate Norte ', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010109', N'Chalate Centro', N'0103', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010110', N'Chalate Sur', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010111', N'Chalate Norte ', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010112', N'Chalate Centro', N'0105', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010113', N'Chalate Sur', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010114', N'Chalate Norte ', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010115', N'Chalate Centro', N'0107', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010116', N'Chalate Sur', N'0201', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010117', N'Chalate Norte ', N'0201', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010118', N'Chalate Centro', N'0201', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010119', N'Chalate Sur', N'0305', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010120', N'Chalate Norte ', N'0305', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010121', N'Chalate Centro', N'0305', N'01')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010201', N'San Salvador Sur', N'0306', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010202', N'San Salvador Norte', N'0306', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010203', N'San Salvador Centro', N'0306', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010204', N'San Salvador Sur', N'0307', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010205', N'San Salvador Norte', N'0307', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010206', N'San Salvador Centro', N'0307', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010301', N'San Salvador Sur', N'0401', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010302', N'San Salvador Norte', N'0401', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010303', N'San Salvador Centro', N'0401', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010304', N'San Salvador Sur', N'0402', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010305', N'San Salvador Norte', N'0402', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010306', N'San Salvador Centro', N'0402', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010307', N'San Salvador Sur', N'0403', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010308', N'San Salvador Norte', N'0403', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010309', N'San Salvador Centro', N'0403', N'02')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010310', N'Cabanas Sur', N'0404', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010311', N'Cabanas Norte', N'0404', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010312', N'Cabanas Centro', N'0404', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010401', N'Cabanas Sur', N'0405', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010402', N'Cabanas Norte', N'0405', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010403', N'Cabanas Centro', N'0405', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010501', N'Cabanas Sur', N'0406', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010502', N'Cabanas Norte', N'0406', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010503', N'Cabanas Centro', N'0406', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010504', N'Cabanas Sur', N'0407', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010505', N'Cabanas Norte', N'0407', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010506', N'Cabanas Centro', N'0407', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010507', N'Cabanas Sur', N'0408', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010508', N'Cabanas Norte', N'0408', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010509', N'Cabanas Centro', N'0408', N'03')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010510', N'Usulutan Sur', N'0501', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010511', N'Usulutan Norte', N'0501', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010512', N'Usulutan Centro', N'0501', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010513', N'Usulutan Sur', N'0502', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010514', N'Usulutan Norte', N'0502', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010515', N'Usulutan Centro', N'0502', N'04')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010516', N'San Miguel Sur', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010517', N'San Miguel Norte', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010518', N'San Miguel Centro', N'0506', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010519', N'San Miguel Sur', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010520', N'San Miguel Norte', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010521', N'San Miguel Centro', N'0507', N'05')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010522', N'La Union Sur', N'0511', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010523', N'La Union Norte', N'0511', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010601', N'La Union Centro', N'0511', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010602', N'La Union Sur', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010603', N'La Union Norte', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010604', N'La Union Centro', N'0601', N'06')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010605', N'La Libertad Sur', N'0605', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010606', N'La Libertad Norte', N'0605', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010607', N'La Libertad Centro', N'0605', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010608', N'La Libertad Sur', N'0608', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010609', N'La Libertad Norte', N'0608', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010610', N'La Libertad Centro', N'0608', N'07')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010611', N'Sonsonate Sur', N'0611', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010612', N'Sonsonate Norte', N'0611', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010701', N'Sonsonate Centro', N'0611', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010702', N'Sonsonate Sur', N'0612', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010703', N'Sonsonate Norte', N'0612', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010704', N'Sonsonate Centro', N'0612', N'08')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010705', N'Ahuachapan Sur', N'0802', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010706', N'Ahuachapan Norte', N'0802', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'010707', N'Ahuachapan Centro', N'0802', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020101', N'Ahuachapan Sur', N'0803', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020102', N'Ahuachapan Norte', N'0803', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020103', N'Ahuachapan Centro', N'0803', N'09')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020104', N'Morazan Sur', N'0808', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020105', N'Morazan Norte', N'0808', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020106', N'Morazan Centro', N'0808', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020107', N'Morazan Sur', N'0810', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020108', N'Morazan Norte', N'0810', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020109', N'Morazan Centro', N'0810', N'10')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020110', N'Santa Ana Sur  ', N'0813', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020111', N'Santa Ana Norte ', N'0813', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020112', N'Santa Ana Centro', N'0813', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020201', N'Santa Ana Sur  ', N'0902', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020202', N'Santa Ana Norte ', N'0902', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020203', N'Santa Ana Centro  ', N'0902', N'11')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020204', N'Cuscatlan Sur', N'0904', N'12')
GO
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020205', N'Cuscatlan Norte', N'0904', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020301', N'Cuscatlan Centro', N'0904', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020302', N'Cuscatlan Sur', N'0905', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020303', N'Cuscatlan Norte', N'0905', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020304', N'Cuscatlan Centro', N'0905', N'12')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020305', N'La Paz Sur', N'1002', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020306', N'La Paz Norte', N'1002', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020401', N'La Paz Centro', N'1002', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020402', N'La Paz Sur', N'1003', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020501', N'La Paz Norte', N'1003', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020502', N'La Paz Centro', N'1003', N'13')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020503', N'San Vicente Sur', N'1007', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020504', N'San Vicente Norte', N'1007', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020505', N'San Vicente Centro', N'1007', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020506', N'San Vicente Sur', N'1008', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020507', N'San Vicente Norte', N'1008', N'14')
INSERT [dbo].[DISTRITO] ([IdDistrito], [Descripcion], [IdMunicipio], [IdDepartamento]) VALUES (N'020508', N'San Vicente Centro', N'1008', N'14')
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Puma', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Under Armour', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Old Navy', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'ZARA', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'H&M', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'CAT', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'Converse All-Star', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'Tommy Hilfiger', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'NEW BALANCE', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (10, N'NIKE', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (11, N'POLO', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (12, N'Gucci', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (13, N'Ralph Lauren', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (14, N'Billabong', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (15, N'Carolina Herrera', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (16, N'Navy', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (17, N'Mango', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (18, N'Prada', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (19, N'Shein', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (22, N'Reebok', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (23, N'Converse', 1, CAST(N'2023-06-09T16:22:24.340' AS DateTime))
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0101', N'Agua Caliente', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0102', N'Arcatao', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0103', N'Azacualpa', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'', N'', N'')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0105', N'Chalatenango', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0107', N'Comalapa', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0201', N'Concepcion Quezaltepeque', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0305', N'Tejutla', N'01')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0306', N'Aguilares', N'02')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0307', N'Guazapa', N'02')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0401', N'San Salvador', N'02')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0402', N'Mejicanos', N'02')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0403', N'Apopa', N'02')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0404', N'Cinquera', N'03')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0405', N'Dolores', N'03')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0406', N'Ilobasco', N'03')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0407', N'Sensuntepeque', N'03')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0408', N'Victoria', N'03')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0501', N'Alegria', N'04')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0502', N'Berlin', N'04')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0503', N'California', N'04')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0504', N'Jiquilisco', N'04')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0505', N'Usulutan', N'04')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0506', N'Carolina', N'05')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0507', N'San Miguel', N'05')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0508', N'Quelepa', N'05')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0509', N'Chinameca', N'05')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0510', N'Sesori', N'05')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0511', N'Anamoros', N'06')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0601', N'Bolivar', N'06')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0602', N'Pasaquina', N'06')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0603', N'La Union', N'06')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0604', N'Yayantique', N'06')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0605', N'Antiguo Cuscatlan', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0606', N'Huizucar', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0607', N'Jicalapa', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0608', N'Santa Tecla', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0609', N'Talnique', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0610', N'La Libertad', N'07')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0611', N'Acajutla', N'08')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0612', N'Armenia', N'08')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0613', N'Caluco', N'08')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0701', N'Izalco', N'08')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0801', N'San Julian', N'08')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0802', N'Ahuachapan', N'09')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0803', N'Apaneca', N'09')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0804', N'Atiquizaya', N'09')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0805', N'El Refugio', N'09')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0806', N'Guaymango', N'09')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0807', N'Arambala', N'10')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0808', N'Lolotiquillo', N'10')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0809', N'El Divisadero', N'10')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0810', N'Jocoro', N'10')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0811', N'Chilanga', N'10')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0812', N'Coatepeque', N'11')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0813', N'Metapan', N'11')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0901', N'Masahuat', N'11')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0902', N'Santa Ana', N'11')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0903', N'El Porvenir', N'11')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0904', N'Candelaria', N'12')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0905', N'Cojutepeque', N'12')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0906', N'El Carmen', N'12')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'0907', N'El Rosario', N'12')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1001', N'Suchitoto', N'12')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1002', N'Cuyultitan', N'13')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1003', N'Jerusalen', N'13')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1004', N'Olocuilta', N'13')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1005', N'San Emigdio', N'13')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1006', N'San Juan Talpa', N'13')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1007', N'Apastepeque', N'14')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1008', N'Guadalupe', N'14')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1009', N'San Ildefonzo', N'14')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1010', N'San Vicente', N'14')
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'1011', N'Verapaz', N'14')
GO
INSERT [dbo].[MUNICIPIO] ([IdMunicipio], [Descripcion], [IdDepartamento]) VALUES (N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (34, N'7676', N'ttryufy', 1, 1, CAST(66.00 AS Decimal(10, 2)), 5, N'~/Imagenes/Productos/34.jpg', 1, CAST(N'2023-06-11T16:18:42.383' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (35, N'garfeidl', N'adasdsad', 1, 1, CAST(31.00 AS Decimal(10, 2)), 43, N'~/Imagenes/Productos/35.jpg', 1, CAST(N'2023-06-11T16:18:54.993' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (36, N'eva', N'e323', 1, 1, CAST(34.00 AS Decimal(10, 2)), 54, N'~/Imagenes/Productos/36.jpg', 1, CAST(N'2023-06-11T16:19:10.820' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (37, N'ttrrt', N'454545', 1, 1, CAST(54.00 AS Decimal(10, 2)), 52, N'~/Imagenes/Productos/37.jpg', 1, CAST(N'2023-06-11T16:19:22.820' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [Activo], [FechaRegistro]) VALUES (38, N'GRAFIELDDDDD', N'ES GARFIELD CON EVANGELION ', 3, 1, CAST(12.00 AS Decimal(10, 2)), 154, N'~/Imagenes/Productos/38.jpg', 1, CAST(N'2023-06-11T16:22:28.463' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (1, N'test', N'user', N'admin@example.com', N'admin123', 1, 1, CAST(N'2023-06-09T16:22:24.337' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Contrasena], [EsAdministrador], [Activo], [FechaRegistro]) VALUES (2, N'ricardo', N'alberto', N'pruebas@gmail.com', N'12345', 0, 1, CAST(N'2023-06-09T16:28:56.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaCompra]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarRutaImagen]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizarRutaImagen](
@IdProducto int,
@RutaImagen varchar(500)
)
as
begin
	update PRODUCTO set RutaImagen = @RutaImagen where IdProducto = @IdProducto
end


GO
/****** Object:  StoredProcedure [dbo].[sp_editarProducto]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_editarProducto](
@IdProducto int,
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion and IdProducto != @IdProducto)
	begin
		update PRODUCTO set 
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio =@Precio ,
		Stock =@Stock ,
		Activo = @Activo where IdProducto = @IdProducto

		SET @Resultado =1
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCarrito]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_InsertarCarrito](
@IdUsuario int,
@IdProducto int,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where IdProducto = @IdProducto and IdUsuario = @IdUsuario)
	begin
		update PRODUCTO set Stock = Stock -1 where IdProducto = @IdProducto
		insert into CARRITO(IdUsuario,IdProducto) values ( @IdUsuario,@IdProducto)
		set @Resultado = 1
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[sp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMarca]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure [dbo].[sp_ModificarMarca](
@IdMarca int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion =@Descripcion and IdMarca != @IdMarca)
		
		update MARCA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCarrito]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCarrito](
@IdUsuario int
)
as
begin
	select c.IdCarrito, p.IdProducto,m.Descripcion,p.Nombre,p.Precio,p.RutaImagen from carrito c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdUsuario = @IdUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCategoria]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerCategoria]
as
begin
 select * from CATEGORIA
end



GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCompra]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCompra](
@IdUsuario int)
as
begin
select c.Total,convert(char(10),c.FechaCompra,103)[Fecha],

(select m.Descripcion, p.Nombre,p.RutaImagen,dc.Total,dc.Cantidad from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
inner join MARCA m on m.IdMarca = p.IdMarca
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from compra c
where c.IdUsuario = @IdUsuario
FOR XML PATH('COMPRA'), ROOT('DATA') 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMarca]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerMarca]
as
begin
 select * from MARCA
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerProducto]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerProducto]
as
begin
 select p.*,m.Descripcion[DescripcionMarca],c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join marca m on m.IdMarca = p.IdMarca
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuario]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_obtenerUsuario](
@Correo varchar(100),
@Contrasena varchar(100)
)
as
begin
	IF EXISTS (SELECT * FROM usuario WHERE correo = @Correo and contrasena = @Contrasena)
	begin
		SELECT IdUsuario,Nombres,Apellidos,Correo,Contrasena,EsAdministrador FROM usuario WHERE correo = @Correo and contrasena = @Contrasena
	end
end



GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarCompra]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_registrarCompra](
@IdUsuario int,
@TotalProducto int,
@Total decimal(10,2),
@Contacto varchar(100),
@Telefono varchar(100),
@Direccion varchar(100),
@IdDistrito varchar(10),
@QueryDetalleCompra nvarchar(max),
@Resultado bit output
)
as
begin
	begin try
		SET @Resultado = 0
		begin transaction
		
		declare @idcompra int = 0
		insert into COMPRA(IdUsuario,TotalProducto,Total,Contacto,Telefono,Direccion,IdDistrito) values
		(@IdUsuario,@TotalProducto,@Total,@Contacto,@Telefono,@Direccion,@IdDistrito)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'¡idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra

		delete from CARRITO where IdUsuario = @IdUsuario

		SET @Resultado = 1

		commit
	end try
	begin catch
		rollback
		SET @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC [dbo].[sp_RegistrarMarca](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)

		insert into MARCA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarProducto]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarProducto](
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@RutaImagen varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values (
		@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@RutaImagen)

		SET @Resultado = scope_identity()
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarUsuario]    Script Date: 12/06/2023 18:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Contrasena varchar(100),
@EsAdministrador bit,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values
		(@Nombres,@Apellidos,@Correo,@Contrasena,@EsAdministrador)

		SET @Resultado = scope_identity()
	end
end

GO
USE [master]
GO
ALTER DATABASE [DB_CARRITO] SET  READ_WRITE 
GO
