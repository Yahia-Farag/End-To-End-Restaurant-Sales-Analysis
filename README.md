# 🍽️ Restaurant Sales Analytics & Data Cleaning Project

A professional, end-to-end data auditing, cleaning, and business intelligence project using **T-SQL (SQL Server)** and **Power BI** to transform raw transactional data into actionable insights.

---

## 📌 Project Overview
Restaurant operations generate large volumes of sales data that often suffer from missing values, structural inconsistencies, and anomalies. This project executes a rigorous T-SQL data cleaning and logical imputation pipeline, followed by an advanced Power BI analytical dashboard to uncover critical business metrics such as revenue trends, category performance, and customer orders[cite: 13, 14].

---

## 🔍 Key Data Cleaning Steps (T-SQL Implementation)

1. **Data Exploration & Overview:**
   - Audited initial record counts and previewed transactional structures to establish a reliable baseline[cite: 14].

2. **Data Quality & Missing Values Check:**
   - Utilized conditional aggregation to detect and compute missing (NULL) values across key metrics like `Item`, `Price`, `Quantity`, `Order_Total`, and `Payment_Method`[cite: 14].

3. **Duplicates & Anomalies Check:**
   - Verified transaction uniqueness by checking duplicate `Order_IDs` and executed data sanity checks to ensure no illogical negative values existed in `Quantity` or `Price`[cite: 14].

4. **Cleaning & Handling Missing Data:**
   - Identified and permanently deleted completely empty records containing no valid transaction data[cite: 14].
   - Performed mathematical imputations for missing prices by dividing `Order_Total` by `Quantity` safely without division-by-zero errors[cite: 14].

5. **Statistical Checks & Logical Imputation:**
   - Calculated financial summary statistics (`MAX`, `MIN`, `AVG`) to analyze bill costs[cite: 14].
   - Logically imputed missing item names (e.g., identifying and setting missing items to 'Water' where the price, quantity, and category uniquely matched)[cite: 14].

6. **Operational & System Health Check:**
   - Analyzed the distribution of missing payment methods over order dates to detect potential system or UI downtime[cite: 14].

---

## 📊 Power BI Dashboard Highlights
The cleaned dataset was successfully modeled and visualized into an interactive executive dashboard (`Restaurant Sales Analytics.png`) featuring:
- **Core KPIs:** Total Revenue (340.6K), Total Orders (17.1K), Total Customers (100), Total Qty Sold (51.6K), Total Categories (5), and Avg Order Value (19.91)[cite: 13].
- **Category & Item Performance:** Detailed breakdown showing Main Dishes leading revenue generation, alongside top-performing items like Grilled Chicken, Pasta Alfredo, and Steak[cite: 13].
- **Temporal Trends:** Monthly revenue trajectory (January to December) and day-of-week revenue distributions[cite: 13].

---

## 🛠️ Technologies Used
- **SQL Server (T-SQL):** Data exploration, missing value imputation, data cleaning scripts, and integrity validation.
- **Power BI:** Data visualization, interactive filtering, and business intelligence reporting.
- **Git & GitHub:** Version control and professional portfolio documentation.

---

## 🚀 How to Use
1. Clone or download this repository.
2. Import `Restaurant_Sales_Before_Cleaning.csv` into your SQL Server database (`Restaurant_Sales`)[cite: 14].
3. Run the `Restaurant_Sales_Cleaned.sql` script sequentially to execute the full data auditing and cleaning pipeline[cite: 14].
