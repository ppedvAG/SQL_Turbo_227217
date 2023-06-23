--Ungenaue Suche/Filterung mit LIKE statt =

--Alle Kunden deren Firmenname mit A beginnt:


SELECT * FROM Customers
WHERE CompanyName LIKE 'a%'

--mit LIKE geben wir ein Schema an, nachdem gefiltert werden soll
--Hierfür verwenden wir Symbole, sog. Wildcards, um unbekannte Werte zu benennen

--'%' = unendlich viele Symbole, egal welche

SELECT * FROM Customers
WHERE PostalCode LIKE '8%'

SELECT * FROM Customers
WHERE CompanyName LIKE 'alf%'

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%' --% am Anfang und am Ende bedeutet, das gesuchte Wort darf irgendwo stehen


--'_' = ein einziges Symbol, egal welches

SELECT * FROM Customers
WHERE CompanyName LIKE '_a%'

SELECT * FROM Customers
WHERE CompanyName LIKE '__a%'

--'[abc]' = alle Werte in den Klammern, sind an dieser Stelle gültig

SELECT * FROM Customers
WHERE PostalCode LIKE '[678]%' -- '6%' OR '7%' OR '8%'

--'[^abc]' = alles was NICHT in den Klammern steht, ist gültig

SELECT * FROM Customers
WHERE PostalCode LIKE '[^678]%'

--'[1-5]' = alles innerhalb "der Reichweite" ist gültig

SELECT * FROM Customers
WHERE PostalCode LIKE '[6-8]%'

SELECT * FROM Customers
WHERE CompanyName LIKE '[f-n]%'


--Wildcards: %, _, [abc], [^abc], [a-c]
--Können beliebig komplex miteinander kombininert werden

-- LIKE Lastname 'M[eay][aei]er%' -- =Meier, Maier, Myeer