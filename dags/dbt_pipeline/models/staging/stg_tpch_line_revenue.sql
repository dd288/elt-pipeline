select 
    l_extendedprice as extended_price,
    l_discount as discount_percentage,
    l_shipdate as ship_date,
    l_quantity as quantity
from 
    {{ source('tpch', 'lineitem') }}