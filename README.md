# Brazilian E-Commerce Data Analysis Project 🇧🇷

## Project Overview

This project explores the Brazilian E-Commerce Public Dataset by Olist to uncover meaningful business insights into e-commerce performance, customer purchasing behavior, sales trends, product performance, delivery efficiency, and customer satisfaction.

The project follows an end-to-end data analytics workflow, using **Python for data cleaning and Exploratory Data Analysis (EDA), SQL for business analysis, and Power BI for interactive data visualization and reporting.**

The main objective is to transform raw e-commerce data into actionable insights that can help stakeholders understand business performance, identify operational challenges, and make data-driven decisions.

## Business Objectives

The analysis focuses on answering important business questions, including:

- How is the business performing in terms of sales and order volume?
- What are the sales trends over time?
- Which product categories contribute most to revenue?
- Which states or regions generate the highest sales?
- How do customers rate their shopping experiences?
- What is the relationship between delivery performance and customer satisfaction?
- How long does it take for orders to be delivered?
- What percentage of orders are delivered late?
- Which business areas offer opportunities for improvement?

## Dataset Description

The dataset is based on the Brazilian E-Commerce Public Dataset by Olist, which contains information about orders placed through the Olist marketplace in Brazil.

The dataset consists of multiple related tables covering different aspects of the e-commerce business.

Key datasets include:

- **Customers:** Customer identifiers, locations, and geographic information.
- **Orders:** Order identifiers, purchase timestamps, order status, and delivery timestamps.
- **Order Items:** Products purchased, seller information, prices, and freight values.
- **Products:** Product identifiers, categories, and product attributes.
- **Payments:** Payment methods, installment counts, and payment values.
- **Reviews:** Customer review scores and review comments.
- **Sellers:** Seller identifiers and geographic information.
- **Geolocation:** Brazilian postal codes and geographic coordinates.
- **Product Category Translation:** Product category translations from Portuguese to English.

*Dataset source: Olist Brazilian E-Commerce Public Dataset, originally made available on Kaggle.*

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, preprocessing, and EDA |
| Pandas | Data manipulation and transformation |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Jupyter Notebook | Interactive analysis and documentation |
| SQL | Business analysis, aggregations, joins, and KPI calculations |
| Power BI | Interactive dashboards and business reporting |
| Excel/CSV | Data storage, inspection, and exchange |
| GitHub | Project documentation and version control |

## Project Workflow

### 1. Data Cleaning and Preparation with Python

Python was used to inspect, clean, and prepare the datasets before conducting the business analysis.

Key activities included:

- Loading the datasets into Pandas DataFrames.
- Inspecting dataset dimensions, column names, and data types.
- Identifying and handling missing values.
- Checking for duplicate records.
- Converting date columns into appropriate datetime formats.
- Correcting data types for numerical and categorical columns.
- Standardizing column names and preparing fields for analysis.
- Reviewing inconsistencies across related datasets.
- Preparing cleaned datasets for downstream SQL analysis and visualization.

The objective was to improve data quality, consistency, and reliability before extracting business insights.

### 2. Exploratory Data Analysis (EDA) with Python

Exploratory Data Analysis was conducted to understand the structure, characteristics, and patterns within the data.

The analysis involved:

- Examining the distribution of numerical variables.
- Analyzing order volumes and purchasing patterns.
- Exploring sales and payment distributions.
- Investigating product category performance.
- Examining customer and seller geographic distributions.
- Exploring customer review scores.
- Analyzing order delivery times and delivery performance.
- Identifying trends, unusual observations, and potential business issues.
- Creating visualizations to communicate key patterns in the data.

EDA helped establish a clearer understanding of the dataset and identify areas requiring further investigation through SQL.

### 3. Business Analysis with SQL

SQL was used to perform structured business analysis on the cleaned datasets.

The analysis focused on extracting business insights through queries involving joins, aggregations, filtering, date-based analysis, and calculated metrics.

Areas of investigation included:

- Sales performance and order volume.
- Revenue trends over time.
- Top-performing product categories.
- Geographic sales performance.
- Customer purchasing behavior.
- Payment method distribution.
- Order delivery performance.
- Delivery delays and fulfillment efficiency.
- Customer review scores and satisfaction.
- Relationships between operational performance and customer experience.

SQL made it possible to combine information from related tables and transform the cleaned data into business-focused metrics and analytical outputs.

### 4. Data Visualization with Power BI

Power BI was used to communicate the analytical findings through interactive visual reports and dashboards.

The visualization stage focused on presenting important business metrics in a clear and accessible format.

Potential dashboard areas include:

