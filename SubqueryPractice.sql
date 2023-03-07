CREATE DATABASE subquery;
USE subquery;

CREATE TABLE CountryLanguage (
	CountryCode CHAR(3),
    Language VARCHAR(15),
    IsOfficial CHAR(1),
    Percentage DECIMAL(3,1)
);

CREATE TABLE Country (
	Code CHAR(3),
    Name VARCHAR(15),
    Continent VARCHAR(15)
);

INSERT INTO CountryLanguage VALUES
	('ABW', 'Dutch', 'T', 5.3),
    ('AFG', 'Balochi', 'F', 0.9),
    ('AGO', 'Kongo', 'F', 13.2),
    ('ALB', 'Albanian', 'T', 97.9),
    ('AND', 'Catalan', 'T', 32.3);

INSERT INTO Country VALUES
	('ABW', 'Aruba', 'North America'),
    ('AFG', 'Afghanistan', 'Asia'),
    ('AGO', 'Angola', 'Africa'),
    ('ALB', 'Albania', 'Europe'),
    ('AND', 'Andorra', 'Europe');
    
SELECT Language, Percentage
FROM CountryLanguage
WHERE Percentage > 
	(SELECT Percentage
	FROM CountryLanguage
    WHERE CountryCode = 'ABW' AND IsOfficial = 'T');
    
-- Flattened Subquery
SELECT L1.Language, L1.Percentage
FROM CountryLanguage AS L1
INNER JOIN CountryLanguage AS L2
ON L1.Percentage > L2.Percentage
WHERE L2.CountryCode = 'ABW' AND L2.IsOfficial = 'T';

SELECT Language, CountryCode
FROM CountryLanguage
WHERE CountryCode IN 
	(SELECT Code
    FROM Country
    WHERE Continent = 'Europe');
    
-- Flattened Subquery

SELECT Language, CountryCode
FROM CountryLanguage
INNER JOIN Country
ON CountryCode = Code
WHERE Continent = 'Europe';

SELECT Name, Continent
FROM Country AS C1
WHERE 2 <= 
	(SELECT COUNT(C2.Continent)
    FROM Country AS C2
    WHERE C1.Continent = C2.Continent);

-- Flattened subquery
SELECT C1.Name, C1.Continent
FROM Country AS C1
INNER JOIN Country AS C2
WHERE C1.Continent = C2.Continent
GROUP BY C1.Name, C1.Continent
HAVING 2<= COUNT(C2.Continent);
    
SELECT Name, Continent
FROM Country
WHERE EXISTS
	(SELECT *
    FROM CountryLanguage
    Where CountryCode = Code AND Percentage > 97);
    
-- Flattened Subquery
SELECT Name, Continent
FROM Country
INNER JOIN CountryLanguage
ON CountryCode = Code
WHERE Percentage > 97;
    
