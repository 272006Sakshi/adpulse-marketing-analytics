# AdPulse — Marketing Campaign Performance Analytics

An end-to-end marketing analytics project using **PostgreSQL** to evaluate digital marketing campaigns, compare channel performance, monitor monthly trends, and derive data-driven business recommendations. A Power BI dashboard will be added as the next phase.

## Project Overview

Marketing teams invest in multiple digital channels, but allocating budgets effectively requires understanding how each channel performs in terms of engagement, conversions, cost, and attributed revenue.

This project analyses a synthetic marketing campaign dataset to answer questions such as:

- Which marketing channels generate the highest attributed revenue?
- Which channels deliver the strongest Return on Ad Spend (ROAS)?
- How do Click-Through Rate (CTR), conversion rate, Cost Per Click (CPC), and Cost Per Acquisition (CPA) vary by channel?
- How does channel performance change month over month?
- How did reported channel performance differ between 2025 and 2026?
- Which channels require further investigation or optimization?

## Tools and Technologies

- **PostgreSQL:** Data validation, aggregation, KPI calculations, and trend analysis
- **SQL:** `GROUP BY`, aggregate functions, `CASE`/conditional logic, `DATE_TRUNC`, `EXTRACT`, CTEs, and safe division with `NULLIF`

## Dataset

Source: [Dataset — Marketing Campaigns](https://exploremydata.com/datasets/marketing-campaigns)

The dataset contains 1,000 rows spanning January 2025 through December 2026.

| Attribute | Description |
|---|---|
| Records | 1,000 |
| Unique campaigns | 12 |
| Marketing channels | 6 |
| Date range | 2025-01-01 to 2026-12-31 |
| Currency | USD |
| Data type | Synthetic marketing data |

### Dataset columns

- `campaign_date`: Date of the campaign record
- `campaign`: Campaign name
- `channel`: Digital marketing channel
- `impressions`: Number of impressions
- `clicks`: Number of clicks
- `spend`: Advertising spend in USD
- `conversions`: Number of attributed conversions
- `revenue`: Attributed revenue in USD

**Data limitation:** The dataset is synthetic and should not be interpreted as evidence of real-world marketing performance. The 2026 data includes dates later than the current date, so annual comparisons should be treated as comparisons of generated records, not completed-year business results.

## Project Workflow

1. **Data preparation:** Imported the CSV into PostgreSQL and created a typed table.
2. **Data quality checks:** Checked funnel consistency, missing values, and repeated campaign-date-channel combinations.
3. **Dataset profiling:** Evaluated row counts, unique campaigns and channels, date coverage, spend, and revenue.
4. **KPI analysis:** Calculated CTR, conversion rate, CPC, CPA, and ROAS.
5. **Channel comparison:** Compared engagement, conversions, cost efficiency, and attributed revenue across channels.
6. **Trend analysis:** Evaluated monthly ROAS by channel and compared 2025 with 2026.
7. **Business recommendations:** Identified channels and metrics that warrant further investigation.
8. **Power BI reporting:** Planned next phase for an interactive marketing performance dashboard.

## Key Metrics

| Metric | Formula |
|---|---|
| CTR | Clicks / Impressions × 100 |
| Conversion Rate | Conversions / Clicks × 100 |
| CPC | Advertising Spend / Clicks |
| CPA | Advertising Spend / Conversions |
| ROAS | Attributed Revenue / Advertising Spend |

ROAS measures attributed revenue per unit of advertising spend. It is **not the same as profit or ROI** because product costs and other business expenses are not included.

## Preliminary Findings

Based on the current SQL analysis:

- **Email** has the highest reported ROAS, at approximately 785.52x, and the highest CTR and conversion rate among the six channels.
- **Affiliate** has a reported ROAS of approximately 23.81x and a CPA of $4.38.
- **Paid Search** generates the highest total spend and substantial attributed revenue, with a reported ROAS of approximately 21.74x.
- **Paid Social** has a reported ROAS of approximately 3.36x.
- **Video** has a reported ROAS of approximately 1.46x and a comparatively high CPA.
- **Display** has the lowest reported ROAS, approximately 0.66x, meaning attributed revenue is below advertising spend.

These are preliminary findings from synthetic data. The exceptionally high Email ROAS should be validated against the dataset's generation and attribution assumptions. Channel performance alone does not establish profitability.

### Data quality observations

- No rows were returned by the checks for clicks exceeding impressions or conversions exceeding clicks.
- No missing values were found in the checked columns.
- Four repeated `campaign_date + campaign + channel` combinations were identified. Their associated metric values differed, so they require investigation rather than automatic deletion.



Note: This project used synthetic data, so the findings are descriptive and should not be treated as verified results from a real marketing business.
