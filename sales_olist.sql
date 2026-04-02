## MASTER DATA
create or replace table `salesolist.olist_data.master_data` as
select
  o.order_id,
  date(o.order_purchase_timestamp) as order_date,
  format_date('%Y-%m', date(o.order_purchase_timestamp)) as order_month,
  c.customer_id,
  c.customer_city,
  c.customer_state,
  p.product_id,
  p.product_category_name,
  oi.price,
  oi.freight_value,
  pay.payment_type
from `salesolist.olist_data.orders` o
join `salesolist.olist_data.customers` c
  on o.customer_id = c.customer_id
join `salesolist.olist_data.order_items` oi
  on o.order_id = oi.order_id
join `salesolist.olist_data.products` p
  on oi.product_id = p.product_id
join `salesolist.olist_data.payments` pay
  on o.order_id = pay.order_id;

select * from `salesolist.olist_data.master_data`
limit 10;

## MONTHLY SALES TREND
select 
  order_month,
  sum(price + freight_value) as total_revenue,
  count(distinct order_id) as total_orders
from `salesolist.olist_data.master_data`
group by order_month
order by order_month;

## TOP PRODUCT CATEGORIES
select 
  product_category_name,
  sum(price) as total_revenue,
  count(*) as total_sales
from `salesolist.olist_data.master_data`
group by product_category_name
order by total_revenue desc
limit 10;

## TOP CUSTOMERS
select 
  customer_id,
  sum(price) as total_spent,
from `salesolist.olist_data.master_data`
group by customer_id
order by total_spent desc
limit 10;

## REVENUE BY CITY
select
  customer_city,
  sum(price) as total_revenue,
  count(distinct order_id) as total_orders
from `salesolist.olist_data.master_data`
group by customer_city
order by total_revenue desc
limit 10;

## PAYMENT METHOD ANALYSIS
select 
  payment_type,
  count(*) as total_transactions,
  sum(price) as total_revenue
from `salesolist.olist_data.master_data`
group by payment_type
order by total_transactions desc;

## RANKING PRODUCT CATEGORY
select
  product_category_name,
  total_revenue,
  rank() over (order by total_revenue desc) as ranking
from (
  select
    product_category_name,
    sum(price) as total_revenue
    from `salesolist.olist_data.master_data`
    group by product_category_name
);

## CUSTOMER SEGMENTATION
select
  customer_id,
  sum(price) as total_spent,
  case
    when sum(price) > 1000 then 'High Value'
    when sum(price) between 500 and 1000 then 'Medium Value'
    else 'Low Value'
  end as segment
from `salesolist.olist_data.master_data`
group by customer_id;

## CLEANING GEOLOCATION
create or replace table `salesolist.olist_data.geo_clean` as
select 
  geolocation_zip_code_prefix,
  avg(geolocation_lat) as lat,
  avg(geolocation_lng) as lng
from `salesolist.olist_data.geolocation`
group by geolocation_zip_code_prefix;

## JOIN GEOLOCATION TO CUSTOMER
create or replace table `salesolist.olist_data.data_full` as
select
  m.*,
  g.lat,
  g.lng
from `salesolist.olist_data.master_data` m
join `salesolist.olist_data.customers` c
  on m.customer_id = c.customer_id
left join `salesolist.olist_data.geo_clean` g 
  on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix;

## MAP
select
  lat, lng,
  sum(price) as total_revenue
from `salesolist.olist_data.data_full`
where lat is not null
group by lat, lng;