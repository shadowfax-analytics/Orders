select d.city , d.cluster_name, a.seller_id, c.store_name, c.store_type,case b.status when 0 then 'InActive' 
when 1 then 'Active' end as seller_status , 
 datediff(adddate(curdate(),-1),b.date_active) as partnership_period,(1-sum(case when source in (1,2) then 1 else 0 
end)/count(*))*100 as Tech_eff,
sum(case when (date(order_time)>=adddate(curdate(),-7) and date(order_time)<=adddate(curdate(),-1))then 1 else 0 end) as 'Cur_Week_orders'

from coreengine_order as a 
join coreengine_sfxseller as b on b.id= a.seller_id
join coreengine_sellerprofile as c on c.id= b.seller_id
join coreengine_cluster as d on  d.id= b.cluster_id
where a.status!=302 and b.status=1 and store_type="F&B" and a.cluster_id!=1 and c.store_name not like '%Test%' and 
b.date_active<=adddate(curdate(),-1) and b.date_active>=adddate(curdate(),-8)
group by a.seller_id
order by city ,cluster_name ,partnership_period DESC 