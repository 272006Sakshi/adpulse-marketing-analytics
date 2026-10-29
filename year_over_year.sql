-- compare 2025 versus 2026 by channel

SELECT
    EXTRACT(YEAR FROM campaign_date)::int AS campaign_year,
    channel,
    SUM(spend) AS total_spend,
    SUM(revenue) AS total_revenue,
    SUM(conversions) AS total_conversions,
    ROUND(
        SUM(revenue) / NULLIF(SUM(spend), 0),
        2
    ) AS roas
FROM marketing_campaigns
GROUP BY
    EXTRACT(YEAR FROM campaign_date)::int,
    channel
ORDER BY campaign_year, roas DESC;
