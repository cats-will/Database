/*
1
*/
SELECT p.Name, pc.Name
FROM Production.Product p
JOIN Production.ProductSubcategory b
ON p.ProductSubcategoryID = b.ProductSubcategoryID
JOIN Production.ProductCategory pc
ON b.ProductCategoryID = pc.ProductCategoryID
WHERE Color = 'Red' AND ListPrice >= 100
