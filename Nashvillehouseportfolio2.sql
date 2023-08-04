--Nashvillehouse
SELECT * FROM Nashvillehouse

SELECT Saleconvertdate,convert(Date,SaleDate)
FROM Nashvillehouse


Alter table Nashvillehouse
ADD Saleconvertdate DATE

Update Nashvillehouse
Set Saleconvertdate = convert(Date,SaleDate)

--property address

SELECT * FROM Nashvillehouse
--WHERE PropertyAddress IS
ORDER BY ParcelID

SELECT a.PropertyAddress,a.ParcelId, b.PropertyAddress,b.ParcelID,ISNULL( a.PropertyAddress,b.PropertyAddress)
FROM Nashvillehouse a
JOIN Nashvillehouse b
  ON a.ParcelID = b.ParcelID
  AND a.[UniqueID ]<>b.[UniqueID ]
WHERE a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL( a.PropertyAddress,b.PropertyAddress)
FROM Nashvillehouse a
JOIN Nashvillehouse b
  ON a.ParcelID = b.ParcelID
  AND a.[UniqueID ]<>b.[UniqueID ]
WHERE a.PropertyAddress IS NULL

--seperate the address
SELECT PropertyAddress FROM Nashvillehouse

SELECT
SUBSTRING(PropertyAddress,1,CHARINDEX (',',PropertyAddress )-1) AS address,
SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1,LEN(PropertyAddress)) AS address

FROM Nashvillehouse

Alter table Nashvillehouse
ADD Address NVARCHAR(250)

Update Nashvillehouse
Set Address  = SUBSTRING(PropertyAddress,1,CHARINDEX (',',PropertyAddress )-1) 

Alter table Nashvillehouse
ADD cityname NVARCHAR(250)

Update Nashvillehouse
Set  cityname = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) +1,LEN(PropertyAddress))

SELECT Address,cityname FROM Nashvillehouse

--y = yes and n = no

SELECT DISTINCT(SoldAsVacant),COUNT(SoldAsVacant)
FROM Nashvillehouse
GROUP BY (SoldAsVacant)
ORDER BY SoldAsVacant DESC

SELECT SoldAsVacant,
  CASE when SoldAsvacant = 'y' then 'yes'
       when SoldAsvacant = 'n' then 'No'
       ELSE SoldAsVacant
END
FROM Nashvillehouse

 UPDATE Nashvillehouse
 SET SoldAsVacant = CASE when SoldAsvacant = 'y' then 'yes'
       when SoldAsvacant = 'n' then 'No'
       ELSE SoldAsVacant
END
FROM Nashvillehouse


SELECT * FROM Nashvillehouse

ALTER TABLE Nashvillehouse
DROP COLUMN TaxDistrict,HalfBath




