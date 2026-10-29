-- overall data profile
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT campaign) AS unique_campaigns,
    COUNT(DISTINCT channel) AS unique_channels,
    MIN(campaign_date) AS first_date,
    MAX(campaign_date) AS last_date,
    SUM(spend) AS total_spend,
    SUM(revenue) AS total_revenue
FROM marketing_campaigns;

-- Overall marketing performance
SELECT
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(spend) AS total_spend,
    SUM(conversions) AS total_conversions,
    SUM(revenue) AS total_revenue,
    ROUND(
        100.0 * SUM(clicks)
        / NULLIF(SUM(impressions), 0), 2
    ) AS ctr_pct,
    ROUND(
        SUM(spend) / NULLIF(SUM(clicks), 0), 2
    ) AS cpc,
    ROUND(
        SUM(spend) / NULLIF(SUM(conversions), 0), 2
    ) AS cpa,
    ROUND(
        SUM(revenue) / NULLIF(SUM(spend), 0), 2
    ) AS roas,
    ROUND(
    100.0 * SUM(conversions)
    / NULLIF(SUM(clicks), 0),
    2
) AS conversion_rate_pct
FROM marketing_campaigns;   

