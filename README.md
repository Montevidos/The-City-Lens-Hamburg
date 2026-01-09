# The City Lens: Hamburg — Smart City Analytics

https://public.tableau.com/app/profile/kiien.kyonh.do/viz/hamburg_city/Dashboard15
The City Lens: Hamburg is a data analytics project that transforms raw public data into actionable insights about sustainability, environment, mobility, and safety across Hamburg’s districts and neighborhoods.

The goal is to build a unified analytical layer that allows citizens, analysts, and city planners to explore how Hamburg performs across key urban dimensions such as green space availability, air quality, energy efficiency, and public safety.

## Project Purpose

Hamburg provides rich open data, but it is fragmented across multiple portals and formats.
This project integrates these datasets into a clean, consistent, analytics-friendly data model using dbt, enabling:
	•	cross-domain comparison of districts
	•	sustainability assessment
	•	population-normalized metrics
	•	visual dashboards for citizens and decision-makers


## Key Features

### Green Space Analytics
	•	Total green area per district
	•	Green area per capita
	•	Green density (km² green per km² district)
	•	Combined greenery from: cemeteries, public gardens, allotment gardens

### Air Quality Monitoring
	•	Hourly and daily air pollution indicators (Open-Meteo API)
	•	Comparison to health guidelines
	•	District-level exposure trends

### Energy Insights
	•	Energy production and consumption
	•	Renewable vs. non-renewable energy mix
	•	Feed-in data and monthly patterns

### Safety & Crime
	•	Crimes per 100,000 residents
	•	Clearance rates
	•	Multi-year crime trends by district


## Data Sources

	•	Green Plan datasets
https://metaver.de/trefferanzeige?docuuid=63A9A629-C051-4876-B18B-C535016F0B8A

	•	Air Quality (Open-Meteo API)
https://open-meteo.com/

	•	Energy Statistics (Statistik Nord)
https://www.statistik-nord.de/zahlen-fakten/umwelt-energie/monatszahlen-умwelt

	•	Traffic (planned)
https://metaver.de/trefferanzeige?docuuid=DAB0CA11-1E2A-4EA6-BEB3-E8DA5DF72E6D

	•	District Boundaries
https://metaver.de/trefferanzeige?docuuid=F35EAC11-C236-429F-B1BF-751C0C18E8B7

	•	Population Data
https://www.statistik-nord.de

	•	Administrative District List
https://de.wikipedia.org/wiki/Liste_der_Bezirke_und_Stadtteile_Hamburgs


## Tech Stack
	•	dbt — transformations, testing, data modeling
	•	PostgreSQL — analytical storage
	•	Python — API ingestion, scraping, data extraction
	•	Open Data APIs & CSVs — raw input sources


## Project Structure

/dbt

-/models
  
--/staging      → cleaned raw data
	
--/prep         → normalized keys & integrated datasets
	
--/mart         → analytical tables for dashboard
	
/scripts          → data extraction & API calls

/data             → downloaded datasets




## Example Metrics
	•	Green area per capita
	•	Percent of district covered by parks
	•	AQI (air quality index)
	•	Crime per 100,000 residents
	•	Energy consumption per household
	•	Renewable energy ratio
	

## Author

Ayesha Batool 

Kiien Kyonh Do 
