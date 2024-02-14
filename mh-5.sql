-- Her mahallede her mülk tipinden kaç adet olduðunu gösteren sorgu

SELECT 
Suburb,
    ISNULL([house, cottage, villa, semi, terrace], 0) AS house_cottage_villa_semi_terrace,
    ISNULL([townhouse], 0) AS townhouse,
    ISNULL([unit, duplex], 0) AS unit_duplex
FROM (
    SELECT Suburb, Type_, COUNT(*) AS Sale_Count
    FROM melbourne_housing
    GROUP BY Suburb, Type_
) AS SourceTable
PIVOT (
    SUM(Sale_Count)
    FOR Type_ IN ([house, cottage, villa, semi, terrace], [townhouse], [unit, duplex])
) AS PivotTable
ORDER BY Suburb


