-- Mülk tiplerinin 2016 ve 2017 yýlýndaki satýþ adetleri ve satýþ oranlarýný gösteren sorgu

SELECT 
    Type_,
    [2016] AS [TOTAL SALES IN 2016],
    CAST([2016] / NULLIF(CAST((SELECT COUNT(*) FROM melbourne_housing WHERE DATEPART(YEAR, Date_) = 2016) AS DECIMAL(10,2)), 0) AS DECIMAL(10,2)) AS [RATIO IN 2016],
    [2017] AS [TOTAL SALES IN 2017],
    CAST([2017] / NULLIF(CAST((SELECT COUNT(*) FROM melbourne_housing WHERE DATEPART(YEAR, Date_) = 2017) AS DECIMAL(10,2)), 0) AS DECIMAL(10,2)) AS [RATIO IN 2017]
FROM (
    SELECT
        Type_,
        DATEPART(YEAR, Date_) AS [Year],
        COUNT(*) AS [Total Sales]
    FROM melbourne_housing
    GROUP BY
        Type_,
        DATEPART(YEAR, Date_)
) AS Source
PIVOT (
    SUM([Total Sales])
    FOR [Year] IN ([2016], [2017])
) AS PivotTable
ORDER BY Type_;


