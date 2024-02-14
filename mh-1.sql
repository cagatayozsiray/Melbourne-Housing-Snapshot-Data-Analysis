-- Sat�c�lar�n 2016 ve 2017 y�llar�ndaki en y�ksek 5 toplam sat�� adetini (2016ya g�re s�ralama yaparak)
-- methodu 'm�lk sat�ld�, m�lk �nceden sat�ld� veya m�lk a��k art�rmadan sonra sat�ld�'
-- ko�ullar� olmak �art� ile g�steren sorgu

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

