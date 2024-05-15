-- fact_purchase
select po.purchaseorderid as purchaseorder_id,
       po.revisionnumber as revision_number,
	   CASE WHEN po.status = 1 THEN 'Pending'
	        WHEN po.status = 2 THEN 'Approved'
			WHEN po.status = 3 THEN 'Rejected'
			WHEN po.status = 4 THEN 'Complete'
		END as status,
       e.businessentityid as employee_id,
	   v.businessentityid as vendor_id,
	   s.shipmethodid as ship_method_id,
	   po.orderdate as order_date,
	   po.shipdate as ship_date,
	   po.subtotal as sub_total,
	   po.taxamt as tax_amount,
	   po.freight,
	   po.modifieddate as modified_date
  from purchasing.purchaseorderheader po
       inner join humanresources.employee e on e.businessentityid = po.employeeid
	   inner join purchasing.vendor v on v.businessentityid = po.vendorid
	   inner join purchasing.shipmethod s on s.shipmethodid = po.shipmethodid