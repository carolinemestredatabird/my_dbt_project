WITH  orders_summary AS (
SELECT
 user_id,
 user_city,
 user_state,
 SUM(total_order_amount) AS total_amount_spent,
 SUM(total_items) as total_items,
 SUM(total_distinct_items) as total_distinct_items,
 COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('int_sales_database__order') }} 
GROUP BY
 user_id,
 user_city,
 user_state
)

SELECT
o.user_id,
o.user_city,
o.user_state,
os.total_amount_spent,
os.total_items,
os.total_distinct_items,
os.total_orders,
p.favorite_product_id
FROM orders_summary AS o
INNER JOIN orders_summary os ON os.user_id = o.user_id
LEFT JOIN {{ ref('int_sales_database__user_favorite_product') }} p
ON o.user_id = p.user_id
