 --  1 ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. 
SELECT country.name, countrylanguage.language, countrylanguage.Percentage
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = 'Slovene'
order by percentage desc;

-- 2 ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente.

select * from city;
SELECT country.name, city.CountryCode, COUNT(city.CountryCode) AS Ciudades
FROM country
JOIN city ON country.code = city.CountryCode
group by country.name, city.CountryCode
order by Ciudades desc;

-- 3 ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? Tu consulta debe organizar el resultado por población en orden descendente.

select * from city where CountryCode = 'mex' and Population > 500000
order by population desc;

-- 4 ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? Tu consulta debe organizar el resultado por porcentaje en orden descendente.
select country.name, countrylanguage.Percentage, countrylanguage.language
from country
join countrylanguage on country.code = countrylanguage.countrycode
where Percentage > 89
order by percentage desc;

-- 5 ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?

select country.name, country.SurfaceArea, country.Population
from country
where SurfaceArea < 501 and population > 100000;

-- 6 ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años

select country.name, country.GovernmentForm, country.capital, country.LifeExpectancy
from country
where GovernmentForm = 'constitutional monarchy' and capital > 200 and LifeExpectancy > 75;

-- 7 ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.

select country.name, city.name, city.District, city.Population
from country
join city on country.code = city.CountryCode
where country.name = 'argentina' and city.Population >500000;

-- 8 ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. 

select country.Region, count(country.name) as countries
from country
group by Region
order by  countries desc;
