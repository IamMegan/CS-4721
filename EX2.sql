CREATE TABLE compensation(
  ID SMALLINT UNSIGNED,
  Name VARCHAR(45) NOT NULL,
  BirthDate DATE,
  Salary DECIMAL(5,0),
  Department VARCHAR(50),
  Bonus DECIMAL(4,0)
);

INSERT INTO compensation VALUES
  (2538, 'John Doe', '1993-10-2', 45000, 'Engineering', NULL),
  (5384, 'Mary Smith', NULL, 32000, 'Sales', 1000),
  (6381, 'James Brown', '2001-12-21', 95000, 'Sales', 3000),
  (8820, 'Mike Walker', '1991-10-16', 50000, 'IT', 0),
  (3358, 'Linda Jones', '1996-06-12', 75000, 'HR',4000);
  
SELECT *
FROM compensation;

SELECT ID, Name, BirthDate, Department, Bonus
FROM compensation;

SELECT Salary + Bonus
FROM compensation;

SELECT *
FROM compensation
Where ID > 3000 AND ID < 6000;

SELECT ID, Name
FROM compensation
WHERE Salary < 50000;

SELECT Name
FROM compensation
WHERE Department != 'Sales';

-- INSERT INTO compensation VALUES
--   (4835, NULL, '1995-8-21', 25000, 'IT', 2000);

SELECT Name
FROM compensation
WHERE (Salary + Bonus) > 50000;

SELECT ID
FROM compensation
WHERE BirthDate IS NULL;

SELECT Department
FROM compensation
WHERE Bonus IS NOT NULL;
