with surrogate_keys as (
    select
        o.purchaseorder_id,
        o.revision_number,
        o.status,
        demp.sk_employee as sk_employee,
        dv.sk_vendor as sk_vendor,
        dship.sk_shipment as sk_shipment,
        order_dd.sk_date as sk_order_date,
        o.ship_date,
        date_part('day', o.ship_date::timestamp - o.order_date::timestamp) as time_to_ship_days,
        o.sub_total,
        o.tax_amount,
        o.freight,
        o.modified_date
    from {{ ref('stg_purchasing') }} o
        join {{ ref('dim_date') }} p_dd on o.order_date = p_dd.date
        left join {{ ref('dim_vendor') }} dv on dv.vendor_id = o.vendor_id
            and o.order_date between vd.valid_from and dv.valid_to
        left join {{ ref('dim_shipment') }} dship on dship.ship_method_id = o.ship_method_id
            and o.order_date between dship.valid_from and dship.valid_to
        left join {{ ref('dim_employee') }} demp on demp.employee_id = o.employee_id
            and o.order_date between demp.valid_from and demp.valid_to
),
final as (
    select
        purchaseorder_id,
        revision_number,
        status,
        sk_employee,
        sk_vendor,
        sk_shipment,
        sk_order_date,
        ship_date,
        time_to_ship_days,
        sub_total,
        tax_amount,
        freight,
        modified_date
    from surrogate_keys
)

select
    *
from final