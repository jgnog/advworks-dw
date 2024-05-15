-- dim_shipment
select shipmethodid as ship_method_id,
       name as ship_name,
	   shipbase as ship_base,
	   shiprate as ship_rate,
	   modifieddate as modified_date
  from purchasing.shipmethod