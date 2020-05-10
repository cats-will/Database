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
/*
2
*/
select a.Name, b.Name
from Production.Product a
join Production.ProductSubcategory b
on a.Name = b.Name
join Production.ProductCategory c
on b.Name = c.Name
/*
3
*/
select A.Name, COUNT(*)
from Production.Product B
join Production.ProductSubcategory C
on B.ProductSubcategoryID = C.ProductSubcategoryID
join Production.ProductCategory A
on C.ProductCategoryID = A.ProductCategoryID
group by A.Name
/*
4
*/
select A.Name, count(all A.Name)
from Production.Product A
join Production.ProductSubcategory B
on A.ProductSubcategoryID = B.ProductSubcategoryID
group by A.Name
/*
5
*/
select top 3 a.Name, count(*)
from Production.Product b
join Production.ProductSubcategory a
on a.ProductSubcategoryID = b.ProductSubcategoryID
group by a.Name
order by count(*)
/*
6
*/
select a.Name, max(ListPrice)
from Production.Product b
join Production.ProductSubcategory a
on a.ProductSubcategoryID = b.ProductSubcategoryID
where Color = 'Red'
group by a.Name
/*
7
*/
select p.Name, count(*)
from Purchasing.ProductVendor a
join Purchasing.Vendor p
on a.BusinessEntityID = p.BusinessEntityID
group by p.Name
/*
8
*/
select a.Name, count(*)
from Purchasing.ProductVendor b join
Purchasing.Vendor a
on a.BusinessEntityID = b.BusinessEntityID
join Production.Product c
on c.ProductID = b.ProductID
group by a.Name
having count(*) > 1
/*
9
*/
select top 1 p.Name, count(*)
from Production.Product p
join Purchasing.ProductVendor a
on p.ProductID = a.ProductID
group by p.Name
order by count(*) desc
/*
10
*/
SELECT TOP 2 C.Name, COUNT(*)
FROM Sales.SalesOrderDetail SOD
JOIN Production.Product Pr
ON SOD.ProductID = Pr.ProductID
JOIN Production.ProductSubcategory SubC
ON Pr.ProductSubcategoryID = SubC.ProductSubcategoryID
JOIN Production.ProductCategory AS C
ON C.ProductCategoryID = SubC.ProductCategoryID
GROUP BY C.Name
ORDER BY COUNT(*) DESC
/*
11
*/
select a.Name, count(distinct b.ProductSubcategoryID), count(ProductID)
from Production.Product sod
join Production.ProductSubcategory b
on sod.ProductSubcategoryID = b.ProductSubcategoryID
join Production.ProductCategory a
on a.ProductCategoryID = b.ProductCategoryID
group by a.Name
/*
12
*/
select p.CreditRating, count(ProductID)
from Purchasing.ProductVendor a
join Purchasing.Vendor p
on a.BusinessEntityID = p.BusinessEntityID
group by p.CreditRating
