--VIEW erstellen:

CREATE VIEW vBestellDetails
AS

SELECT 
Customers.CompanyName, Customers.CustomerID, 
Employees.LastName, 
Orders.OrderID, Orders.OrderDate, Orders.Freight, 
[Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, 
Products.ProductName,
[Order Details].UnitPrice * Quantity * (1 - Discount) as SummeBestellPosition
FROM   Customers INNER JOIN
         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID


--Hinter jeder View steckt eine Abfrage, die "abgespeichert" wurde
--Können genauso wie Tabellen aufgerufen/referiert werden

SELECT * FROM vBestellDetails

SELECT CompanyName, SummeBestellPosition FROM vBestellDetails


--Code hinter View sehen: Rechtsklick auf View im Objekt Explorer - Skript für Sicht als - CREATE IN - Neues Abfragefenster


SELECT *, SummeBestellPosition * 1.19 as SummeBrutto, 
(SummeBestellPosition * 1.19) - SummeBestellPosition as MwSt
FROM vBestellDetails


--View anpassen/ändern über ALTER VIEW

ALTER VIEW vBestellDetails
AS

SELECT 
Customers.CompanyName, Customers.CustomerID, 
Employees.LastName, 
Orders.OrderID, Orders.OrderDate, Orders.Freight, 
[Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, 
Products.ProductName,
[Order Details].UnitPrice * Quantity * (1 - Discount) as SummeBestellPosition,
[Order Details].UnitPrice * Quantity * (1 - Discount) * 1.19 as SummeBrutto, 
([Order Details].UnitPrice * Quantity * (1 - Discount) * 1.19) - [Order Details].UnitPrice * Quantity * (1 - Discount) as MwSt
FROM   Customers INNER JOIN
         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID


SELECT * FROM vBestellDetails