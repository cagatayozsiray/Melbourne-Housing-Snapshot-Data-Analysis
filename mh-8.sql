-- Belediye alanlarının her bölgede yapıldığı satış sayısını gösteren sorgu

SELECT 
CouncilArea,
     ISNULL([Northern Victoria], 0) AS [Northern Victoria],
           ISNULL([South-Eastern Metropolitan], 0) AS [South-Eastern Metropolitan],
           ISNULL([Western Victoria], 0) AS [Western Victoria],
           ISNULL([Eastern Victoria], 0) AS [Eastern Victoria],
           ISNULL([Western Metropolitan], 0) AS [Western Metropolitan],
           ISNULL([Southern Metropolitan], 0) AS [Southern Metropolitan],
           ISNULL([Northern Metropolitan], 0) AS [Northern Metropolitan],
           ISNULL([Eastern Metropolitan], 0) AS [Eastern Metropolitan]
FROM (
    SELECT CouncilArea, Regionname, COUNT(*) AS Sale_Count
    FROM melbourne_housing
    GROUP BY CouncilArea, Regionname
) AS SourceTable
PIVOT (
    SUM(Sale_Count)
    FOR Regionname IN ([Northern Victoria],[South-Eastern Metropolitan],[Western Victoria],[Eastern Victoria],
         [Western Metropolitan],[Southern Metropolitan], [Northern Metropolitan],[Eastern Metropolitan])
) AS PivotTable
ORDER BY CouncilArea

