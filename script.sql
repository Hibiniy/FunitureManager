USE [master]
GO
/****** Object:  Database [FunitureStore]    Script Date: 1/13/2022 7:45:18 PM ******/
CREATE DATABASE [FunitureStore] ON  PRIMARY 
( NAME = N'FunitureStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\FunitureStore.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FunitureStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\FunitureStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FunitureStore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FunitureStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FunitureStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FunitureStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FunitureStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FunitureStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FunitureStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FunitureStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FunitureStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FunitureStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FunitureStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FunitureStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FunitureStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FunitureStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FunitureStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FunitureStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FunitureStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FunitureStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FunitureStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FunitureStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FunitureStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FunitureStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FunitureStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FunitureStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FunitureStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FunitureStore] SET  MULTI_USER 
GO
ALTER DATABASE [FunitureStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FunitureStore] SET DB_CHAINING OFF 
GO
USE [FunitureStore]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [uniqueidentifier] NOT NULL,
	[Id_User] [uniqueidentifier] NULL,
	[Id_Product] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Total_Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
	[Picture] [varbinary](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[Id] [uniqueidentifier] NOT NULL,
	[Id_User] [uniqueidentifier] NULL,
	[Id_Product] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Id_User] [uniqueidentifier] NOT NULL,
	[Id_Manager] [uniqueidentifier] NULL,
	[State] [varchar](20) NOT NULL,
	[Id_Shipping] [uniqueidentifier] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Id_Order] [uniqueidentifier] NOT NULL,
	[Id_Product] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Total_Price] [decimal](18, 2) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[Id_Order] ASC,
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Id_Category] [uniqueidentifier] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Picture] [varbinary](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping_Address]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_Address](
	[Id] [uniqueidentifier] NOT NULL,
	[Id_User] [uniqueidentifier] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Province] [nvarchar](200) NULL,
	[District] [nvarchar](200) NULL,
	[Ward] [nvarchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Shipping_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/13/2022 7:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Picture] [int] NOT NULL,
	[Status] [bit] NULL,
	[Phonenumber] [varchar](20) NOT NULL,
	[Token] [varchar](1000) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([Id_Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Product] FOREIGN KEY([Id_Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Product]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Manager] FOREIGN KEY([Id_Manager])
REFERENCES [dbo].[Manager] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Manager]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipping_Address] FOREIGN KEY([Id_Shipping])
REFERENCES [dbo].[Shipping_Address] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipping_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([Id_Order])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([Id_Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Shipping_Address]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Address_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Shipping_Address] CHECK CONSTRAINT [FK_Shipping_Address_User]
GO
USE [master]
GO
ALTER DATABASE [FunitureStore] SET  READ_WRITE 
GO
