select
    *
from {{ source('ETL1', 'tc9_src_lineitem_3') }}
