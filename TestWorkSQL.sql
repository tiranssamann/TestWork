/*
 * В базе данных MS SQL Server есть продукты и категории.
 * Одному продукту может соответствовать много категорий.
 * Напишите SQL-запрос для выбора всех пар «Имя продукта - Имя категории».
 * Если у продукта нет категорий, то его имя все равно выводиться.
*/
CREATE DATABASE TestWork_Zakarin_Artur
GO
USE TestWork_Zakarin_Artur
GO
CREATE TABLE dbo.Categories(
  Id INT NOT NULL,
  Catname NVARCHAR(255) NULL,
  CONSTRAINT pkcategoriesid PRIMARY KEY(Id),
)
GO
CREATE TABLE dbo.Products(
  Id INT NOT NULL,
  Productname NVARCHAR(255) NULL,
  CONSTRAINT pkproductsid PRIMARY KEY(Id),
)
GO

CREATE TABLE ProductCategories (
	ProductId INT FOREIGN KEY REFERENCES Products(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	PRIMARY KEY (ProductId, CategoryId)
)
GO

INSERT INTO dbo.Products (id, Productname) VALUES (1,'DP-5');
INSERT INTO dbo.Products (id, Productname) VALUES (2,'DP-2');
INSERT INTO dbo.Products (id, Productname) VALUES (3,'IMB-4');
INSERT INTO dbo.Products (id, Productname) VALUES (4,'DP-01');
INSERT INTO dbo.Products (id, Productname) VALUES (5,'ID-02');
INSERT INTO dbo.Products (id, Productname) VALUES (6,'GP-5');
INSERT INTO dbo.Products (id, Productname) VALUES (7,'GP-7');
INSERT INTO dbo.Products (id, Productname) VALUES (8,'ОЗК');
GO
INSERT INTO dbo.Categories (Id, Catname) VALUES (1,'Radiometer');
INSERT INTO dbo.Categories (Id, Catname) VALUES (2,'Dozimeter');
INSERT INTO dbo.Categories (Id, Catname) VALUES (3,'Protivogaz');
GO
INSERT INTO ProductCategories
VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 3),
	(7, 3)
GO

SELECT Products.Productname, Categories.Catname FROM Products 
LEFT JOIN ProductCategories ON Products.Id = ProductCategories.ProductId
LEFT JOIN Categories ON ProductCategories.CategoryId = Categories.Id;