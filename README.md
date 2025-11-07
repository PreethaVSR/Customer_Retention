# CRM Analysis for Customer Retention

## 1. Project Overview
The goal of this project is to analyze CRM data to understand the key factors influencing customer retention and churn. By identifying these drivers, the company can implement data-driven strategies to improve loyalty, reduce churn, and boost profitability.

## 2. Data Preprocessing
- Cleaned missing and inconsistent values in Total Charges.
- Encoded categorical values to numerical.
- Engineered features: Average Tenure, Overall Churn rate, Revenue Loss.

## 3. Exploratory Data Analysis (EDA)
**Key Insights:**
- Overall churn rate: **26%**
- Short-tenure customers (<12 months) are more likely to churn.
- Month-to-month contract customers show highest churn.
- Higher monthly charges increase churn probability.

## 4. Feature Importance
**Top Factors Affecting Retention:**
- Tenure
- Monthly Charges
- Contract Type
- Payment Method
- Online Security/Tech Support services

## 5. Model Development
- Tested multiple models: Logistic Regression and Random Forest.

## 6. Performance Summary
- **Logistic Regression:** 78% accuracy
- **Random Forest:** 80% accuracy

## 7. Key Findings
Top predictors of churn:
- **Tenure:** Shorter tenure increases risk.
- **Monthly Charges:** Higher charges = higher churn risk.
- **Contract Type:** Month-to-month contracts churn most.
- **Payment Method:** Electronic check users churn more.
- **Services:** Lacking Online Security/Tech Support increases churn risk.

## 8. Insights and Recommendations
- Offer early loyalty discounts for new customers.
- Provide flexible billing options.
- Encourage customers to sign long-term contracts.

## 9. Conclusion
The CRM analysis revealed that contract type, tenure, and monthly charges are the key factors driving churn. By focusing on long-term contracts, pricing optimization, and better customer support, the company can significantly improve retention rates and overall profitability.
