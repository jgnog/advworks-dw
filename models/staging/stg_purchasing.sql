select po.purchaseorderid as purchaseorder_id,
       po.revisionnumber as revision_number,
	   CASE WHEN po.status = 1 THEN 'Pending'
	        WHEN po.status = 2 THEN 'Approved'
			WHEN po.status = 3 THEN 'Rejected'
			WHEN po.status = 4 THEN 'Complete'
		END as status,
       po.employeeid as employee_id,
	   po.vendorid as vendor_id,
	   po.shipmethodid as ship_method_id,
	   po.orderdate as order_date,
	   po.shipdate as ship_date,
	   po.subtotal as sub_total,
	   po.taxamt as tax_amount,
	   po.freight,
	   po.modifieddate as modified_date
  from {{ source("purchasing", "purchaseorderheader") }} po
  