# OLIST E-COMMERCE SALES PERFORMANCE ANALYSIS

This project analyzes e-commerce sales performance using the Olist dataset (a Brazilian e-commerce public dataset) obtained from Kaggle. The analysis uses SQL (Google BigQuery) to process transaction and customer data, and the results are visualized in a Power BI dashboard to allow stakeholders to monitor business performance more easily and interactively.

## DATASET INFORMATION
### Souce : Open Dataset from Kaggle
[Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/jayeshsalunke101/brazilian-ecommerce-public-dataset?)

### Tables
- olist_customers_dataset : Contains information about costumer id and location
- olist_order_items_dataset : Contains information about product-level transaction details
- olist_order_payments_dataset : Contains information about payment methods
- olist_orders_dataset : Contains information about order id, timestamps, and status
- olist_products_dataset : Contains information about product category
- state_full : Contains information about state

## TOOLS USED
- Google BigQuery (SQL processing, analysis, and table creation)
- Power BI (Dashboard Development) 

## OBJECTIVE
The main objectives of this project are:
- Analyze sales performance/trends based on total revenue and number of orders over time
- Identify product categories with the highest revenue contribution
- Identify customers and regions (states) with the highest transaction contribution
- Analyze the most frequently used payment methods
- Segment customers based on total spending
- Provide a dashboard to support data-driven business decision-making

## SQL ANALYSIS
### Master Data Table Creation
A master dataset was created by joining multiple relational tables into a single consolidated table to simplify analysis and impove query efficiency. This master table enables efficient analysis by reducing the need for repeated joins and provides a unified view of transactions, customers, and products.

The initial step is to build a master_data view by combining several data tables, namely:
- Orders
- Customers
- Order_items
- Products
- Payments
- State

The main columns used are:
- Order_id, order_data, order_month
- Customer_unique_id, customer_city, customer_state
- Product_category_name
- Price, freight_value
- Payment_type
- State_name_full

Output Master Data
<img width="1377" height="270" alt="{68AC548C-24DB-4CF2-8A28-7151B0272479}" src="https://github.com/user-attachments/assets/036718eb-9191-4b20-8ede-fa8f4078d59b" />

### Monthly Sales Trend
<img width="464" height="291" alt="{C151F75B-15F6-49F1-83C4-6BB06D576CFE}" src="https://github.com/user-attachments/assets/6869c8ef-92d6-4f43-92c8-10d969668f14" />

<img width="1056" height="308" alt="{8FF0BB1A-0A45-4FA4-9700-14DD3B0BD10D}" src="https://github.com/user-attachments/assets/55dacee6-3ccb-475f-b506-cb415c3fe216" />

### Top Product Categories by Revenue
<img width="720" height="420" alt="image" src="https://github.com/user-attachments/assets/d8a481ea-ed48-4e1f-b93b-0293ab96cee7" />

### Top Customers by Total Spent
<img width="719" height="413" alt="image" src="https://github.com/user-attachments/assets/6504eb70-75c4-4c94-9451-8727d6c297b6" />

### Top City by Revenue
<img width="719" height="416" alt="image" src="https://github.com/user-attachments/assets/2f6e04bf-644c-42ca-919a-761f2c869964" />

### Customer Distribution per State
<img width="550" height="414" alt="image" src="https://github.com/user-attachments/assets/a25125cd-0bb1-46ba-9667-65e654f78482" />

### Payment Method by Total Customer
<img width="717" height="163" alt="image" src="https://github.com/user-attachments/assets/20eb15d6-cf52-4701-8c58-2da0e3c34f11" />

### Customer Segmentation
Customers are grouped into three segments based on total spending:
- High Value: Total spent > 1,000
- Medium Value: Total spent 500 – 1,000
- Low Value: Total spent < 500
<img width="358" height="104" alt="{BE36FD58-2FA0-4C1E-B4AD-A1F7B62C129A}" src="https://github.com/user-attachments/assets/277f918d-d701-4a46-829e-816d04b7cff0" />

## POWER BI DASHBOARD
<img width="1484" height="835" alt="{4868A461-7B28-423A-B931-4F9D0994B8EC}" src="https://github.com/user-attachments/assets/c9af33b8-c2d1-4902-83ea-b9334e946f71" />

## INSIGHT
- Sales trends, both in terms of revenue and total orders, showed an upward trend with a slight decline, peaking in November 2017. Although the trend declined sharply in the following month (December 2017), it rebounded the following month and remained stable until August 2019. At the end of the period (September 2019), there was a sharp decline, likely due to incomplete data available for that period.
- The largest revenue came from the beauty and health product category, indicating strong market demand and a stable sales contribution to total revenue.
- There were interesting patterns in sales for each product category:
  - Some categories had high revenue but low order volumes, such as watches and gifts, indicating higher prices for products in that category, resulting in a high AOV.
  - Conversely, there are also categories with a high number of orders but lower revenue, such as the cama, mesa, banho (bed, table, bath) category, indicating that products in this category are more frequently purchased by the market at relatively low prices.
- The region (state) with the highest number of customers is São Paulo, followed by Rio de Janeiro and Minas Gerais, indicating that purchase transactions are more concentrated in areas with large populations.
- The most dominant payment method used by customers is credit card, while debit card is the payment method used less often by customers.
- Customer segmentation shows that the majority of customers are in the low-value segment.

## BUSINESS RECOMMENDATION
- Prioritize Marketing on Product Categories that Contribute the Highest Revenue
- Apply Different Strategies for High-Revenue and High-Order Product Categories
- Focus on Areas with Large Market Potential
- Optimize Popular Payment Methods
- Use Vouchers as a Promotion and Retention Tool
- Strengthen Customer Retention in Low- and Medium-Value Segments
- Exclusive Programs for High-Value Customers
- Strengthen Cross-Selling and Upselling Strategies
