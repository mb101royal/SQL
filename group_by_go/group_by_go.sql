--CREATE DATABASE Group_By_Go

-- Creating tables
CREATE TABLE Ishci
(
	Id INT IDENTITY PRIMARY KEY,
	SAA NVARCHAR(128),
	VezifeId INT,
	Maas MONEY
)
CREATE TABLE Vezife
(
	Id INT IDENTITY PRIMARY KEY,
	Ad NVARCHAR(50)
)
CREATE TABLE Filial
(
	Id INT IDENTITY PRIMARY KEY,
	Ad NVARCHAR(50)
)
CREATE TABLE Mehsul
(
	Id INT IDENTITY PRIMARY KEY,
	Ad NVARCHAR(50),
	Alish_Qiymeti MONEY,
	Satish_Qiymeti MONEY
)
CREATE TABLE Satish
(
    Id INT IDENTITY PRIMARY KEY,
    MehsulId INT REFERENCES Mehsul(Id),
    IshciId INT REFERENCES Ishci(Id),
    Satish_Tarixi DATETIME,
    FilialId INT REFERENCES Filial(Id)
);

-- Insert data into Ishci table
INSERT INTO Ishci (SAA, VezifeId, Maas) VALUES 
('John Doe', 1, 5000.00),
('Jane Smith', 2, 4500.00),
('Bob Johnson', 3, 4000.00);

-- Insert data into Vezife table
INSERT INTO Vezife (Ad) VALUES ('Manager'), ('Developer'), ('Sales Representative');

-- Insert data into Filial table
INSERT INTO Filial (Ad) VALUES ('Headquarters'), ('Branch A'), ('Branch B');

-- Insert data into Mehsul table
INSERT INTO Mehsul (Ad, Alish_Qiymeti, Satish_Qiymeti) VALUES 
('Laptop', 800.00, 1200.00),
('Smartphone', 400.00, 600.00),
('Printer', 200.00, 300.00);

-- Inserting data into Satish table
INSERT INTO Satish (MehsulId, IshciId, Satish_Tarixi, FilialId) VALUES
(1, 1, '2023-11-21 10:00:00', 1),
(2, 2, '2023-11-21 11:30:00', 2),
(3, 3, '2023-11-21 14:45:00', 3),
(1, 2, '2023-11-21 16:00:00', 1),
(2, 3, '2023-11-21 17:30:00', 2),
(3, 1, '2023-11-21 19:15:00', 3);

-- 4) Hər işçinin satdığı məhsul sayını tap

SELECT Ishci.Id AS IshciId, COUNT(Satish.Id) AS SatilanMehsulSayi
FROM Ishci
LEFT JOIN Satish
ON Ishci.Id = Satish.IshciId
GROUP BY Ishci.Id;

-- 5) Bu gün üzrə ən çox məhsul satılan filialı tap.

SELECT TOP 1 FilialId, COUNT(Satish.Id) AS SatilanMehsulSayi
FROM Satish
WHERE CONVERT(DATE, Satish_Tarixi) = CONVERT(DATE, GETDATE())
GROUP BY FilialId
ORDER BY COUNT(Satish.Id) DESC;

-- 6) Cari ayda ən çox satılan məhsulu tap.

WITH SatilanMehsullar AS (
    SELECT MehsulId, COUNT(Id) AS SatilanMehsulSayi
    FROM Satish
    WHERE YEAR(Satish_Tarixi) = YEAR(GETDATE())
          AND MONTH(Satish_Tarixi) = MONTH(GETDATE())
    GROUP BY MehsulId
)

SELECT TOP 1 MehsulId, SatilanMehsulSayi
FROM SatilanMehsullar
ORDER BY SatilanMehsulSayi DESC;