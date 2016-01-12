select a.rider_id as 'Rider sfx_id',e.rider_id as 'Rider_ID',concat(d.first_name,' ',d.last_name) as 'Rider Name',
f.cluster_name,
case f.city
when 'GGN' then 'Gurgaon'
when 'BOM' then 'Mumbai'
when 'DEL' then 'Delhi'
when 'BLR' then 'Bangalore'
when 'NOIDA' then 'Noida' end as City,
f.operational_city as 'Operational City',
count(a.id) as 'Order_Count',
sum(case when a.delivered_flag = 1 then 1 else 0 end) as 'Orders Through App'
from coreengine_order a,coreengine_riderprofile d,coreengine_sfxrider e,
coreengine_cluster f
where a.rider_id = e.id and e.rider_id = d.id and e.cluster_id = f.id
and date(a.order_time) >= '2016-01-07' and date(a.order_time) <= '2016-01-08'
and f.cluster_name not like "%test%" and a.status!=302 group by a.rider_id;