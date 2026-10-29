-- monthly ROAS by channel
SELECT
    DATE_TRUNC('month', campaign_date)::date AS month,
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
    DATE_TRUNC('month', campaign_date)::date,
    channel
ORDER BY month, channel;
