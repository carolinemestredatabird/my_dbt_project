select
    order_id AS order_y,
    user_name as user_id_y,
    order_status AS order_status_y,
    DATETIME(order_date, "Europe/Paris") AS order_created_at_x,
    DATETIME(order_approved_date, "Europe/Paris") AS order_approved_at_x,
    DATETIME(pickup_date, "Europe/Paris") AS picked_up_at_x,
    DATETIME(delivered_date, "Europe/Paris") AS delivered_at_x,
    DATETIME(estimated_time_delivery, "Europe/Paris") AS estimated_time_delivery_x
from {{ source('sales_database', 'order') }}