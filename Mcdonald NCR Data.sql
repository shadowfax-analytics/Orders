select a.id ,e.distance ,e.amount,a.seller_id ,b.store_name as Store_Name, date(convert_tz(a.order_time,"UTC","Asia/Kolkata")) as order_date  ,
b.store_type ,time(convert_tz(a.order_time,"UTC","Asia/Kolkata") )as order_time ,

d.cluster_name as Cluster_Name,a.order_date,c.id as Sellerid , a.name as customer_name ,a.house_number,a.locality ,a.contact_number
from coreengine_order a
join coreengine_sfxseller c on c.id = a.seller_id
join coreengine_sellerprofile b on b.id = c.seller_id
join coreengine_cluster d on d.id = c.cluster_id ,
order_charges e 
where a.order_date>='20151101' and a.order_date<='20151203' and  d.city="Noida" and Store_Name LIKE "%Donalds%" and e.order_id=a.id
order by a.order_date, seller_id
