select a.id ,e.distance ,e.amount,a.seller_id ,b.store_name as Store_Name, date(convert_tz(a.order_time,"UTC","Asia/Kolkata")) as order_date  ,
b.store_type ,time(convert_tz(a.order_time,"UTC","Asia/Kolkata") )as order_time ,

d.cluster_name as Cluster_Name,a.order_date,c.id as Sellerid
from coreengine_order a
join coreengine_sfxseller c on c.id = a.seller_id
join coreengine_sellerprofile b on b.id = c.seller_id
join coreengine_cluster d on d.id = c.cluster_id ,
order_charges e 
where a.order_date>='20151001' and a.order_date<='20151125' and d.city="BLR" and Store_Name LIKE "%Pizza Hut%" and e.order_id=a.id
order by a.order_date, seller_id
