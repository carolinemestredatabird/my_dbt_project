select CONCAT(order_id, '_', product_id) AS order_item_id_x,
 order_id AS order_id_x,
 product_id AS product_id_x,
 seller_id AS seller_id_x,
 DATETIME(pickup_limit_date, "Europe/Paris") AS picked_up_limited_at_x,
 price as unit_price_x,
 shipping_cost_x,
 quantity as item_quantity_x,
 (price * quantity) + shipping_cost as total_order_item_amount_x
from {{ source('sales_database', 'order_item') }}
