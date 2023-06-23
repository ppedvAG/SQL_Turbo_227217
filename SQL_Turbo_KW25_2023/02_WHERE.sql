--Ergebnismenge filtern mit WHERE:

SELECT * FROM Customers
WHERE Country = 'France'

--WHERE steht immer nach dem FROM

SELECT * FROM Customers
WHERE Country = 'France'
ORDER BY City --ORDER BY ist immer am Ende

--WHERE Spaltenname = 'Wert'; funktioniert mit EXAKTEN Treffern

SELECT * FROM Customers
WHERE Country = ' France'


--Mit WHERE funktionieren auch alle anderen Vergleichsoperatoren:

SELECT * FROM Orders
WHERE Freight < 100

SELECT * FROM Orders
WHERE Freight > 100

--Operatoren: =, >, <, >=, <=, != (ungleich)

SELECT * FROM Customers
WHERE Country != 'France'


--Mehrere Filterbedingungen verkn�pfen mit AND oder OR

SELECT * FROM Customers
WHERE Country = 'France' AND City = 'Paris'

--AND m�ssen beide Bedingungen erf�llt sein (TRUE sein, bzw. = 1 sein)

SELECT * FROM Customers
WHERE Country = 'France' OR Country = 'Germany'

--OR muss nur eine Bedingung TRUE sein


--umst�ndlich:
SELECT * FROM Customers
WHERE Country = 'France' OR Country = 'Germany' OR Country = 'Spain' OR Country = 'Brazil'

--k�rzer:
SELECT * FROM Customers
WHERE Country IN ('France', 'Germany', 'Spain', 'Brazil')
--Mit Spaltenname IN (Wert1, Wert2, usw...) k�nnen mehrere OR Bedingungen verkn�pft werden
--wenn sie sich auf die selbe Spalte beziehen


SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500
--alternativ:
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500
--BETWEEN ist wie <= AND >= (Randwerte sind dabei)



SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France' AND City = 'Paris'
--AND ist "st�rker bindent", Wie bei Punkt (=AND) vor Strich (=OR) in Mathe

SELECT * FROM Customers
WHERE (Country = 'Germany' OR Country = 'France') AND (City = 'Paris' OR City = 'Berlin')
--Wir k�nnen Klammern setzen um Filter zusammenzuhalten

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France' AND City = 'Paris' OR City = 'Berlin'
