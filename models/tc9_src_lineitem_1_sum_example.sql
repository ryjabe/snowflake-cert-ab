select
    l_shipmode,
    sum(l_quantity) as total_quantity
from {{ source('ETL1', 'tc9_src_lineitem_1') }}
group by 1
order by 2 desc
