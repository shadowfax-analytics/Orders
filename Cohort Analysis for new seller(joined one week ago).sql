select d.city , d.cluster_name, a.seller_id, c.store_name, c.store_type, 
 datediff(curdate()-1,b.date_active) as partnership_period,
count(*) as orders, (1-sum(case when source in (1,2) then 1 else 0 
end)/count(*))*100 as Tech_eff
from coreengine_order as a 
join coreengine_sfxseller as b on b.id= a.seller_id
join coreengine_sellerprofile as c on c.id= b.seller_id
join coreengine_cluster as d on  d.id= b.cluster_id
where date(order_time)<=curdate()-1 and date(order_time)>=curdate()-7 and 
a.status!=302 and a.cluster_id!=1 and b.date_active>=curdate()-7 and 
b.date_active<=curdate()-1 
group by a.seller_id