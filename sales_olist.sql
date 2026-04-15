## MASTER DATA
create or replace view `salesolist.olist_data.master_data` as
select
  o.order_id,
  date(o.order_purchase_timestamp) as order_date,
  format_date('%Y-%m', date(o.order_purchase_timestamp)) as order_month,
  o.order_status,

  c.customer_id,
  c.customer_unique_id,
  c.customer_city,
  c.customer_state,

  p.product_id,
  coalesce(p.product_category_name, 'unknown') as product_category_name,

  oi.price,
  oi.freight_value,

  pay.payment_type,

  s.state
from `salesolist.olist_data.orders` o
join `salesolist.olist_data.customers` c
  on o.customer_id = c.customer_id
  and c.customer_id is not null
  and o.order_status not in ('canceled')

join `salesolist.olist_data.order_items` oi
  on o.order_id = oi.order_id
  and oi.price > 0

join `salesolist.olist_data.products` p
  on oi.product_id = p.product_id

join `salesolist.olist_data.payments` pay
  on o.order_id = pay.order_id

join  `salesolist.olist_data.state_full` s
  on c.customer_id = s.customer_id

where o.order_id is not null;

select * from `salesolist.olist_data.master_data`
limit 10;

## MONTHLY SALES TREND
select 
  order_month,
  sum(price) as total_revenue,
  count(order_id) as total_orders
from `salesolist.olist_data.master_data`
group by order_month
order by order_month;

## TOP PRODUCT CATEGORIES BY REVENUE
select 
  product_category_name,
  sum(price) as total_revenue,
  count(order_id) as total_sales
from `salesolist.olist_data.master_data`
group by product_category_name
order by total_revenue desc
limit 10;

## TOP CUSTOMERS BY TOTAL SPENT
select 
  customer_unique_id,
  sum(price + freight_value) as total_spent,
  count(order_id) as total_orders
from `salesolist.olist_data.master_data`
group by customer_unique_id
order by total_spent desc
limit 10;

## TOP CITY BY REVENUE
select
  customer_city,
  sum(price) as total_revenue,
  count(distinct order_id) as total_orders
from `salesolist.olist_data.master_data`
group by customer_city
order by total_revenue desc
limit 10;

## CUSTOMER DISTRIBUTION PER STATE
select
  state,
  count(customer_unique_id) as total_customer
from `salesolist.olist_data.master_data`
group by state
order by total_customer desc;

## PAYMENT METHOD BY TOTAL CUSTOMER
select 
  payment_type,
  count(customer_unique_id) as total_customers,
  sum(price) as total_revenue
from `salesolist.olist_data.master_data`
group by payment_type
order by total_customers desc;

## CUSTOMER SEGMENTATION
select
  segment,
  count(*) as total_customer
from (
  select
    customer_unique_id,
    sum(price + freight_value) as total_spent,
    case
      when sum(price + freight_value) > 1000 then 'High Value'
      when sum(price + freight_value) between 500 and 1000 then 'Medium Value'
      else 'Low Value'
    end as segment
  from `salesolist.olist_data.master_data`
  group by customer_unique_id
)
group by segment
order by total_customer;