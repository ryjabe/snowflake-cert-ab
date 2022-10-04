{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "DBT_TEMP",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('TC9_SRC_LINEITEM_2_AB3') }}
select
    L_TAX,
    L_COMMENT,
    L_PARTKEY,
    L_SUPPKEY,
    L_DISCOUNT,
    L_ORDERKEY,
    L_QUANTITY,
    L_SHIPDATE,
    L_SHIPMODE,
    L_COMMITDATE,
    L_LINENUMBER,
    L_LINESTATUS,
    L_RETURNFLAG,
    L_RECEIPTDATE,
    L_SHIPINSTRUCT,
    L_EXTENDEDPRICE,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT,
    _AIRBYTE_TC9_SRC_LINEITEM_2_HASHID
from {{ ref('TC9_SRC_LINEITEM_2_AB3') }}
-- TC9_SRC_LINEITEM_2 from {{ source('DBT_TEMP', '_AIRBYTE_RAW_TC9_SRC_LINEITEM_2') }}
where 1 = 1

