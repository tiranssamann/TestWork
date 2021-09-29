/*
� ���� ������ MS SQL Server ���� �������� � ���������.
 ������ �������� ����� ��������������� ����� ���������,
  � ����� ��������� ����� ���� ����� ���������.
   �������� SQL ������ ��� ������ ���� ��� ���� �������� � ��� ���������. 
   ���� � �������� ��� ���������, �� ��� ��� ��� ����� ������ ����������.
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


INSERT INTO dbo.Products (id, Productname,CATId) VALUES (1,'��-5',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (2,'��-2',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (3,'���-4',1);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (4,'��-01',2);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (5,'��-02',2);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (6,'��-5',3);
INSERT INTO dbo.Products (id, Productname,CATId) VALUES (7,'��-7',3);
INSERT INTO dbo.Products (id, Productname) VALUES (8,'���');


INSERT INTO dbo.Categories (Id, Catname) VALUES (1,'����������');
INSERT INTO dbo.Categories (Id, Catname) VALUES (2,'���������');
INSERT INTO dbo.Categories (Id, Catname) VALUES (3,'�����������');

SELECT Products.Productname, Categories.Catname FROM Products
LEFT JOIN Categories ON Categories.Id = Products.CATId
ORDER BY Products.Productname