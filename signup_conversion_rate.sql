use signup_flow;
with total_visitors as (select v.visitor_id,
                               v.first_visit_date,
                               s.date_registered as registration_date,
                               max(p.purchase_date) as purchase_date 
						from visitors v left join students s on v.user_id=s.user_id
						left join  student_purchases p on v.user_id=p.user_id group by visitor_id),
count_visitors as 
( select first_visit_date as date_session , 
         count(*) as visitors_count 
         from total_visitors 
         group by date_session),
         
count_registered as
( select first_visit_date as date_session , 
         count(*) as count_registered 
         from total_visitors where  registration_date is not null
         group by date_session),
                               
 count_registered_free as( select first_visit_date as date_session,
								  count(*) as registered_free
                                  from total_visitors where registration_date is not null and
                                  (purchase_date is null or timestampdiff(minute, registration_date,purchase_date)>30)
                                  group by date_session)
                                  
select v.date_session,v.visitors_count, ifnull(r.count_registered,0) as count_registered, ifnull(f.registered_free,0) as free_registered
		from count_visitors v left join count_registered r on v.date_session = r.date_session 
        left join count_registered_free f on r.date_session=f.date_session
        where v.date_session< '2023-02-01'
        order by v.date_session
