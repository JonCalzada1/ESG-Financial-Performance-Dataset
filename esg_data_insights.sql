-- ESG & FINANCIAL PERFORMANCE ANALYSIS
-- SQL SCRIPT FOR CLEANING, INSIGHTS, AND AGGREGATION
-- Author: Jon Calzada Elorriaga

-- 1. Checking numeric column lengths (data consistency)
-- Example: Revenue
SELECT "Revenue", LENGTH("Revenue"::TEXT)
FROM esg_financial_data;

-- Repeat above for other columns as needed.
------------------------------------------------------------

-- 2. Averages for ESG scores
-- Across all records
SELECT
  ROUND(AVG("ESG_Overall"), 1) AS avg_ESG_overall,
  ROUND(AVG("ESG_Environmental"), 1) AS avg_ESG_environmental,
  ROUND(AVG("ESG_Social"), 1) AS avg_ESG_social,
  ROUND(AVG("ESG_Governance"), 1) AS avg_ESG_governance
FROM esg_financial_data;
------------------------------------------------------------

-- 3. Environmental resource usage averages
-- Includes emissions, water, and energy
SELECT
  ROUND(AVG("CarbonEmissions"), 1) AS avg_carbon_emissions,
  ROUND(AVG("WaterUsage"), 1) AS avg_water_usage,
  ROUND(AVG("EnergyConsumption"), 1) AS avg_energy_consumption
FROM esg_financial_data;
------------------------------------------------------------

-- 4. ESG by region and year (10-year range)
SELECT 
  "Region", "Year",
  ROUND(AVG("ESG_Overall"), 1) AS avg_ESG_overall,
  ROUND(AVG("ESG_Environmental"), 1) AS avg_ESG_environmental,
  ROUND(AVG("ESG_Social"), 1) AS avg_ESG_social,
  ROUND(AVG("ESG_Governance"), 1) AS avg_ESG_governance
FROM esg_financial_data
GROUP BY "Region", "Year"
ORDER BY avg_ESG_overall DESC;
------------------------------------------------------------

-- 5. Environmental resource usage by region and year
-- Shows how many reported each metric
SELECT
  "Region", "Year",
  ROUND(AVG("CarbonEmissions"), 1) AS avg_carbon_emissions,
  ROUND(AVG("WaterUsage"), 1) AS avg_water_usage,
  ROUND(AVG("EnergyConsumption"), 1) AS avg_energy_consumption,
  COUNT("CarbonEmissions") AS carbon_entries,
  COUNT("WaterUsage") AS water_entries,
  COUNT("EnergyConsumption") AS energy_entries
FROM esg_financial_data
GROUP BY "Region", "Year"
ORDER BY avg_carbon_emissions DESC;
------------------------------------------------------------

-- 6. Financial averages by region
SELECT
  "Region",
  ROUND(AVG("Revenue"), 1) AS avg_revenue,
  ROUND(AVG("ProfitMargin"), 1) AS avg_profit_margin,
  ROUND(AVG("MarketCap"), 1) AS avg_market_cap,
  ROUND(AVG("GrowthRate"), 1) AS avg_growth_rate
FROM esg_financial_data
GROUP BY "Region";
------------------------------------------------------------

-- 7. Financial averages by industry
SELECT
  "Industry",
  ROUND(AVG("Revenue"), 1) AS avg_revenue,
  ROUND(AVG("ProfitMargin"), 1) AS avg_profit_margin,
  ROUND(AVG("MarketCap"), 1) AS avg_market_cap,
  ROUND(AVG("GrowthRate"), 1) AS avg_growth_rate
FROM esg_financial_data
GROUP BY "Industry";
------------------------------------------------------------

-- 8. ESG scores by industry
SELECT
  "Industry",
  ROUND(AVG("ESG_Overall"), 1) AS avg_ESG_overall,
  ROUND(AVG("ESG_Environmental"), 1) AS avg_ESG_environmental,
  ROUND(AVG("ESG_Social"), 1) AS avg_ESG_social,
  ROUND(AVG("ESG_Governance"), 1) AS avg_ESG_governance
FROM esg_financial_data
GROUP BY "Industry";
------------------------------------------------------------

-- 9. Environmental impact by industry
SELECT
  "Industry",
  ROUND(AVG("CarbonEmissions"), 1) AS avg_carbon_emissions,
  ROUND(AVG("WaterUsage"), 1) AS avg_water_usage,
  ROUND(AVG("EnergyConsumption"), 1) AS avg_energy_consumption
FROM esg_financial_data
GROUP BY "Industry";
