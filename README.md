# OLIST E-COMMERCE SALES PERFORMANCE ANALYSIS

This project analyzes sales performance using the Olist Brazilian E-Commerce Dataset by building a consolidated master dataset in Google BigQuery. The analysis focuses on identifying revenue trends, top-performing product categories, customer spending behavior, payment references, and geographic sales distribution. The results are designed to support business decision-making such as marketing prioritization, customer retention strategies, and inventory optimization.

## Dataset Information
### Souce : Open Dataset from Kaggle
[Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/jayeshsalunke101/brazilian-ecommerce-public-dataset?)

### Tables
- olist_customers_dataset : Contains information about costumer id and location
- olist_geolocation_dataset : Contains information about customer location coordinates
- olist_order_items_dataset : Contains information about product-level transaction details
- olist_order_payments_dataset : Contains information about payment methods
- olist_orders_dataset : Contains information about order id, timestamps, and status
- olist_products_dataset : Contains information about product category

## Tools Used
- Google BigQuery (SQL processing, analysis, and table creation)

## Objectives
- Analyze monthly sales trends to detect revenue growth patterns
- Identify top-performing product categories by revenue
- Identify high-value customers and analyze their purchasing behavior
- Analyze revenue distribution by city and payment method
- Perform customer segmentation for targeted business strategies
- Prepare geolocation data for map-based sales visualization

## Data Preparation
### Master Data Table Creation
A master dataset was created by joining multiple relational tables into a single consolidated table to simplify analysis and impove query efficiency. This master table enables efficient analysis by reducing the need for repeated joins and provides a unified view of transactions, customers, and products.

Tables Joined :
- Orders Table joined with Customers Table using customer_id
- Orders Table joined with Order Items Table using order_id
- Order Item Table joined with Products Table using product_id
- Orders Table joined with Payments Table using order_id

Output Table
<img width="1910" height="508" alt="{216720FE-1793-4DE9-B257-8E506C98B55B}" src="https://github.com/user-attachments/assets/0f258d1d-47b5-4c5d-8c5a-cc1956e122c8" />

## SQL Analysis
### Monthly Sales Trend
Analyzes monthly revenue and total orders over time
<img width="462" height="390" alt="{E319CB22-6435-42F9-A73B-93BCAFADAF7E}" src="https://github.com/user-attachments/assets/f2ea1d97-8557-403d-8da8-a9b4a4b66654" />
<img width="1548" height="864" alt="{F9C1493B-B612-407C-919A-B2C6CE0D6914}" src="https://github.com/user-attachments/assets/ee7f8ba4-ae2d-45fb-9c35-8d6de4bfd90c" />

### Top Product Categories
Identifies product categories generating the highest revenue
<img width="467" height="271" alt="{69B5589C-DD52-4CE7-AC3F-ECB51F5AA130}" src="https://github.com/user-attachments/assets/10cadf4b-68c7-48a8-bf1c-461e5c2fa55e" />
Key Insight:
- The highest revenue category is beleza_saude (Beauty & Health), indicating strong market demand and consisten sales contribution
- Categories such as relogios_presentes (Watches & Gifts) generate very high revenue despite lower sales volume compared to other categories, indicating higher Average Order Value (AOV)
- Home & Living categories like cama_mesa_banho show high sales volume, suggesting they are mass-market categories with frequent purchases

### Top Customers
Identifies customers who spent the most across all transactions

### Revenue by City
Determines which cities contribute the most revenue and total orders

### Payment Method Analysis
Analyzed payment method distribution and its contribution to transaction and revenue

### Map Dataset Preparation
Final query aggregates revenue per latitude and longitude to prepare a dataset for geographic mapping

## Key Insights Summary
- Monthly revenue and order volume fluctuate over time, indicating potential seasonal demand patterns in the e-commerce market.
- A small number of product categories contribute the highest revenue, showing that sales performance is driven by key categories such as Beauty & Health (beleza_saude) and Watches & Gifts (relogios_presentes).
- Top customers show significantly higher spending compared to others, indicating the presence of high-value customers who contribute a notable portion of total revenue. However, most top spenders only placed 1 order, suggesting an opportunity to improve customer retention.
- Some categories generate high revenue despite lower sales volume (high AOV / premium products), while others achieve high sales volume but lower revenue contribution, indicating mass-market demand with lower average transaction value.
- Credit card dominates both transactions (86,769) and revenue (~10.97M), followed by boleto (22,867 transactions, ~2.39M revenue). Voucher usage is smaller but still relevant (6,274 transactions), indicating promotional potential, while debit card adoption is minimal (1,691 transactions).

## Business Recommendation
### Focus Marketing on High-Revenue Categories
Prioritize marketing campaigns and promotional budget on top-performing categories such as Beauty & Health and Watches & Gifts, as these categories are the main revenue drivers.

### Apply Different Strategies for Premium vs Mass-Market Categories
- For high-AOV categories (e.g., Watches & Gifts), apply premium bundling, exclusive offers, and seasonal campaigns to maximize revenue per transaction.
- For high-volume categories (e.g., Home & Living), focus on discount strategy, free shipping, and flash sales to increase conversion rate and transaction frequency.

### Improve Customer Retention for High-Spending Customers
Since most top customers only made one purchase, implement retention programs such as:
- Loyalty points / membership tier
- Personalized voucher for repeat purchase
- Exclusive promotions for high-value customers

This strategy can increase Customer Lifetime Value (CLV).

### Strengthen Cross-Selling & Upselling Strategy
Use customer purchase history to recommend relevant products, such as accessories or complementary items, especially for high-value transactions. This can increase basket size and improve revenue growth.

### Optimize Checkout Based on Payment Preferences
Since credit cards dominate transactions and revenue:
- Ensure smooth credit card payment processing
- Provide installment options (if applicable)
- Reduce payment failures during checkout
- Additionally, maintain boleto as a key payment option to support customers who prefer non-card payments.

### Use Voucher as a Promotion Tool
Voucher transactions are smaller but still significant, meaning vouchers can be leveraged for:
- Customer reactivation campaigns
- First-time buyer incentives
- Retention offers for high-value customers
This can increase conversion and repeat purchase rate.
