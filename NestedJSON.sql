--------------- Nested JSON Output --------------

Select Top(10)
	P.ProductKey,
	P.EnglishProductName As "Detail.ProductName",  -- Nested
	P.ListPrice As "Detail.Price"				   -- Nested
From DimProduct As P
Join FactInternetSales As F
On P.ProductKey = F.ProductKey
For JSON Path