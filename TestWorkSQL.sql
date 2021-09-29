/*
В базе данных MS SQL Server есть продукты и категории.
 Одному продукту может соответствовать много категорий,
  в одной категории может быть много продуктов.
   Напишите SQL запрос для выбора всех пар «Имя продукта – Имя категории». 
   Если у продукта нет категорий, то его имя все равно должно выводиться.
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
  CATId INT null,
  CONSTRAINT pkproductsid PRIMARY KEY(Id),
  CONSTRAINT fkproductsWithCATId FOREIGN KEY (CATId) REFERENCES dbo.Categories(Id),
)
GO


INSERT INTO dbo.Products (id, Productname,CATId) VALUES (1,'ДП-5',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (2,'ДП-2',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (3,'ИМБ-4',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (4,'ИД-01',2);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (5,'ДП-02',2);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (6,'ГП-5',3);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (7,'ГП-7',3);
INSERT INTO dbo.Products (id, Productname) VALUES (8,'ОЗК');


INSERT INTO dbo.Categories (Id, Catname) VALUES (1,'Радиометры');
INSERT INTO dbo.Categories (Id, Catname) VALUES (2,'Дозиметры');
INSERT INTO dbo.Categories (Id, Catname) VALUES (3,'Противогазы');

SELECT Products.Productname, Categories.Catname FROM Products
LEFT JOIN Categories ON Categories.Id = Products.CATId
ORDER BY Products.Productname