-- Clicks do not exceed impressions, and conversions do not exceed clicks, where the dataset's definitions make these comparisons valid.
SELECT *
FROM marketing_campaigns
WHERE clicks > impressions
   OR conversions > clicks;

-- Check possible duplicate campaign-date combinations
SELECT
    campaign_date,
    campaign,
    channel,
    COUNT(*) AS row_count
FROM marketing_campaigns
GROUP BY campaign_date, campaign, channel
HAVING COUNT(*) > 1
ORDER BY row_count DESC;

-- inspect duplicate rows
SELECT *
FROM marketing_campaigns
WHERE (campaign_date, campaign, channel) IN (
    SELECT
        campaign_date,
        campaign,
        channel
    FROM marketing_campaigns
    GROUP BY
        campaign_date,
        campaign,
        channel
    HAVING COUNT(*) > 1
)
ORDER BY campaign_date, campaign, channel;

-- check for missing values
SELECT
    COUNT(*) FILTER (
        WHERE campaign_date IS NULL
    ) AS missing_dates,

    COUNT(*) FILTER (
        WHERE campaign IS NULL
    ) AS missing_campaigns,

    COUNT(*) FILTER (
        WHERE channel IS NULL
    ) AS missing_channels,

    COUNT(*) FILTER (
        WHERE impressions IS NULL
    ) AS missing_impressions,

    COUNT(*) FILTER (
        WHERE clicks IS NULL
    ) AS missing_clicks,

    COUNT(*) FILTER (
        WHERE spend IS NULL
    ) AS missing_spend,

    COUNT(*) FILTER (
        WHERE conversions IS NULL
    ) AS missing_conversions,

    COUNT(*) FILTER (
        WHERE revenue IS NULL
    ) AS missing_revenue
FROM marketing_campaigns;

-- Dataset summary
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT campaign) AS unique_campaigns,
    COUNT(DISTINCT channel) AS unique_channels,
    MIN(campaign_date) AS first_date,
    MAX(campaign_date) AS last_date,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM marketing_campaigns;
