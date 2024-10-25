select
    order_id,
    sum(total_order_item_amount) as total_amount
from {{ ref('stg_sales_database__order_item') }}
group by order_id
having total_amount < 0