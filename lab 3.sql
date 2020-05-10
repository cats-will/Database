/*
1
*/
select p.Name, pc.Name
from Production.Product p
join Production.ProductSubcategory b
on p.ProductSubcategoryID = b.ProductSubcategoryID
join Production.ProductCategory pc
on b.ProductCategoryID = pc.ProductCategoryID
where Color = 'Red' and ListPrice >= 100