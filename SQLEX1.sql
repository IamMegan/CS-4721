CREATE TABLE Compensation(
  ID INT,
  Name VARCHAR(20),
  BirthDate DATE,
  Salary INT,
  Department VARCHAR(20),
  Bonus INT
);

INSERT INTO Compensation VALUES
  (2538, 'John Doe','1993-10-2', 45000, 'Engineering', NULL),
  (5384, 'Mary Smith',NULL, 32000, 'Sales', 1000),
  (6381, 'James Brown', '2001-12-21', 95000, 'Sales', 3000),
  (8820, 'Mike Walker', '1991-10-16', 50000, 'IT', 0),
  (3358, 'Linda Jones', '1996-06-12', 75000, 'HR', 4000);
  
SELECT *
FROM Compensation;

Select ID, Name, BirthDate, Department, Bonus
FROM Compensation;

Select Salary + Bonus
From Compensation;

Select *
FROM Compensation
Where ID > 3000 AND ID < 6000;

SELECT ID, Name
FROM Compensation
WHERE Salary < 50000;

Select *
FROM Compensation
Where Department != 'Sales';
