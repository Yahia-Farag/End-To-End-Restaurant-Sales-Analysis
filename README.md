# 🍽️ Restaurant Sales Analytics & Data Cleaning Project

> **📌 Note:** Due to GitHub file size limits, the dataset file (`Restaurant_Sales_Sample.csv`) included in this repository contains a representative sample of 200 rows to ensure seamless browser preview.

A professional, end-to-end data auditing, cleaning, and business intelligence project using **T-SQL (SQL Server)** and **Power BI** to transform raw transactional data into actionable insights.

---

## 📂 Repository Structure & Project Files

This repository contains all necessary resources to run, review, and interact with the project:

* 📊 **Interactive Power BI Report:** [`Restaurant Sales Analytics.pbix`](./Restaurant%20Sales%20Analytics.pbix) *(Download & open in Power BI Desktop for full interactivity)*
* 📜 **SQL Cleaning Script:** [`Restaurant_Sales_Cleaned.sql`](./Restaurant_Sales_Cleaned.sql) *(T-SQL script for data auditing, missing value imputations, and cleaning)*
* 📂 **Sample Dataset:** [`Restaurant_Sales_Sample.csv`](./Restaurant_Sales_Sample.csv) *(Sample transactional dataset)*
* 🖼️ **Executive Dashboard:** High-resolution preview screenshot included below.

---

## 📌 Project Overview
Restaurant operations generate large volumes of sales data that often suffer from missing values, structural inconsistencies, and anomalies. This project executes a rigorous T-SQL data cleaning and logical imputation pipeline, followed by an advanced Power BI analytical dashboard to uncover critical business metrics such as revenue trends, category performance, and customer orders.

---

## 🔍 Key Data Cleaning Steps (T-SQL Implementation)

1. **Data Exploration & Overview:**
   - Audited initial record counts and previewed transactional structures to establish a reliable baseline.

2. **Data Quality & Missing Values Check:**
   - Utilized conditional aggregation to detect and compute missing (NULL) values across key metrics like `Item`, `Price`, `Quantity`, `Order_Total`, and `Payment_Method`.

3. **Duplicates & Anomalies Check:**
   - Verified transaction uniqueness by checking duplicate `Order_IDs` and executed data sanity checks to ensure no illogical negative values existed in `Quantity` or `Price`.

4. **Cleaning & Handling Missing Data:**
   - Identified and permanently deleted completely empty records containing no valid transaction data.
   - Performed mathematical imputations for missing prices by dividing `Order_Total` by `Quantity` safely without division-by-zero errors.

5. **Statistical Checks & Logical Imputation:**
   - Calculated financial summary statistics (`MAX`, `MIN`, `AVG`) to analyze bill costs.
   - Logically imputed missing item names (e.g., identifying and setting missing items to 'Water' where the price, quantity, and category uniquely matched).

6. **Operational & System Health Check:**
   - Analyzed the distribution of missing payment methods over order dates to detect potential system or UI downtime.

---

## 📊 Dashboard Preview

Below is a high-resolution snapshot of the interactive **Power BI** executive dashboard:

### 🍽️ Sales & Performance Overview
- **Core KPIs:** Total Revenue ($340.6K), Total Orders (17.1K), Total Customers (100), Total Qty Sold (51.6K), Total Categories (5), and Avg Order Value ($19.91).
- **Category & Item Performance:** Detailed breakdown showing Main Dishes leading revenue generation, alongside top-performing items like Grilled Chicken, Pasta Alfredo, and Steak.
- **Temporal Trends:** Monthly revenue trajectory (January to December) and day-of-week revenue distributions.

![Restaurant Sales Analytics Dashboard](./Restaurant%20Sales%20Analytics%20Dashboard.png)

---

## 🛠️ Technologies Used
- **SQL Server (T-SQL):** Data exploration, missing value imputation, data cleaning scripts, and integrity validation via `Restaurant_Sales_Cleaned.sql`.
- **Power BI Desktop:** Multi-page interactive dashboarding, dynamic filtering, and business intelligence reporting.
- **Git & GitHub:** Version control, file management, and professional project documentation.

---

## 🚀 How to Run & Use
1. **Clone or Download:** Clone this repository to your local machine.
2. **Database Setup:** Import the raw sales dataset into your SQL Server database.
3. **Execute Cleaning Pipeline:** Run the [`Restaurant_Sales_Cleaned.sql`](./Restaurant_Sales_Cleaned.sql) script sequentially to audit and clean the data.
4. **Interactive Dashboard:** Download and open the [`Restaurant Sales Analytics.pbix`](./Restaurant%20Sales%20Analytics.pbix) file in **Power BI Desktop** to explore the visualizations and interact with the data directly.
