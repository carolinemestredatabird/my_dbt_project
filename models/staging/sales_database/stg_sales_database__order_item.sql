select CONCAT(order_id, '_', product_id) AS order_item_id,
 order_id,
 product_id,
 seller_id,
 DATETIME(pickup_limit_date, "Europe/Paris") AS picked_up_limited_at,
 price as unit_price,
 shipping_cost,
 quantity as item_quantity,
 (price * quantity) + shipping_cost as total_order_item_amount
from {{ source('sales_database', 'order_item') }}
