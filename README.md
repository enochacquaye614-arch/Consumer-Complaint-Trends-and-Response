# Consumer Complaint Monitoring and Response Dashboard

## Project Overview

The **Consumer Complaint Monitoring and Response Dashboard** is a data analytics project designed to analyse consumer complaints submitted through the Consumer Financial Protection Bureau (CFPB).

The project examines complaint trends, financial products, consumer issues, company response classifications, response timeliness, recorded relief outcomes, and complaint-forwarding intervals.

Using Microsoft Excel, MySQL and Power BI, the project transforms raw complaint records into an interactive business intelligence solution that supports data-driven monitoring and operational decision-making.

**Reporting Period:** 1 May 2017 – 28 August 2023  
**Total Records Analysed:** 62,516  
**Organisation:** Bank of America  
**Data Source:** Consumer Financial Protection Bureau (CFPB) complaint dataset

## Business Objectives

The primary objectives of this project were to:

- Analyse consumer complaint trends over time.
- Identify financial products generating the highest complaint volumes.
- Examine recurring consumer issues and product-issue relationships.
- Evaluate recorded company response outcomes.
- Measure response timeliness using valid classifications.
- Analyse complaints associated with monetary and non-monetary relief.
- Examine the time between CFPB receipt and forwarding of complaints to the company.
- Develop an interactive dashboard to support management monitoring and further investigation.

## Tools and Technologies

| Tool | Purpose |
| --- | --- |
| Microsoft Excel | Data inspection, cleaning, transformation and initial validation |
| MySQL Workbench 8.0 | Database creation, data storage, SQL queries and validation |
| SQL | Data exploration, aggregation and KPI verification |
| Microsoft Power BI Desktop | Data modelling, DAX calculations and dashboard development |
| DAX | Business metrics and analytical calculations |

## Dataset Description

The dataset contains 62,516 consumer complaint records and 12 original fields.

Key fields include:

- Complaint ID
- Submitted Via
- Date Submitted
- Date Received
- State
- Product
- Sub-product
- Issue
- Sub-issue
- Company Public Response
- Company Response to Consumer
- Timely Response

Two additional analytical fields were created:

- `Date_Sequence_Check`
- `Forwarding_Interval_Days`

The original dataset was preserved, and transformations were performed on a separate working copy.

## Project Methodology

The project followed a structured data analytics workflow.

### 1. Data Inspection and Quality Assessment

- Examined dataset structure and field definitions.
- Checked missing values across relevant columns.
- Investigated duplicate complaint IDs.
- Validated date fields and chronological sequences.
- Inspected categorical values and response classifications.
- Identified potential data-quality concerns.

### 2. Data Cleaning and Transformation

- Created a separate working copy of the original dataset.
- Standardised column names.
- Validated complaint identifiers.
- Converted date fields into appropriate date formats.
- Checked text fields for unnecessary whitespace.
- Created a date-sequence validation field.
- Calculated CFPB forwarding intervals in days.
- Preserved meaningful missing values rather than automatically replacing them.

### 3. Database Development

Created a MySQL database named:

`consumer_complaints`

Created the `complaints` table with appropriate data types and a primary key on `Complaint_ID`.

SQL was used to validate:

- Total records.
- Unique and duplicate complaint IDs.
- Missing-value patterns.
- Date integrity.
- Forwarding interval calculations.
- Product and issue categories.
- Response classifications.

### 4. Power BI Data Modelling

Connected Power BI Desktop to the MySQL database.

Created a date dimension table (`Date`) and established an active one-to-many relationship between:

`_Date[Date]` → `complaints[Date_Submitted]`

Created DAX measures for complaint volumes, response outcomes, response timeliness, relief classifications and forwarding intervals.

A dedicated `KPI Measures` table was created to organise the analytical measures.

### 5. Dashboard Development

Developed a four-page interactive Power BI dashboard using a consistent corporate-inspired visual theme.

## Dashboard Pages

### Page 1 — Executive Complaint Overview

Provides a high-level summary of complaint activity.

Key metrics and visuals:

- Total complaints.
- Closed complaints.
- In-progress complaints.
- Timely response rate.
- Monetary relief rate.
- Average forwarding interval.
- Monthly complaint trends.
- Complaints by financial product.
- Recorded complaint response outcomes.

### Page 2 — Product & Issue Analysis

Examines complaint concentration across financial products and consumer issues.

Key visuals:

- Total distinct products.
- Total distinct issues.
- Total distinct sub-products.
- Total distinct sub-issues.
- Complaints by financial product.
- Top 10 complaint issues.
- Complaints by sub-products
- Product and issue detail table

### Page 3 — Company Response Analysis

Evaluates recorded company response classifications and response timeliness.

Key metrics and visuals:

- Timely response rate.
- Untimely response rate.
- In-progress complaints.
- Closed with explanation.
- Closed with monetary relief.
- Closed with non-monetary relief.
- Complaint outcomes by response category.
- Timely versus untimely response distribution.
- Recorded resolution categories.

### Page 4 — Complaint Timeline Analysis

