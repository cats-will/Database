/*
1
*/
SELECT Name FROM Production.Product
WHERE ProductID IN (SELECT TOP 1 ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY SUM(OrderQty) DESC)
/*
2
*/
SELECT * FROM Person.Person
WHERE BusinessEntityID IN (
	SELECT PersonID FROM Sales.Customer
	WHERE CustomerID IN (
		SELECT CustomerID FROM Sales.SalesOrderHeader
		WHERE SalesOrderID IN (SELECT TOP 1 SalesOrderID FROM Sales.SalesOrderDetail
			ORDER BY UnitPrice DESC
		)
	)
)
/*
3
*/
SELECT * FROM Production.Product
WHERE ProductID IN (SELECT ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING COUNT(*) = 1)
/*
4
*/
select Name
from Production.Product AS A
WHERE A.ListPrice > ALL (select AVG(ListPrice)
	from Production.Product AS B
	where B.ProductSubcategoryID = A.ProductSubcategoryID)
/*
5
*/
select Name
from Production.Product
where ProductID in (select ProductID
	from Sales.SalesOrderDetail as A 
	join Sales.SalesOrderHeader as B on A.SalesOrderID = B.SalesOrderID
	where CustomerID in (select B.CustomerID
		from Sales.SalesOrderDetail AS A
		JOIN Sales.SalesOrderHeader AS B ON A.SalesOrderID = B.SalesOrderID
		JOIN Production.Product AS C ON C.ProductID = A.ProductID
		group by B.CustomerID 
		having COUNT(distinct C.Color) = 1 and COUNT(distinct C.Color) != 2
	)
		group by ProductID
		having count(distinct CustomerID) > 1
) 
/*
6
*/
select DISTINCT A.ProductID
from Sales.SalesOrderDetail as A 
join Sales.SalesOrderHeader as B on A.SalesOrderID = B.SalesOrderID
WHERE EXISTS (
	select ProductID
	from Sales.SalesOrderDetail as Q 
	join Sales.SalesOrderHeader as W on Q.SalesOrderID = W.SalesOrderID
	WHERE A.SalesOrderID != Q.SalesOrderID AND
	A.ProductID = Q.ProductID AND
	B.CustomerID = W.CustomerID
)
/*
7
*/
select DISTINCT B.CustomerID
from Sales.SalesOrderDetail as A 
join Sales.SalesOrderHeader as B on A.SalesOrderID = B.SalesOrderID
WHERE EXISTS (
	select ProductID
	from Sales.SalesOrderDetail as Q 
	join Sales.SalesOrderHeader as W on Q.SalesOrderID = W.SalesOrderID
	WHERE A.SalesOrderID != Q.SalesOrderID AND
	A.ProductID = Q.ProductID AND
	B.CustomerID = W.CustomerID
)