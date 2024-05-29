-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging;


SELECT MAX(total_laid_off) as Max_Total_Laid_Off, MAX(percentage_laid_off) as Max_Percentage_Laid_Off
FROM layoffs_staging;


SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


SELECT YEAR([date]) as 'Year', SUM(total_laid_off) Total_Laid_Off
FROM
layoffs_staging
GROUP BY YEAR([date])
ORDER BY 1 DESC;

SELECT MIN([date]), MAX([date])
FROM layoffs_staging;


SELECT stage, SUM(total_laid_off) Total_Laid_Off
FROM
layoffs_staging
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, AVG(percentage_laid_off) PCT_Laid_Off
FROM
layoffs_staging
GROUP BY company
ORDER BY 2 DESC;






SELECT *
FROM layoffs_staging;

--WITH Rolling_Total AS
--(
--SELECT 
--    SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2) AS YearMonth, SUM(total_laid_off) as Total_Laid_Off
--	FROM layoffs_staging
--	WHERE SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2) IS NOT NULL
--	GROUP BY SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2)
--	ORDER BY 1
--)
--SELECT YearMonth, SUM(Total_Laid_Off) OVER(ORDER BY YearMonth)
--FROM Rolling_Total;

WITH Rolling_Total AS
(
    SELECT 
        SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2) AS YearMonth,
        SUM(total_laid_off) as Total_Laid_Off
    FROM layoffs_staging
    WHERE SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2) IS NOT NULL
    GROUP BY SUBSTRING(CONVERT(VARCHAR, [date], 112), 1, 4) + '-' + SUBSTRING(CONVERT(VARCHAR, [date], 112), 5, 2)
)
SELECT 
    YearMonth, Total_Laid_Off,
    SUM(Total_Laid_Off) OVER (ORDER BY YearMonth) AS Rolling_Total
FROM Rolling_Total
ORDER BY YearMonth;

SELECT company, YEAR([date]) as 'Year', SUM(total_laid_off) as 'Total Lay Off'
FROM
layoffs_staging
GROUP BY company, YEAR([date])
ORDER BY 3 DESC;



WITH company_year AS 
(
    SELECT 
        company, 
        YEAR([date]) AS [Year], 
        SUM(total_laid_off) AS [Total Lay Off]
    FROM
        layoffs_staging
    GROUP BY 
        company, 
        YEAR([date])
), Company_Year_Rank AS (
SELECT 
    company, 
    [Year], 
    [Total Lay Off], 
    DENSE_RANK() OVER(PARTITION BY [Year] ORDER BY [Total Lay Off] DESC) AS Ranking
FROM 
    company_year
Where [Year] IS NOT NULL
)
SELECT *
FROM
Company_Year_Rank
WHERE Ranking <= 5;

