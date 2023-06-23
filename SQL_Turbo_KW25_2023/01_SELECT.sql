/*
Kommentar Block
�ber mehrere Zeilen bis
geschlossen */

-- Ist ein einzeiliger Kommentar
SELECT 100 -- Ab 2 Minuszeichen Kommentar f�r restliche Zeil

/* F5 f�hrt gesamtes Skript aus (oder Butto "Ausf�hren")

Wenn wir etwas markieren, wird mit F5 der STRG+E nur markierter Teil ausgef�hrt */


--Mit SELECT k�nnen auch "eigene Sachen" ausgegeben werden:


SELECT 'abc' --Strings (Zeichen, bzw. Worte) m�ssen in Hochkommas ' angegeben werden

SELECT 100 --F�r Zahlen, bzw. numerische Werte keine Hochkommas n�tig

SELECT 100+5

SELECT 5*7+(3-1) --auch mathematische Operationen m�glich

SELECT 'Spalte1', 'Spalte2', 100  --mehrere Spalten mit Komma , getrennt


SELECT * FROM Customers -- SELECT * bedeutet ALLE Spalten die in der Tabelle zu finden sind

SELECT CompanyName FROM Customers


USE Northwind --USE Datenbankname sagt dem restlichen Skript, in welcher Datenbank wir uns befinden


--SQL ist nicht case sensitive, und braucht keine Formatierung

SelECt 
			ComPANYNAME,
	City,                          CouNTRY FrOm 
	CuSTOMERS

SELECT CompanyName, City, Country FROM Customers
SELECT City, Country, CompanyName FROM Customers --Reihenfolge der Spalten egal


SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], 
[Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax] FROM [Customers]

SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], 
[City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]

--Per Drag&Drop mit Linksklick, k�nnen Spaltennamen, oder Spalten-Ordner ins Skriptfenster gezogen werden


SELECT * FROM [Order Details] --alles in eckigen Klammer [] ist Name eines DB Objekts



--Sortieren mit ORDER BY; Steht immer ganz am Ende der Abfrage

SELECT * FROM Orders
ORDER BY Freight --normalerweise aufsteigend/ascending/ASC

SELECT * FROM Orders
ORDER BY Freight DESC --mit DESC/descending wird Sortierung absteigend

SELECT CompanyName, Country, City FROM Customers
ORDER BY Country, City DESC, CompanyName --Nach mehreren Spalten sortieren m�glich, in der Reihenfolge wie wir schreiben


--Duplicates "l�schen" mit DISTINCT

SELECT DISTINCT Country FROM Customers

--DISTINCT filtert nur Ergebnisse, bei denen ALLE Spalten gleich sind
SELECT DISTINCT Country, City FROM Customers

SELECT DISTINCT Country, City, CompanyName FROM Customers


--TOP X - Zeigt uns nur die obersten X Zeilen an

SELECT TOP 10 * FROM Customers

SELECT TOP 10 * FROM Orders
ORDER BY Freight DESC

SELECT TOP 5 * FROM Orders
ORDER BY OrderDate DESC

SELECT TOP 10 PERCENT * FROM Orders

--BOTTOM X gibt es nicht, wir drehen einfach mit ORDER BY die Tabelle um


--Umbennen von Spalten mit Aliasen:

SELECT CompanyName as Firmenname FROM Customers

SELECT CompanyName as Firmenname, Country as Land FROM Customers

SELECT 'Hallo' as Begr��ung, 5+7 as Mathematik
