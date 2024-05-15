{% snapshot sp_shipment %}

{{
    config(
        target_schema='snapshots',
        unique_key='ship_method_id',
        strategy='timestamp',
        updated_at='modified_date'
    )
}}

select
    *
from {{ ref('stg_shipment') }}

{% endsnapshot %}