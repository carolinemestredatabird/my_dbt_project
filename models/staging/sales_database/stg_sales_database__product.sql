select product_id,
 coalesce(product_category,'other') as product_category,
 cast(product_name_lenght as int) as product_name_lenght,
 cast(product_description_lenght as int) as product_description_lenght,
 cast(product_photos_qty as int) as product_photos_qty,
 cast(product_weight_g as int) as product_weight_g,
 cast(product_length_cm as int) as product_length_cm,
 cast(product_height_cm as int) as product_height_cm,
 cast(product_width_cm as int) as product_width_cm
from {{ source('sales_database', 'product') }}