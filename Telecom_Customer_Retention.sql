create database Telecom;
use Telecom;
select * from telco_customer_churn;
select * from telco_customer_churn where customerID='7590-VHVEG';
-- 1. Count total customers
select distinct count(customerID) from telco_customer_churn;
-- 2. Count churned customers
select count(*) as churned_customer from telco_customer_churn where churn='yes';
select count(*) from telco_customer_churn where churn='No';
-- 3. Retrieve customers by contract type
select * from telco_customer_churn where contract in (select distinct(contract) from telco_customer_churn) order by  contract asc;
-- 4. Calculate overall churn rate
select 100*sum((case when churn='yes' then 1 else 0 end))/count(*) as churn_rate_percent from telco_customer_churn;
-- 5. Find average monthly charges for churned customers
select format(avg(monthlycharges),2) as avg_monthly_charges,churn from telco_customer_churn where churn='Yes';
-- 6. Distribution of churn by contract type
select count(customerid),contract,churn from telco_customer_churn where churn='Yes' group by contract ;
-- 7.Identify customers with high monthly charges and low tenure
select * from telco_customer_churn where monthlycharges > (select avg(monthlycharges) from telco_customer_churn)
 and tenure < (select avg(tenure) from telco_customer_churn);
select tenure,monthlycharges from telco_customer_churn where monthlycharges > (select avg(monthlycharges) from telco_customer_churn) 
and tenure < (select avg(tenure) from telco_customer_churn) group by tenure,monthlycharges order by tenure desc;

-- 8. Churn by internet service type
-- FIber optic internet service is high
select count(customerid),internetservice from telco_customer_churn where churn='Yes' group by internetservice ;
-- 9.Most common payment method among churned customers
-- electronic check payment method is high
select count(customerid),paymentmethod from telco_customer_churn where churn='Yes' group by paymentmethod ;
-- 10. Revenue loss due to churn
SELECT format(SUM(monthlycharges),2) AS revenue_loss from telco_customer_churn where churn='Yes';
-- 11. Compare average monthly charges of churned vs. non-churned customers
select format(avg(monthlycharges),2),churn from telco_customer_churn group by churn;
-- 12.Create tenure groups and calculate churn rate per group
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 6 THEN '0-6 months'
        WHEN tenure BETWEEN 7 AND 12 THEN '7-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
        ELSE '36+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM
    telco_customer_churn GROUP By tenure_group ORDER BY  MIN(tenure);
    
    -- 13. Identify customer profiles with the highest churn rate
-- Female optic has high Churn Rate 
select gender,count(*) as total_customers, sum(case when churn='Yes' then 1 else 0 end) as churned_customers,
100*sum(case when churn='Yes' then 1 else 0 end)/count(*) as churn_rate_percent from telco_customer_churn group by gender ;
-- Fiber optic(internetservice) has high Churn Rate
  select internetservice,count(*) as total_customers, sum(case when churn='Yes' then 1 else 0 end) as churned_customers,
100*sum(case when churn='Yes' then 1 else 0 end)/count(*) as churn_rate_percent from telco_customer_churn group by internetservice ; 
-- Month-Month(contract) has high Churn Rate
  select contract,count(*) as total_customers, sum(case when churn='Yes' then 1 else 0 end) as churned_customers,
100*sum(case when churn='Yes' then 1 else 0 end)/count(*) as churn_rate_percent from telco_customer_churn group by contract ; 
-- ELectronic check(paymentmethod) has high Churn Rate
  select paymentmethod,count(*) as total_customers, sum(case when churn='Yes' then 1 else 0 end) as churned_customers,
100*sum(case when churn='Yes' then 1 else 0 end)/count(*) as churn_rate_percent from telco_customer_churn group by paymentmethod ;
-- 14. Find top 5 most valuable loyal (non-churned) customers
select * from telco_customer_churn where churn='No' order by totalcharges desc limit 5;
-- 15. Compare churn rates between senior citizens and non-senior citizens
-- seniorcitizen has high churn rate but no.of senior citizen is low
select (case when seniorcitizen=0 then 'non-seniorcitizen' else 'seniorcitizen' end) as citizen_type,count(*) as total_customers, 
sum(case when churn='Yes' then 1 else 0 end) as churned_customers,
100*sum(case when churn='Yes' then 1 else 0 end)/count(*) as churn_rate_percent from telco_customer_churn group by seniorcitizen ;


