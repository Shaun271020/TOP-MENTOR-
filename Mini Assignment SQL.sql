USE world;

-- 1. Display the Name, Continent, and Population of all countries
--    located in Asia.
SELECT Name, Continent, Population
FROM Country
WHERE Continent = 'Asia';


-- 2. Display the Name, Population, and LifeExpectancy of all countries.
--    Sort by Population in descending order.
SELECT Name, Population, LifeExpectancy
FROM Country
ORDER BY Population DESC;


-- 3. Display countries in Europe with population greater than
--    20,000,000. Sort alphabetically by country name.
SELECT Name, Continent, Population
FROM Country
WHERE Continent = 'Europe'
  AND Population > 20000000
ORDER BY Name ASC;


-- 4. Display countries in North America or South America.
--    Sort by Region.
SELECT Name, Region, SurfaceArea
FROM Country
WHERE Continent = 'North America'
   OR Continent = 'South America'
ORDER BY Region ASC;


-- 5. Display countries that are NOT located in Africa.
--    Sort by country name.
SELECT Name, Continent, Population
FROM Country
WHERE NOT Continent = 'Africa'
ORDER BY Name ASC;


-- 6. Display countries whose population is between
--    10,000,000 and 50,000,000.
--    Sort by population.
SELECT Name, Population, GovernmentForm
FROM Country
WHERE Population BETWEEN 10000000 AND 50000000
ORDER BY Population ASC;


-- 7. Display countries whose continent is Asia, Europe, or Oceania.
SELECT Name, Capital, Population
FROM Country
WHERE Continent IN ('Asia', 'Europe', 'Oceania');


-- 8. Display countries whose names start with the letter 'A'.
--    Sort alphabetically.
SELECT Name, Region, Population
FROM Country
WHERE Name LIKE 'A%'
ORDER BY Name ASC;


-- 9. Display countries that:
--    - are in Asia OR Europe
--    - have population greater than 50,000,000
--    - have life expectancy greater than 70
--    Sort by population descending.
SELECT Name, Continent, Population, LifeExpectancy
FROM Country
WHERE (Continent = 'Asia' OR Continent = 'Europe')
  AND Population > 50000000
  AND LifeExpectancy > 70
ORDER BY Population DESC;


-- 10. Display countries that:
--     - are NOT in Africa
--     - have population between 5,000,000 and 30,000,000
--     - have 'land' in their name
--     Sort alphabetically.
SELECT Name, Continent, Population, GovernmentForm
FROM Country
WHERE NOT Continent = 'Africa'
  AND Population BETWEEN 5000000 AND 30000000
  AND Name LIKE '%land%'
ORDER BY Name ASC;
