select a.id ,e.distance ,e.amount,a.seller_id ,b.store_name as Store_Name, date(convert_tz(a.order_time,"UTC","Asia/Kolkata")) as order_date  ,
b.store_type ,time(convert_tz(a.order_time,"UTC","Asia/Kolkata") )as order_time ,time(convert_tz(a.accept_time,"UTC","Asia/Kolkata") )as accept_time,time(convert_tz(a.allot_time,"UTC","Asia/Kolkata") )as allot_time,time(convert_tz(a.pickup_time,"UTC","Asia/Kolkata") )as pick_time,time(convert_tz(a.delivered_time,"UTC","Asia/Kolkata") )as delivered_time,

d.cluster_name as Cluster_Name,a.order_date,c.id as Sellerid
from coreengine_order a
join coreengine_sfxseller c on c.id = a.seller_id
join coreengine_sellerprofile b on b.id = c.seller_id
join coreengine_cluster d on d.id = c.cluster_id ,
order_charges e 
where a.order_date<='20151224' and Store_Name LIKE "%Burger King%" and e.order_id=a.id
order by a.order_date, seller_id
