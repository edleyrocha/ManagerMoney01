USE [master];
CREATE DATABASE [dbManagerMoney];
GO
USE [dbManagerMoney];
GO
-- TABLE USER
CREATE TABLE [dbo].[tblUsers]
(
	[IdUser]   INT IDENTITY (1,1) PRIMARY KEY,
	[Name]     NVARCHAR     (100) NOT NULL,
	[Login]    NVARCHAR     (20)  UNIQUE NOT NULL,
	[Password] NVARCHAR     (100) NOT NULL,
);
GO
--TABLE CATEGORIZE 
CREATE TABLE [dbo].[tblCategorize]
(
	[IdCategorize]  INT IDENTITY (1,1) PRIMARY KEY,
	[Name]          NVARCHAR     (100) NOT NULL,
	[Description]   NTEXT NULL,
);
GO
--TABLE PRODUCT
CREATE TABLE [dbo].[tblProduct]
(
	[IdProduct]     INT IDENTITY PRIMARY KEY,
	[IdCategorize]  INT CONSTRAINT [FK_tblProductIdCategorize_tblCategorizeIdCategorize] FOREIGN KEY REFERENCES [dbo].[tblCategorize]([IdCategorize]) NOT NULL,
	[Name]          NVARCHAR (100) NOT NULL,
	[Description]   NTEXT          NOT NULL,
);
GO
--TABLE TOTAL AMOUNT DETAIL
CREATE TABLE [dbo].[tblTotalAmountDetail]
(
	[IdTotalDetail] INT IDENTITY (1,1) PRIMARY KEY,
	[IdProduct]     INT CONSTRAINT    [FK_tblTotalAmountDetailIdProduct_tblProductIdProduct] FOREIGN KEY REFERENCES [dbo].[tblProduct]([IdProduct]) NOT NULL,
	[IdUser]        INT CONSTRAINT    [FK_tblTotalAmountDetailIdUser_tblUsersIdUser]         FOREIGN KEY REFERENCES [dbo].[tblUsers](IdUser)        NOT NULL,
	[UnitProduct]   NVARCHAR     (100) NOT NULL,
	[Price]         FLOAT              NOT NULL,
);
GO
-- TABLE TOTAL AMOUNT / MOTH
CREATE TABLE [dbo].[tblTotalAmount]
(
	[IdTotal]       INT IDENTITY(1,1) PRIMARY KEY,
	[IdTotalDetail] INT CONSTRAINT    [FK_tblTotalAmountIdTotalDetail_tblTotalAmountDetailIdTotalDetail] FOREIGN KEY REFERENCES [dbo].[tblTotalAmountDetail](IdTotalDetail) NOT NULL,
	[DateBuy]       DATE NOT NULL,
	[TotalAmount]   FLOAT NOT NULL,
);
GO