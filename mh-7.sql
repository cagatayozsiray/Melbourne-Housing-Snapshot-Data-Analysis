-- Mahalledeki mülkün en yüksek ve en düþük fiyatýný, 2016 ve 2017de satýlan mülk adetini gösteren sorgu

SELECT
    Suburb,
    ISNULL(FORMAT(MAX(CASE WHEN DATEPART(YEAR, DATE_) = '2016' THEN Price END), 'N0'), '0') AS 'MAX PRICE IN 2016',
    ISNULL(FORMAT(MIN(CASE WHEN DATEPART(YEAR, DATE_) = '2016' THEN Price END), 'N0'), '0') AS 'MIN PRICE IN 2016',
    ISNULL(COUNT(CASE WHEN DATEPART(YEAR, DATE_) = '2016' AND Method IN ('Property Sold', 'Property Sold Prior', 'Sold After Auction') THEN 1 END), 0) AS 'TOTAL SALES IN 2016',
    ISNULL(FORMAT(MAX(CASE WHEN DATEPART(YEAR, DATE_) = '2017' THEN Price END), 'N0'), '0') AS 'MAX PRICE IN 2017',
    ISNULL(FORMAT(MIN(CASE WHEN DATEPART(YEAR, DATE_) = '2017' THEN Price END), 'N0'), '0') AS 'MIN PRICE IN 2017',
    ISNULL(COUNT(CASE WHEN DATEPART(YEAR, DATE_) = '2017' AND Method IN ('Property Sold', 'Property Sold Prior', 'Sold After Auction') THEN 1 END), 0) AS 'TOTAL SALES IN 2017'
FROM
    melbourne_housing
WHERE
    DATEPART(YEAR,Date_) IN ('2016', '2017')
GROUP BY
    Suburb
ORDER BY
    Suburb