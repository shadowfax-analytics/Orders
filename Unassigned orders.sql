select o.id as 'order_id',c.cluster_name,c.operational_city,convert_tz(o.order_time,"UTC","Asia/Kolkata") as 'Order_time'
,o.seller_id,sp.store_name
from coreengine_order o,coreengine_cluster c,coreengine_sfxseller sfs,coreengine_sellerprofile sp
where o.cluster_id = c.id and o.seller_id = sfs.id and sfs.seller_id = sp.id and
date(o.order_time) = '2016-01-06' and o.status = 0 and c.cluster_name not like "%test%";