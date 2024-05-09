-- dim_vendor	 
WITH numbered_contacts AS (
    SELECT v.businessentityid AS vendor_id,
           v.accountnumber as account_number,
           v.name as vendor_name,
           v.creditrating as credit_rating,
           v.preferredvendorstatus as preferred_vendor_status,
           v.activeflag as active_flag,
           v.purchasingwebserviceurl as purchasing_web_service_url,
           ct.name AS contact_type,
           row_number() OVER (PARTITION BY v.businessentityid ORDER BY ct.name) AS row_nr_contact,
           p.title,
           p.firstname as fisrt_name,
           p.middlename as middle_name,
           p.lastname as last_name,
           p.suffix,
           pp.phonenumber as phone_number,
           pnt.name AS phone_number_type,
           ea.emailaddress as email_address,
	       vw_adresses.addresstype as address_type,
	       vw_adresses.addressline1 as address_line1,
	       vw_adresses.addressline2 as address_line2,
	       vw_adresses.city,
	       vw_adresses.stateprovincename as state_province_name,
	       vw_adresses.postalcode as postal_code,
	       vw_adresses.countryregionname as country_region_name,
           v.modifieddate as modified_date
    FROM purchasing.vendor v
    JOIN person.businessentitycontact bec ON bec.businessentityid = v.businessentityid
    JOIN person.contacttype ct ON ct.contacttypeid = bec.contacttypeid
    JOIN person.person p ON p.businessentityid = bec.personid
    LEFT JOIN person.emailaddress ea ON ea.businessentityid = p.businessentityid
    LEFT JOIN person.personphone pp ON pp.businessentityid = p.businessentityid
    LEFT JOIN person.phonenumbertype pnt ON pnt.phonenumbertypeid = pp.phonenumbertypeid
	LEFT JOIN purchasing.vvendorwithaddresses vw_adresses ON vw_adresses.businessentityid = v.businessentityid
)
SELECT *
FROM numbered_contacts
WHERE row_nr_contact = 1
ORDER BY vendor_id;