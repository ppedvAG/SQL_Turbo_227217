--JOINs verbinden Tabellen miteinander, und zwar horizontal

SELECT OrderID, Orders.CustomerID, CompanyName FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID


SELECT * FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

--Um die richtigen Datensätze zusammenzuführen, müssen 2 Spalten in den Tabellen miteinander verglichen werden
--Hierzu nutzen wir Primär- und Fremdschlüssel Beziehungen

/*
Syntax:

SELECT *
FROM Tabelle1 INNER JOIN Tabelle2 ON Tabelle1.Primärschlüssel = Tabelle2.Fremdschlüssel
*/

SELECT OrderID, LastName, FirstName, Orders.EmployeeID FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

--Mehrere Joins möglich:
SELECT Orders.OrderID, LastName, Quantity, Products.UnitPrice, ProductName FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID

--ambiguous Columnname/mehrdeutiger Spaltenname: Wenn Spaltenname in mehr als einer Tabelle auftaucht,
--muss der jeweilige Tabellenname angegeben werden; Tabellenname.Spaltenname


--Welche Produkte hat Herr Fuller verkauft?

SELECT DISTINCT LastName, FirstName, ProductName FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Fuller'
ORDER BY Lastname

--All das waren sogennante INNER Joins, es gibt auch noch OUTER Joins




--OUTER Joins (LEFT/RIGHT/FULL):


--LEFT oder RIGHT join:

SELECT DISTINCT Customers.CustomerID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--Nur 89 Kunden, d.h. 2 Kunden in Customers, haben wohl noch nie bestellt

--LEFT JOIN: Tabelle LINKS vom LEFT vollständig:
SELECT * 
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

--RIGHT JOIN: Tabelle RECHTS vom RIGHT vollständig:
SELECT * 
FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

--FULL OUTER JOIN: Beide Tabellen vollständig:
SELECT *
FROM Customers FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

--Invertierter OUTER JOIN:
SELECT * 
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE OrderID IS NULL


--LEFT ist quasi das selbe wie RIGHT, wir vertauschen nur die Reihenfolge der Tabellen:

SELECT * 
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE OrderID IS NULL

SELECT * 
FROM Orders RIGHT JOIN Customers  ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL


--Tipp fürs Joinen: Abfrage Editor verwenden (Reiter Abfrage - Abfrage in Editor entwerfen)


SELECT Employees.LastName, Employees.FirstName, Products.ProductName
FROM   [Order Details] INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
         Orders ON [Order Details].OrderID = Orders.OrderID INNER JOIN
         Employees ON Orders.EmployeeID = Employees.EmployeeID

SELECT Employees.LastName, Employees.FirstName, Products.ProductName, Orders.OrderDate
FROM   Employees INNER JOIN
         Orders ON Employees.EmployeeID = Orders.EmployeeID INNER JOIN
         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
         Products ON [Order Details].ProductID = Products.ProductID
WHERE (Employees.LastName = N'Leverling')
ORDER BY Employees.LastName


--Tabellen aus anderen Datenbanken:

SELECT Northwind.dbo.Customers.CompanyName FROM Northwind.dbo.Customers
--Datenbankname.Schemaname.Tabellennamen.Spaltenname
SELECT * FROM FußballWM.dbo.Teams


SELECT CompanyName, Country, City 
INTO #TempTable
FROM Customers

