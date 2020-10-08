USE [ProductStore]
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchProductNew]    Script Date: 2020-10-08 15:28:31 ******/
DROP PROCEDURE [dbo].[sp_SearchProductNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchProduct]    Script Date: 2020-10-08 15:28:31 ******/
DROP PROCEDURE [dbo].[sp_SearchProduct]
GO
ALTER TABLE [dbo].[tbl_Product] DROP CONSTRAINT [FK_tbl_Product_tbl_Unit]
GO
ALTER TABLE [dbo].[tbl_Product] DROP CONSTRAINT [FK_tbl_Product_tbl_Currency]
GO
ALTER TABLE [dbo].[tbl_Product] DROP CONSTRAINT [FK_tbl_Product_tbl_Category]
GO
/****** Object:  Table [dbo].[tbl_Unit]    Script Date: 2020-10-08 15:28:31 ******/
DROP TABLE [dbo].[tbl_Unit]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 2020-10-08 15:28:31 ******/
DROP TABLE [dbo].[tbl_Product]
GO
/****** Object:  Table [dbo].[tbl_Error]    Script Date: 2020-10-08 15:28:31 ******/
DROP TABLE [dbo].[tbl_Error]
GO
/****** Object:  Table [dbo].[tbl_Currency]    Script Date: 2020-10-08 15:28:31 ******/
DROP TABLE [dbo].[tbl_Currency]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 2020-10-08 15:28:31 ******/
DROP TABLE [dbo].[tbl_Category]
GO
USE [master]
GO
/****** Object:  Database [ProductStore]    Script Date: 2020-10-08 15:28:31 ******/
DROP DATABASE [ProductStore]
GO
/****** Object:  Database [ProductStore]    Script Date: 2020-10-08 15:28:31 ******/
CREATE DATABASE [ProductStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductStore', FILENAME = N'C:\Users\Polite IT\ProductStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductStore_log', FILENAME = N'C:\Users\Polite IT\ProductStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductStore] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductStore] SET  MULTI_USER 
GO
ALTER DATABASE [ProductStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductStore] SET QUERY_STORE = OFF
GO
USE [ProductStore]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProductStore]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](500) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Currency]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](100) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_tbl_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Error]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorTime] [datetime] NULL,
 CONSTRAINT [PK_tbl_Error] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[CategoryId] [int] NULL,
	[UnitId] [int] NULL,
	[CurrencyId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[AddedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Unit]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](100) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_tbl_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 

