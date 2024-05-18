select shipmethodid as ShipMethodID,
		name as TransporterName,
		shipbase as PriceShip,
		rowguid as IdentifyierUnique,
		Date(modifieddate) as DateModify
from {{ source ('purchasing', 'shipmethod') }}

