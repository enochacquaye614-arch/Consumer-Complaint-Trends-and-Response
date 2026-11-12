-- Creating a database consumer_complaints_analytics
CREATE DATABASE consumer_complaints_analytics;

USE consumer_complaints_analytics;

-- Creating a table complaints
CREATE TABLE complaints (
    Complaint_ID BIGINT NOT NULL,
    Submitted_Via VARCHAR(50),
    Date_Submitted DATE,
    Date_Received DATE,
    State VARCHAR(10),
    Product VARCHAR(150),
    Sub_Product VARCHAR(255),
    Issue VARCHAR(255),
    Sub_Issue VARCHAR(255),
    Company_Public_Response TEXT,
    Company_Response_to_Consumer VARCHAR(100),
    Timely_Response VARCHAR(10),
    Date_Sequence_Check VARCHAR(20),
    Forwarding_Interval_Days INT,

    CONSTRAINT pk_complaints PRIMARY KEY (Complaint_ID));
    
DESCRIBE complaints;


SELECT COUNT(*) AS Total_Records
FROM complaints;

SELECT
    COUNT(DISTINCT Complaint_ID) AS Unique_Complaint_IDs,
    COUNT(*) - COUNT(DISTINCT Complaint_ID) AS Duplicate_IDs
FROM complaints;

-- Checking for missing values
SELECT
    SUM(Sub_Product IS NULL OR TRIM(Sub_Product) = '') AS Missing_Sub_Product,
    SUM(Sub_Issue IS NULL OR TRIM(Sub_Issue) = '') AS Missing_Sub_Issue,
    SUM(Company_Public_Response IS NULL OR TRIM(Company_Public_Response) = '') AS Missing_Public_Response,
    SUM(Timely_Response IS NULL OR TRIM(Timely_Response) = '') AS Missing_Timely_Response
FROM complaints;

-- Checking for dates
SELECT
    SUM(Date_Submitted IS NULL) AS Missing_Submission_Dates,
    SUM(Date_Received IS NULL) AS Missing_Received_Dates,
    SUM(Date_Received < Date_Submitted) AS Invalid_Date_Sequences,
    MIN(Date_Submitted) AS Earliest_Submission,
    MAX(Date_Submitted) AS Latest_Submission
FROM complaints;

-- checking for forwarding interval
SELECT
    COUNT(*) AS Total_Records,
    SUM(
        Forwarding_Interval_Days <>
        DATEDIFF(Date_Received, Date_Submitted)
    ) AS Interval_Mismatches,
    MIN(Forwarding_Interval_Days) AS Minimum_Interval,
    MAX(Forwarding_Interval_Days) AS Maximum_Interval,
    AVG(Forwarding_Interval_Days) AS Average_Interval
FROM complaints;

-- Validating response categories
SELECT
    Company_Response_to_Consumer,
    COUNT(*) AS Complaint_Count
FROM complaints
GROUP BY Company_Response_to_Consumer
ORDER BY Complaint_Count DESC;

-- Validating the timely response classifications
SELECT Timely_Response, COUNT(*) AS Complaint_Count
FROM complaints
GROUP BY Timely_Response
ORDER BY Timely_Response;

SELECT
    COUNT(*) AS Total_Complaints,
    COUNT(DISTINCT Complaint_ID) AS Unique_Complaints,
    COUNT(DISTINCT Product) AS Distinct_Products,
    COUNT(DISTINCT State) AS Distinct_States
FROM complaints;

SELECT COUNT(DISTINCT Sub_Issue) AS Distinct_Sub_Issues
FROM complaints;