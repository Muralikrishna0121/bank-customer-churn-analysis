CREATE DATABASE bank_churn_analysis;
USE bank_churn_analysis;
CREATE TABLE churn (
    RowNumber INT,
    CustomerId BIGINT,
    Surname VARCHAR(100),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary DECIMAL(15,2),
    Exited INT
);
SELECT COUNT(*) AS Total_Customers
FROM churn;

SELECT SUM(Exited) AS Churn_Customers
FROM churn;

SELECT
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churn_Customers,
    ROUND((SUM(Exited) * 100.0) / COUNT(*), 2) AS Churn_Rate_Percentage
FROM churn;

SELECT
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churn_Customers
FROM churn
GROUP BY Geography
ORDER BY Churn_Customers DESC;

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churn_Customers
FROM churn
GROUP BY Gender;

SELECT
    Geography,
    ROUND(AVG(Balance),2) AS Average_Balance
FROM churn
GROUP BY Geography
ORDER BY Average_Balance DESC;

SELECT
    IsActiveMember,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churn_Customers
FROM churn
GROUP BY IsActiveMember;

SELECT
    HasCrCard,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churn_Customers
FROM churn
GROUP BY HasCrCard;

SELECT
    Exited,
    ROUND(AVG(CreditScore),2) AS Average_CreditScore
FROM churn
GROUP BY Exited;

SELECT
    CustomerId,
    Geography,
    Balance,
    EstimatedSalary,
    Exited
FROM churn
ORDER BY Balance DESC
LIMIT 10;