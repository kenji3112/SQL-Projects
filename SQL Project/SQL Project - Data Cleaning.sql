-- Data Cleaning

USE world_layoffs;


-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns or Rows

--SELECT *
--INTO layoffs_staging
--FROM layoffs;



SELECT *
FROM layoffs
;

-- Remove duplicates
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, [location], industry, total_laid_off, percentage_laid_off, [date], stage, country, funds_raised_millions order by (SELECT NULL)) AS row_num
FROM layoffs_staging;


WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, [location], industry, total_laid_off, percentage_laid_off, [date], stage, country, funds_raised_millions order by (SELECT NULL)) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;	




-- Standardizing data
 SELECT company, TRIM(company) as 'Trimmed Company'
 FROM layoffs_staging;

 UPDATE layoffs_staging
 SET company = TRIM(company);



 SELECT DISTINCT industry
 FROM layoffs_staging
 ORDER BY 1
;

 SELECT *
 FROM layoffs_staging
 WHERE industry LIKE 'Crypto%';

 UPDATE layoffs_staging
 SET industry = 'Crypto'
 WHERE industry LIKE 'Crypto%';

 SELECT DISTINCT country
 FROM layoffs_staging
 ORDER BY country;

 SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
 FROM layoffs_staging;

 UPDATE layoffs_staging
 SET country = TRIM(TRAILING '.' FROM country)
 WHERE country LIKE 'United States%';

 SELECT [date],
 CONVERT(DATE,[date],120) as ConvertedDate 
 FROM layoffs_staging;


 SELECT *
 FROM layoffs_staging
 WHERE total_laid_off IS NULL
 AND percentage_laid_off IS NULL;

 SELECT *
 FROM layoffs_staging
 WHERE industry IS NULL
 OR industry = '';

 
 SELECT *
 FROM layoffs_staging
 WHERE company LIKE 'Bally%';



 SELECT t1.industry, t2.industry
 FROM layoffs_staging t1
 JOIN layoffs_staging t2 
  ON   t1.company = t2.company
 WHERE (t1.industry IS NULL OR t1.industry = '')
 AND  t2.industry IS NOT NULL;

 WITH CTE AS (
    SELECT t1.company, t2.industry
    FROM layoffs_staging t1
    JOIN layoffs_staging t2 
      ON t1.company = t2.company
    WHERE (t1.industry IS NULL OR t1.industry = '')
      AND t2.industry IS NOT NULL
)
UPDATE t1
SET t1.industry = CTE.industry
FROM layoffs_staging t1
JOIN CTE
  ON t1.company = CTE.company;


DELETE
FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


  
SELECT *
FROM layoffs_staging
;


WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, [location], industry, total_laid_off, percentage_laid_off, [date], stage, country, funds_raised_millions order by (SELECT NULL)) AS row_num
FROM layoffs
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;	