INSERT [dbo].[tbl_Category] ([Id], [CategoryName], [DateAdded], [DateModified]) VALUES (1, N'TestCategory5', NULL, CAST(N'2020-10-02T13:20:34.333' AS DateTime))
INSERT [dbo].[tbl_Category] ([Id], [CategoryName], [DateAdded], [DateModified]) VALUES (3, N'TestCategory2', CAST(N'2020-10-02T12:33:12.283' AS DateTime), NULL)
INSERT [dbo].[tbl_Category] ([Id], [CategoryName], [DateAdded], [DateModified]) VALUES (5, N'TestCategory3', CAST(N'2020-10-02T12:34:27.110' AS DateTime), NULL)
INSERT [dbo].[tbl_Category] ([Id], [CategoryName], [DateAdded], [DateModified]) VALUES (6, N'testcat6', CAST(N'2020-10-06T12:30:08.610' AS DateTime), NULL)
INSERT [dbo].[tbl_Category] ([Id], [CategoryName], [DateAdded], [DateModified]) VALUES (7, N'TestCategory6', CAST(N'2020-10-08T11:22:31.533' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
SET IDENTITY_INSERT [dbo].[tbl_Currency] ON 

INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (1, N'TestCurrency', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (2, N'Leke', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (3, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (4, N'Afghanis', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (5, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (6, N'Guilders', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (7, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (8, N'New Manats', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (9, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (10, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (11, N'Rubles', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (12, N'Euro', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (13, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (14, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (15, N'Bolivianos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (16, N'Convertible Marka', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (17, N'Pula', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (18, N'Leva', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (19, N'Reais', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (20, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (21, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (22, N'Riels', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (23, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (24, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (25, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (26, N'Yuan Renminbi', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (27, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (28, N'Colón', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (29, N'Kuna', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (30, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (31, N'Koruny', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (32, N'Kroner', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (33, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (34, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (35, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (36, N'Colones', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (37, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (38, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (39, N'Cedis', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (40, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (41, N'Quetzales', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (42, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (43, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (44, N'Lempiras', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (45, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (46, N'Forint', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (47, N'Kronur', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (48, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (49, N'Rupiahs', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (50, N'Rials', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (51, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (52, N'New Shekels', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (53, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (54, N'Yen', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (55, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (56, N'Tenge', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (57, N'Won', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (58, N'Won', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (59, N'Soms', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (60, N'Kips', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (61, N'Lati', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (62, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (63, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (64, N'Switzerland Francs', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (65, N'Litai', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (66, N'Denars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (67, N'Ringgits', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (68, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (69, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (70, N'Tugriks', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (71, N'Meticais', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (72, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (73, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (74, N'Guilders', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (75, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (76, N'Cordobas', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (77, N'Nairas', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (78, N'Krone', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (79, N'Rials', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (80, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (81, N'Balboa', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (82, N'Guarani', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (83, N'Nuevos Soles', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (84, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (85, N'Zlotych', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (86, N'Rials', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (87, N'New Lei', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (88, N'Rubles', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (89, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (90, N'Riyals', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (91, N'Dinars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (92, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (93, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (94, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (95, N'Shillings', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (96, N'Rand', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (97, N'Rupees', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (98, N'Kronor', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (99, N'Dollars', NULL)
GO
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (100, N'Pounds', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (101, N'New Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (102, N'Baht', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (103, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (104, N'Lira', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (105, N'Liras', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (106, N'Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (107, N'Hryvnia', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (108, N'Pesos', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (109, N'Sums', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (110, N'Bolivares Fuertes', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (111, N'Dong', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (112, N'Rials', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (113, N'Zimbabwe Dollars', NULL)
INSERT [dbo].[tbl_Currency] ([Id], [CurrencyName], [DateAdded]) VALUES (114, N'Rupees', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Currency] OFF
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([Id], [ProductName], [CategoryId], [UnitId], [CurrencyId], [Price], [AddedDate], [UpdatedDate]) VALUES (2, N'Product2', 1, 1, 1, CAST(100 AS Decimal(18, 0)), CAST(N'2020-10-01T17:19:54.063' AS DateTime), CAST(N'2020-10-02T15:09:42.667' AS DateTime))
INSERT [dbo].[tbl_Product] ([Id], [ProductName], [CategoryId], [UnitId], [CurrencyId], [Price], [AddedDate], [UpdatedDate]) VALUES (3, N'Product3', 5, 2, 1, CAST(300 AS Decimal(18, 0)), CAST(N'2020-10-02T12:41:47.873' AS DateTime), CAST(N'2020-10-02T12:41:47.873' AS DateTime))
INSERT [dbo].[tbl_Product] ([Id], [ProductName], [CategoryId], [UnitId], [CurrencyId], [Price], [AddedDate], [UpdatedDate]) VALUES (4, N'Product2', 7, 1, 1, CAST(200 AS Decimal(18, 0)), CAST(N'2020-10-08T11:34:31.760' AS DateTime), CAST(N'2020-10-08T11:34:31.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
SET IDENTITY_INSERT [dbo].[tbl_Unit] ON 

INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (1, N'Numbers', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (2, N'litre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (3, N'gram', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (4, N'kilogram', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (5, N'millimetre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (6, N'centimetre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (7, N'metre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (8, N'square millimetre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (9, N'square centimetre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (10, N'square  metre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (11, N'millilitre', NULL)
INSERT [dbo].[tbl_Unit] ([Id], [UnitName], [DateAdded]) VALUES (12, N'kilolitre', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Unit] OFF
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbl_Category] ([Id])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Category]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[tbl_Currency] ([Id])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Currency]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[tbl_Unit] ([Id])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Unit]
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchProduct]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SearchProduct]
@ProductName nvarchar(500),
@Category int
AS 

if(@Category=0 and @ProductName='')
begin

SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id

end 

Else if(@Category<>0 and @ProductName='')
begin

SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id
and  product.CategoryId=@Category
end

else if(@Category<>0 and @ProductName<>'')
begin
SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id
and  product.CategoryId=@Category and product.ProductName like '%'+@ProductName+'%'
end

GO
/****** Object:  StoredProcedure [dbo].[sp_SearchProductNew]    Script Date: 2020-10-08 15:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SearchProductNew] --'TestCategory3',0
@ProductName nvarchar(500),
@Category int
AS 

if(@Category=0 and @ProductName='')
begin

SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id

end 

Else if(@Category<>0 and @ProductName='')
begin

SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id
and  product.CategoryId=@Category
end

else if(@Category<>0 and @ProductName<>'')
begin
SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id
and  product.CategoryId=@Category and product.ProductName like '%'+@ProductName+'%'
end

else if(@Category=0 and @ProductName<>'')
begin
SELECT product.ProductName,category.CategoryName,units.UnitName,currency.CurrencyName,product.Price,product.Id
FROM [dbo].[tbl_Product] Product , tbl_category Category , [tbl_Currency] Currency ,[tbl_Unit] Units
Where Product.UnitId=Units.Id and Product.CurrencyId= Currency.Id and Product.CategoryId= Category.Id
and   product.ProductName like '%'+@ProductName+'%'
end



GO
USE [master]
GO
ALTER DATABASE [ProductStore] SET  READ_WRITE 
GO
