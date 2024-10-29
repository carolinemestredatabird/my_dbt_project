WITH monthly_users_recap AS (


SELECT DATE_TRUNC(order_date,month) AS order_month,
COUNT(DISTINCT user_name) AS total_monthly_users
FROM {{ ref('stg_sales_database__order')}}
GROUP BY 1
ORDER BY total_monthly_users DESC


), total_monthly_user_from_jawa_timur AS (
SELECT DATE_TRUNC(order_date,month) AS order_month,
COUNT(DISTINCT user.user_name) AS total_monthly_users_from_jawa_timur
FROM {{ ref('stg_sales_database__order')}} AS orders
LEFT JOIN {{ ref('stg_sales_database__user')}} AS user ON user.user_name = orders.user_name
WHERE user.customer_state LIKE '%JAWA%TIMUR%'
GROUP BY order_month


), monthly_orders_recap AS (


SELECT DATE_TRUNC(order_date,month) AS order_month,
COUNT(order_id) AS total_monthly_orders
FROM {{ ref('stg_sales_database__order')}}
GROUP BY order_month


)
SELECT u.order_month,
COALESCE(u.total_monthly_users,0) AS total_monthly_users,
COALESCE(jt.total_monthly_users_from_jawa_timur,0) AS total_monthly_users_from_jawa_timur,
COALESCE(o.total_monthly_orders,0) AS total_monthly_orders
FROM monthly_users_recap AS u
LEFT JOIN total_monthly_user_from_jawa_timur AS jt ON jt.order_month = u.order_month
LEFT JOIN monthly_orders_recap AS o ON o.order_month = u.order_month
ORDER BY order_month