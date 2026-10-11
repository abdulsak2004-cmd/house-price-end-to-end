-- CREATE SCHEMA house_prices_db;
-- USE house_prices_db;
-- SELECT COUNT(*) FROM train;
-- SELECT * FROM train;
-- DESCRIBE test;
-- DESCRIBE test;

-- SELECT MIN(SalePrice) AS 'MIN_Sale_Price' ,MAX(SalePrice) AS 'MAX_Sale_Price' ,AVG(SalePrice) AS 'AVG_Sale_Price',STD(SalePrice) AS 'STD_Sale_Price' FROM train;

-- SELECT Neighborhood,COUNT(*) FROM train
-- GROUP BY Neighborhood;

-- SELECT  AVG(SalePrice),OverallQual,COUNT(*) FROM train
-- GROUP BY OverallQual;

-- SELECT  AVG(SalePrice),YrSold FROM train
-- GROUP BY YrSold;

-- -- House price is increasing in odd years abd decreasing in even years

-- SELECT SalePrice, Neighborhood, HouseStyle FROM train
-- ORDER BY SalePrice DESC LIMIT 10;
--     
-- SELECT Neighborhood,COUNT(*) AS 'COUNT', AVG(SalePrice) AS 'AVG_Sale_Price' FROM train
-- GROUP BY Neighborhood
-- HAVING COUNT>20 AND AVG_Sale_Price > 200000;

-- SELECT MSZoning,COUNT(*) 'Total Houses',AVG(SalePrice) AS "Avg Price",MIN(SalePrice) AS "Min Price",MAX(SalePrice) AS "Max Price" FROM train
-- GROUP BY MSZoning 

-- SELECT  h1.Neighborhood,h1.SalePrice AS SalePrice_h1, AVG(h2.SalePrice) AS AVG_SalePrice_h2
-- FROM train AS h1
-- JOIN train AS h2
-- ON h1.Neighborhood=h2.Neighborhood AND h1.id!=h2.id
-- GROUP BY h1.ID

-- SELECT * FROM train 
-- WHERE SalePrice>(
-- 	SELECT AVG(SalePrice) FROM train
-- )

-- SELECT * FROM train
-- WHERE ID IN(

-- )
-- SELECT *
-- FROM train AS h1
-- WHERE h1.SalePrice = (
--     SELECT MAX(SalePrice)
--     FROM train AS h2
--     WHERE h2.Neighborhood = h1.Neighborhood
-- );
-- SELECT * FROM train 

-- SELECT Neighborhood
-- FROM (
--     SELECT Neighborhood,AVG(SalePrice)
--     FROM train
--     GROUP BY Neighborhood
-- 	ORDER BY AVG(SalePrice) DESC LIMIT 5
-- ) AS t;



-- SELECT COUNT(*) FROM (SELECT * FROM train
-- WHERE OverallQual>=8
-- UNION 
-- SELECT * FROM train
-- WHERE SalePrice>300000
-- ) AS t WHERE SalePrice>300000 AND OverallQual>=8;

-- SELECT *,
-- RANK() OVER(PARTITION BY Neighborhood ORDER BY SalePrice DESC)
-- FROM train

-- SELECT *  FROM (SELECT *,
-- ROW_NUMBER() OVER(PARTITION BY Neighborhood ORDER BY SalePrice DESC) AS 'ROW'
-- FROM train) AS t
-- WHERE t.ROW<4

-- SELECT *,
-- LEAD(SalePrice) OVER(ORDER BY YrSold)
-- FROM train;

-- SELECT *,
-- FIRST_VALUE(SalePrice) OVER w AS 'EXPENSIVE',
-- LAST_VALUE(SalePrice) OVER(w ROWS BETWEEN UNBOUNDED PRECEDINGnw_employeesnw_employees
--              AND UNBOUNDED FOLLOWING) AS 'Cheapest'
-- FROM train
-- WINDOW w AS(
-- PARTITION BY Neighborhood ORDER BY SalePrice DESC)

-- SELECT Id,SalePrice,
-- SUM(SalePrice) OVER(ORDER BY SalePrice rows between unbounded preceding and current row) as 'Running_Total',
-- SalePrice * 100/SUM(SalePrice) OVER() as 'percent_total'
-- FROM train;


-- SELECT buckets,COUNT(*) as 'Bucket_counts' FROM (SELECT Id,SalePrice,
-- NTILE(4) OVER(ORDER BY SalePrice) AS 'buckets'
-- FROM train) as t
-- GROUP BY buckets;

-- SELECT Id,SalePrice, 
-- RANK() OVER(ORDER BY SalePrice) as 'rank',
-- DENSE_RANK() OVER(ORDER BY SalePrice) as 'dense_rank'
-- FROM train;