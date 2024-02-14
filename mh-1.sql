-- Satýcýlarýn 2016 ve 2017 yýllarýndaki en yüksek 5 toplam satýþ adetini (2016ya göre sýralama yaparak)
-- methodu 'mülk satýldý, mülk önceden satýldý veya mülk açýk artýrmadan sonra satýldý'
-- koþullarý olmak þartý ile gösteren sorgu

SELECT TOP 5 SellerG, [2016] AS 'TOTAL SALES IN 2016', [2017] AS 'TOTAL SALES IN 2017'
FROM (
    SELECT SellerG, DATEPART(YEAR, Date_) AS 'YEAR', Method
    FROM melbourne_housing
    WHERE Method IN ('property sold', 'property sold prior', 'sold after auction')
) AS SourceTable
PIVOT (
    COUNT(Method) FOR [YEAR] IN ([2016], [2017]) 
) AS PivotTable
ORDER BY [2016] DESC

