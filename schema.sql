CREATE TABLE marketing_campaigns (
    campaign_date DATE,
    campaign VARCHAR(100),
    channel VARCHAR(50),
    impressions BIGINT,
    clicks BIGINT,
    spend NUMERIC(14,2),
    conversions BIGINT,
    revenue NUMERIC(14,2)
);
