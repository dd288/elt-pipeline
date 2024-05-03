select 
    {{ revenue_amount('line_item.extended_price', 'line_item.discount_percentage') }} as item_sum_amount
from
    {{ ref('stg_tpch_line_revenue') }} as line_item
where
    line_item.ship_date >= date '{{ var('start_date') }}'
    and line_item.ship_date < date '{{ var('end_date') }}' + interval '1 year'
    and line_item.discount_percentage between 0.06 - 0.01 and 0.06 + 0.01
    and line_item.quantity < 24
LIMIT 1

