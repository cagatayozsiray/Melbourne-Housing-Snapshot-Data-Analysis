-- Satýþcýlarýn bölgelerde yaptýðý toplam satýþ adetini gösteren sorgu

SELECT
    SellerG,
    ISNULL([Eastern Metropolitan], 0) AS [Eastern Metropolitan],
    ISNULL([Eastern Victoria], 0) AS [Eastern Victoria],
    ISNULL([Northern Metropolitan], 0) AS [Northern Metropolitan],
    ISNULL([Northern Victoria], 0) AS [Northern Victoria],
    ISNULL([South-Eastern Metropolitan], 0) AS [South-Eastern Metropolitan],
    ISNULL([Southern Metropolitan], 0) AS [Southern Metropolitan],
    ISNULL([Western Metropolitan], 0) AS [Western Metropolitan],
    ISNULL([Western Victoria], 0) AS [Western Victoria]
FROM (
    SELECT
        SellerG, 
        Regionname,
        COUNT(*) AS SaleCount
    FROM melbourne_housing
    GROUP BY SellerG, Regionname
) AS Source
PIVOT
(
    MAX(SaleCount)
    FOR Regionname IN (
        [Eastern Metropolitan], [Eastern Victoria], [Northern Metropolitan], [Northern Victoria],
        [South-Eastern Metropolitan], [Southern Metropolitan], [Western Metropolitan], [Western Victoria]
    )
) AS PivotTable
ORDER BY SellerG;