Examines complaint activity over time and CFPB forwarding intervals.

Key metrics and visuals:

- Average forwarding interval.
- Median forwarding interval.
- Maximum forwarding interval.
- Same-day forwarding rate.
- Monthly complaint trend.
- CFPB complaint-forwarding interval distribution.

Interactive slicers allow analysis by year, financial product and state.

## Key Performance Indicators (KPIs)

| KPI | Result |
| --- | ---: |
| Total Complaints | 62,516 |
| Closed Complaints | 61,022 |
| In-Progress Complaints | 1,494 |
| Timely Responses | 58,619 |
| Untimely Responses | 2,403 |
| Timely Response Rate | 96.06% |
| Untimely Response Rate | 3.94% |
| Closed with Explanation | 41,044 |
| Closed with Monetary Relief | 14,697 |
| Closed with Non-Monetary Relief | 5,273 |
| Monetary Relief Rate | 23.51% |
| Non-Monetary Relief Rate | 8.43% |
| Average CFPB Forwarding Interval | 1.22 days |
| Median CFPB Forwarding Interval | 0 days |
| Maximum CFPB Forwarding Interval | 275 days |
| Same-Day Forwarded Complaints | 49,634 |
| Same-Day Forwarding Rate | 79.39% |

**KPI calculation notes:**

- Timely response rate = 58,619 / 61,022 × 100.
- Untimely response rate = 2,403 / 61,022 × 100.
- The timely response denominator excludes 1,494 in-progress complaints with blank timeliness classifications.
- Monetary and non-monetary relief rates use all 62,516 complaints as the denominator.
- Same-day forwarding rate = 49,634 / 62,516 × 100.

## Key Analytical Findings

1. **High recorded response timeliness:** 96.06% of complaints with valid Yes/No timeliness classifications were recorded as timely.

2. **Explanation-based closures dominate:** 41,044 complaints, approximately 65.65% of all records, were classified as closed with explanation.

3. **Recorded relief outcomes:** 19,970 complaints were associated with monetary or non-monetary relief, representing approximately 31.94% of all complaints.

4. **Most complaints were forwarded on the same day:** 49,634 complaints, approximately 79.39%, had a zero-day CFPB forwarding interval.

5. **Long forwarding intervals require further investigation:** 435 complaints exceeded 30 days, while 48 exceeded 90 days. The maximum observed interval was 275 days.

## Business Recommendations

### 1. Investigate Extended Forwarding Intervals

Review complaints with forwarding intervals exceeding 30 days to identify potential processing bottlenecks, exceptional cases or data-handling issues.

### 2. Strengthen Product and Issue Monitoring

Regularly monitor high-volume financial products and recurring complaint issues to identify areas that may require further investigation.

### 3. Improve Response Outcome Monitoring

Monitor in-progress complaints and recorded monetary and non-monetary relief outcomes to support management oversight of complaint-handling performance.

## Data Quality and Validation

The following validation activities were performed:

- Confirmed 62,516 records were imported into MySQL.
- Verified 62,516 unique complaint IDs.
- Confirmed zero duplicate complaint IDs.
- Validated submission and forwarding date fields.
- Confirmed zero invalid date sequences.
- Reconciled key missing-value patterns between Excel and MySQL.
- Validated forwarding interval calculations.
- Reconciled key company response classifications.
- Cross-checked analytical KPI calculations.
- Tested Power BI slicers and visual interactions.

**Outstanding final check:** The forwarding interval distribution visual should be reconciled against the complete 62,516 records before final submission. Its five mutually exclusive categories should total 62,516, with 49,634 in the zero-day category. Do not treat the visual as fully validated until this reconciliation passes.

## Limitations and Analytical Considerations

- A consumer complaint is not proof of misconduct, regulatory violation or wrongdoing.
- Recorded response outcomes do not independently establish customer satisfaction.
- The timely response rate excludes complaints still classified as in progress.
- CFPB forwarding intervals measure the time between CFPB receipt and forwarding to the company. They do not measure the company's response or resolution time.
- Complaint counts do not represent complaint rates among all customers because total customer or account exposure data was unavailable.
- The analysis is based on the information recorded in the supplied dataset and does not independently verify individual complaint circumstances.

## Project Deliverables

- Interactive four-page Power BI dashboard.
- Cleaned and validated complaint dataset.
- MySQL database and SQL scripts.
- KPI definitions and DAX calculations.
- Data-quality documentation.
- Dashboard screenshots.
- Evidence-based findings and business recommendations.
- Executive summary.

## Conclusion

This project demonstrates the application of data analytics and business intelligence techniques to a real-world consumer complaint monitoring scenario.

By combining Excel, MySQL and Power BI, the analysis transforms raw complaint records into structured insights that support complaint monitoring, response performance assessment and further operational investigation.

The dashboard provides a foundation for evidence-based decision-making while maintaining appropriate analytical limitations and data-quality considerations.

---

**Author:** [Enoch Tawiah Acquaye]  
**Role:** Junior Data Analyst  
**Tools:** Excel | MySQL | Power BI | DAX  
