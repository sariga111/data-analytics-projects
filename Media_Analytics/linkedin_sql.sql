use sys;
SELECT * FROM sys.linkedin_data;

SELECT
    COUNT(*) AS TotalPosts,
    SUM(Views) AS TotalViews,
    SUM(Followers) AS TotalFollowers,
    SUM(Reposts) AS TotalReposts,
    SUM(Reactions) AS TotalReactions,
    SUM(Comments) AS TotalComments
FROM
    sys.linkedin_data;

         --  POST ENGAGEMENT TREND (yearly total engagement rate)
SELECT 
    YEAR(PostDate) AS year,
   round(SUM(EngagementRate),2) AS total_engagement_rate
FROM 
    sys.linkedin_data
GROUP BY 
    YEAR(PostDate)
ORDER BY 
    year;
    
        -- POST PERFORMANCE BY TOPIC
SELECT
    PostTopic AS `Topic`,
    SUM(Reactions) AS `Total Reactions`,
    SUM(Views) AS `Total Views`,
    SUM(Reactions + Views) AS `Performance Score`
FROM
    sys.linkedin_data
GROUP BY
    PostTopic
ORDER BY
    `Performance Score` DESC;
    
      -- TOP 5 MOST ENGAGING POST
   SELECT 
    PostDescription,
    PostTopic,
    PostDate,
    ROUND(SUM(EngagementRate), 2) AS total_engagement_rate
FROM
     sys.linkedin_data
GROUP BY
    PostDescription,
    PostTopic,
    PostDate
ORDER BY
    total_engagement_rate DESC
LIMIT 5;

         -- BEST DAY TO POST
SELECT 
    DAYNAME(PostDate) AS day_of_week,
    SUM(Reactions) AS total_reactions,
    SUM(Comments) AS total_comments,
    SUM(Reactions + Comments) AS total_engagement
FROM 
    sys.linkedin_data
GROUP BY 
    day_of_week
ORDER BY 
    total_engagement DESC;
    
         -- FOLLOWERS BY DAY OF WEEK
SELECT 
    DayOfWeek,
    SUM(Followers) AS TotalFollowers
FROM
    sys.linkedin_data
GROUP BY
DayOfWeek
ORDER BY
  DayOfWeek;
  
      -- FOLLOWERS BY POST TOPIC
  SELECT
    PostTopic,
    SUM(Followers) AS TotalFollowers
FROM
     sys.linkedin_data
GROUP BY
    PostTopic
ORDER BY
    TotalFollowers DESC;
    
      -- TOTAL REPOSTS BY POST TOPIC
SELECT 
    PostTopic,
    SUM(Reposts) AS TotalReposts
FROM
    sys.linkedin_data
GROUP BY
    PostTopic
ORDER BY
    TotalReposts DESC;





