SELECT *
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent is not null

--Looking at Total Cases vs Total Deaths

Select location, date, total_cases,total_deaths, 
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS Deathpercentage
from PortfolioProject..covidDeaths
WHERE location like 'Portugal'

--Looking at Total Cases vs Population

Select location, date, total_cases, Population, 
(CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)) * 100 AS PercentagePopulationInfected
from PortfolioProject.dbo.covidDeaths
WHERE location like '%states%'

-- Looking to Countries with Highest Infection Rate compared to Population


Select location, population, MAX(total_cases) AS HighestInfectionCount,
MAX(CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)) * 100 AS PercentagePopulationInfected
FROM PortfolioProject..covidDeaths
Group By location, population
Order By PercentagePopulationInfected desc

-- Showing Countries wit Highest Death Count per Population

SELECT location, MAX(cast(total_deaths as int)) As TotalDeathCount
FROM PortfolioProject.dbo.covidDeaths
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount desc

-- Showing continents with the highest death count per population

SELECT continent, MAX(cast(total_deaths as int)) As TotalDeathCount
FROM PortfolioProject.dbo.covidDeaths
GROUP BY continent
ORDER BY TotalDeathCount desc

--Loking Total Population vs Vaccionations


SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject.dbo.covidDeaths as dea
JOIN PortfolioProject.dbo.CovidVaccinations as vac
	ON dea.location =vac.location
	and dea.date = vac.date






