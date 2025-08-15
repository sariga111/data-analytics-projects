create database fb;
use fb;
SELECT * FROM fb.`facebook data`;

SELECT 
  SUM(`Total Impressions (Expression)`) AS Total_Impressions,
  SUM(`Total Link Clicks (Expression)`) AS Total_Clicks,
  SUM(`Total Cost (Expression)`) AS Total_Cost,
  SUM(`Total People Reached (Expression)`) AS Total_Reach
FROM `facebook data`;

 -- Monthly Reach of Ads
SELECT 
  DATE_FORMAT(`ReportDate`, '%M %Y') AS Month_Name,
  SUM(`Total People Reached (Expression)`) AS Total_Reach
FROM `facebook data`
GROUP BY Month_Name
ORDER BY STR_TO_DATE(Month_Name, '%M %Y');

 -- Top 5 Campaigns with Highest Cost
 SELECT 
  `Campaign Name`,
  SUM(`Total Cost (Expression)`) AS Total_Cost
FROM `facebook data`
GROUP BY `Campaign Name`
ORDER BY Total_Cost DESC
LIMIT 5;

  --  Social Interaction by Age Group
SELECT 
  `Age Group`,
  SUM(`Total Social Interactions (Expression)`) AS Social_Interactions
FROM `facebook data`
GROUP BY `Age Group`;

  --  Top 5 Ads Based on Website Leads
SELECT 
  `Ad Name`,
  SUM(`Total Website Leads (Expression)`) AS Website_Leads
FROM `facebook data`
GROUP BY `Ad Name`
ORDER BY Website_Leads DESC
LIMIT 5;

  -- Top 5 Ads Based on Clicks
SELECT 
  `Ad Name`,
  SUM(`Total Link Clicks (Expression)`) AS Total_Clicks
FROM `facebook data`
GROUP BY `Ad Name`
ORDER BY Total_Clicks DESC
LIMIT 5;

    -- Campaign wise performance
SELECT 
  `Campaign Name`,
  ROUND(SUM(`Cost`)) AS Total_Cost,
  SUM(`Reach`) AS Total_Reach,
  SUM(`WebsitePurchases`) AS Total_Purchases,
  SUM(`WebsiteLeads`) AS Total_Leads
FROM `facebook data`
GROUP BY `Campaign Name`
ORDER BY Total_Reach DESC;

