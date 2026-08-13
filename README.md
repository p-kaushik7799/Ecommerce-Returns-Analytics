# E-Commerce Return Prediction & Analytics

An end-to-end data analytics and machine learning project that analyzes
e-commerce order data to identify return patterns and predict the probability
that an order will be returned.

The project integrates Python, MySQL, Power BI and machine learning into a
single analytics workflow.

---

## Business Problem

Product returns create additional costs for e-commerce businesses through
reverse logistics, refunds, inventory handling and customer support.

The objective of this project is to:

- Understand historical return patterns
- Identify product, customer and geographic segments associated with higher
  return rates
- Analyze operational factors associated with returns
- Build a machine learning model to predict return risk
- Present the findings through an interactive Power BI dashboard

The prediction is designed as an early-warning mechanism rather than an
automated decision-making system.

---

## Project Objectives

1. Clean and validate raw e-commerce transaction data using Python
2. Perform exploratory data analysis to identify return patterns
3. Store and analyze the cleaned dataset using MySQL
4. Develop an interactive Power BI dashboard
5. Build and compare multiple classification models
6. Identify important predictors of return behavior
7. Translate analytical findings into business recommendations

---

## Technology Stack

| Area | Tools |
|---|---|
| Data Cleaning | Python, Pandas, NumPy |
| Exploratory Analysis | Pandas, Matplotlib, Seaborn |
| Database | MySQL |
| SQL Analysis | MySQL |
| Visualization | Power BI |
| Machine Learning | Scikit-learn |
| Documentation | Markdown |
| Version Control | Git & GitHub |

---

## Dataset

The dataset contains 1,000 e-commerce order records and includes information
about:

- Product category
- Quantity
- Price per unit
- Payment method
- Customer location
- Customer segment
- Discount
- Delivery time
- Total order value
- Return status

The dataset was cleaned and validated before being loaded into MySQL.

---

## Project Workflow

Raw Data
↓
Python Data Cleaning & Validation
↓
Clean Dataset
↓
MySQL Database
↓
SQL Business Analysis
↓
Exploratory Data Analysis
↓
Feature Engineering
↓
Machine Learning
↓
Return Probability
↓
Power BI Dashboard
↓
Business Recommendations

---

## Data Cleaning

The data preparation process included:

- Data type validation
- Missing-value analysis
- Duplicate detection
- Invalid-value detection
- Date conversion
- Numerical validation
- Handling invalid delivery-time records
- Validation of return labels
- Consistency checks between numerical fields
- Final dataset validation

The cleaned dataset was then loaded into MySQL for downstream analysis.

---

## Exploratory Data Analysis

The analysis focused on:

- Overall return rate
- Return rate by product category
- Return rate by customer location
- Return rate by customer segment
- Return rate by payment method
- Return rate by discount level
- Return rate by delivery time
- Monthly return trends
- Numerical feature distributions

---

## Key Findings

### Overall Return Rate

35.4% of orders in the dataset were returned.

### Product Category

Toys and Books showed comparatively higher return rates, while Electronics
showed a comparatively lower return rate.

### Customer Location

Pune showed the highest observed return rate, while Hyderabad showed the
lowest.

### Customer Segment

Return rates were relatively similar across New, Regular and VIP customers.

### Discount

High-discount orders showed a slightly higher return rate than low- and
medium-discount orders.

### Delivery Time

Delivery time did not show a simple monotonic relationship with return rate.

### Monthly Variation

Return rates varied considerably across months, indicating periods that may
warrant further investigation.

---

## Machine Learning

The prediction problem was formulated as a binary classification problem.

### Target

`isreturned`

### Features

- Product category
- Quantity
- Price per unit
- Payment method
- Customer location
- Customer segment
- Discount applied
- Order month

### Models Compared

- Logistic Regression
- Decision Tree
- Random Forest

### Evaluation Metrics

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC

Five-fold stratified cross-validation was used to provide a more robust
comparison of model performance.

---

## Leakage Prevention

The following variables were excluded from the predictive model:

### Order ID

Used only as an identifier.

### Order Date

Replaced by the derived `order_month` feature.

### Delivery Time

Excluded because actual delivery time is not known when a return-risk
prediction needs to be generated at order placement.

### Total Amount

Excluded because it is derived from other available transaction variables.

This ensures that the model represents a realistic pre-fulfillment prediction
scenario.

---

## Power BI Dashboard

The Power BI dashboard contains two main pages.

### Page 1 — Executive Dashboard

Provides:

- Total orders
- Returned orders
- Return rate
- Average order value
- Monthly return trend
- Return rate by category
- Return rate by location
- Return rate by customer segment

---

## Business Recommendations

Based on the analysis, an e-commerce business could:

1. Investigate high-return product categories to identify product-quality,
   expectation or product-information issues.

2. Investigate geographic differences in return rates rather than assuming
   geography itself causes returns.

3. Monitor high-discount orders to determine whether promotional strategies
   contribute to increased returns.

4. Use the ML model as an early-warning system to prioritize potentially
   high-risk orders for proactive customer support or verification.

5. Collect additional information such as return reasons, product ratings,
   customer purchase history and product-level attributes to improve future
   prediction performance.

---

## Limitations

This project has several limitations:

- The dataset contains only 1,000 records.
- The available features are relatively limited.
- Return reasons are not available.
- Product-level attributes are limited.
- Customer purchase history is not available.
- The dataset may not represent the complexity of a production e-commerce
  environment.
- Model predictions should therefore be treated as analytical estimates
  rather than production decisions.

---

## Future Improvements

Future versions could incorporate:

- Customer purchase history
- Product ratings and reviews
- Return reasons
- Product-level characteristics
- Customer lifetime value
- Historical return frequency
- Order frequency
- Delivery partner information
- Promotional campaign information
- Hyperparameter optimization
- Probability calibration
- Model monitoring

A larger production dataset could also be used to improve model robustness.

---

## Repository Structure

```text
ecommerce-return-prediction/
│
├── data/
├── notebooks/
├── sql/
├── powerbi/
├── outputs/
├── docs/
├── README.md
└── .gitignore
