USE Northwind;

/* SELECT complete table  */
DROP PROC IF EXISTS selectWholeRegionTable;
GO

CREATE PROC selectWholeRegionTable
AS
SELECT * FROM Region ORDER BY RegionID;
GO

/* SELECT a single region */
DROP PROC IF EXISTS selectRegionDescription;
GO

CREATE PROC selectRegionDescription(@description NCHAR(50))
AS
SELECT * FROM Region 
WHERE RegionDescription = @description AND
RegionID = (SELECT RegionID FROM Region WHERE RegionDescription = @description);
GO

/* UPDATE an existing region */
DROP PROC IF EXISTS updateRegion;
GO

CREATE PROC updateRegion(@ID INT, @description NCHAR(50))
AS
UPDATE Region SET RegionDescription = @description WHERE RegionID = @ID;
GO

/* INSERT a new region */
DROP PROC IF EXISTS insertRegion;
GO

CREATE PROC insertRegion(@description NCHAR(50))
AS
IF NOT EXISTS (SELECT * FROM Region WHERE RegionDescription = @description)
INSERT INTO Region (RegionID, RegionDescription) VALUES ((SELECT MAX(RegionID) FROM Region) + 1, @description);
GO

/* DELETE an existing region */
DROP PROC IF EXISTS deleteRegion;
GO

CREATE PROC deleteRegion(@description NCHAR(50))
AS
DECLARE @deletedID AS INT;
SELECT @deletedID = RegionID FROM Region WHERE RegionDescription = @description;

DELETE EmployeeTerritories FROM EmployeeTerritories INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID WHERE RegionID = @deletedID;

DELETE FROM Territories WHERE RegionID = @deletedID;

DELETE FROM Region WHERE RegionID = @deletedID;
GO