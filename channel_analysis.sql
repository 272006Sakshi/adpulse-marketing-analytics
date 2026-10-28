-- compare marketing channels
SELECT
    channel,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    ROUND(SUM(spend), 2) AS total_spend,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(revenue), 2) AS total_revenue,

    ROUND(
        100.0 * SUM(clicks) / NULLIF(SUM(impressions), 0),
        2
    ) AS ctr_pct,

    ROUND(
        100.0 * SUM(conversions) / NULLIF(SUM(clicks), 0),
        2
    ) AS conversion_rate_pct,

    ROUND(
        SUM(spend) / NULLIF(SUM(clicks), 0),
        2
    ) AS cpc,

    ROUND(
        SUM(spend) / NULLIF(SUM(conversions), 0),
        2
    ) AS cpa,

    ROUND(
        SUM(revenue) / NULLIF(SUM(spend), 0),
        2
    ) AS roas

FROM marketing_campaigns
GROUP BY channel
ORDER BY roas DESC;
