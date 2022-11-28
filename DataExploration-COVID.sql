/*
-- Purpose: Exploratory Anlysis of COVID data for Tableau visualization
-- Author: Uche
-- Data Source: https://ourworldindata.org/covid-deaths
*/

-- Showing the total percentage of people dead accross the world
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, (SUM(cast(new_deaths AS int))/SUM(new_cases))*100 AS death_percentage
FROM [Portfolio Project]..CovidDeaths22
WHERE continent IS NOT NULL;


-- Showing the countries with the highest death count per continent
SELECT location, MAX(cast(total_deaths AS int)) AS total_deaths_count
FROM [Portfolio Project]..CovidDeaths22
WHERE continent IS NULL AND location NOT IN ('World','European Union', 'International') AND location NOT LIKE '%income%'
GROUP BY location
ORDER BY total_deaths_count DESC;


-- Looking at the countries with the highest infection rate compared to the population
SELECT location, population, MAX(total_cases) AS highest_infection_count,MAX((total_cases/population))*100 AS percent_of_population_infected
FROM [Portfolio Project]..CovidDeaths22
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percent_of_population_infected DESC;


-- Looking at the countries with the highest infection rate compared to the population each day
SELECT location, population, date, MAX(total_cases) AS highest_infection_count,MAX((total_cases/population))*100 AS percent_of_population_infected
FROM [Portfolio Project]..CovidDeaths22
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY percent_of_population_infected DESC;