- **Sales Performance:** Revenue, order volume, and sales trends.
- **Product Performance:** Revenue and order distribution by product category.
- **Geographic Performance:** Sales and customer distribution across Brazilian states.
- **Delivery Performance:** Delivery times, delays, and fulfillment trends.
- **Customer Experience:** Review scores and customer satisfaction indicators.
- **Payment Analysis:** Payment methods and payment value distribution.

The goal was to make business performance easier to monitor, compare, and interpret using interactive filters, charts, KPI cards, and other suitable Power BI visuals.

## Key Performance Indicators (KPIs)

The project examines business metrics such as:

| KPI | Description |
|---|---|
| Total Sales / Revenue | Monetary value generated from the selected sales measure |
| Total Orders | Number of distinct orders |
| Average Order Value | Average sales value per order, using a clearly defined revenue measure |
| Average Review Score | Average customer review rating |
| Average Delivery Time | Average time taken to deliver orders |
| On-Time Delivery Rate | Percentage of eligible delivered orders meeting the defined delivery target |
| Late Delivery Rate | Percentage of eligible delivered orders arriving after the defined delivery target |
| Top Product Categories | Product categories ranked by a selected sales or order metric |
| Geographic Sales Performance | Sales distribution across Brazilian states or regions |

*Note: Exact KPI definitions depend on the fields, filters, and business rules used in the analysis. Revenue, order item value, freight charges, and payment value should not be treated as interchangeable measures.*

## Business Value

This project demonstrates how data analytics can support business decision-making in an e-commerce environment.

The analysis can help stakeholders:

- Monitor overall sales and order performance.
- Identify high-performing and underperforming product categories.
- Understand geographic differences in business activity.
- Evaluate order fulfillment and delivery efficiency.
- Investigate factors associated with customer satisfaction.
- Identify potential operational bottlenecks.
- Build a foundation for data-driven business recommendations.

## Project Structure

The repository can be organized as follows:

```text
olist-ecommerce-data-analysis/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── notebooks/
│   ├── data_cleaning.ipynb
│   └── exploratory_data_analysis.ipynb
│
├── sql/
│   ├── sales_analysis.sql
│   ├── product_analysis.sql
│   ├── customer_analysis.sql
│   └── delivery_analysis.sql
│
├── powerbi/
│   ├── olist_business_analysis.pbix
│   └── dashboard_screenshots/
│
├── README.md
└── .gitignore
```

*This is a suggested folder structure. Adjust the filenames and folders to match the actual files in your repository.*

## How to Explore the Project

1. Review the Python notebooks to understand the data cleaning and EDA process.
2. Explore the SQL scripts to examine the business questions, queries, and analytical calculations.
3. Open the Power BI report, if included, to interact with the dashboards and explore the findings.
4. Review the documented results and recommendations to understand the business implications.

### Requirements

To reproduce the Python analysis, install the necessary packages:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

You will also need an appropriate SQL database or SQL environment compatible with the queries and a Power BI installation to open the `.pbix` report.

## Challenges and Considerations

Working with a multi-table e-commerce dataset requires careful attention to:

- Data quality and missing values.
- Consistent date and numerical data types.
- Relationships between customers, orders, products, sellers, and payments.
- Join duplication and the correct level of aggregation.
- Differences between orders, order items, and payment records.
- Appropriate definitions of revenue and delivery performance.
- Accurate interpretation of customer reviews and operational metrics.

These considerations are important for ensuring that the final analysis is reliable and that reported business metrics are not misleading.

## Conclusion

The Olist Brazilian E-Commerce Data Analysis Project demonstrates an end-to-end approach to data analytics, from preparing raw data to extracting business insights and communicating results through visual dashboards.

By combining **Python, SQL, and Power BI**, the project illustrates how different analytical tools work together to support data-driven decision-making.

It also demonstrates practical skills in data cleaning, exploratory analysis, relational data analysis, KPI development, data visualization, and business intelligence.

## Skills Demonstrated

- Data Cleaning and Preprocessing
- Exploratory Data Analysis (EDA)
- Python and Pandas
- SQL Querying and Data Aggregation
- Relational Data Analysis
- Business Intelligence
- KPI Development
- Power BI Dashboard Development
- Data Visualization
- Business Insight Generation
- Analytical Problem-Solving
- Data Storytelling

## Acknowledgements

Dataset: Olist Brazilian E-Commerce Public Dataset, available through Kaggle.

This project was developed for data analytics practice and portfolio development, demonstrating the application of data analytics techniques to a real-world e-commerce dataset.

---

**Author:** George Prince

**Project:** Brazilian E-Commerce Data Analysis

**Tools:** Python | SQL | Power BI

**Domain:** E-Commerce Analytics | Business Intelligence | Data Analytics
