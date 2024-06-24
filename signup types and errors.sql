use signup_flow;
#checking items in actions table
select * from actions;
set GLOBAL sql_mode = ( SELECT REPLACE (@@sql_mode , ' ONLY_FULL_GROUP_BY' ,''));
#checking diferent types of signup

select a.visitor_id,
	s.user_id,
	ANY_VALUE(CAST(s.date_registered AS DATE)) AS registration_date,
    ANY_VALUE(CAST(a.action_date AS DATE)) AS signup_date,
    any_value(case 
		when a.action_name like "%google%" then 'google'
        when a.action_name like '%facebook%' then 'facebook'
        when a.action_name like '%linkedin%' then 'linkedin'
        else 'mail'
        end) as signup_method,
        
	ANY_VALUE(case when 
                a.action_name like "%success%" 
                and s.date_registered is not null 
                and cast(a.action_date as date)=cast(s.date_registered as date)
                then 'direct success'
                
			when a.action_name like  "%fail%" 
				and s.date_registered is null
			then  'fail'
             WHEN
                    a.action_name LIKE '%fail%'
                        AND s.date_registered IS NOT NULL
                        AND CAST(s.date_registered AS DATE) >= CAST(a.action_date AS DATE)
              THEN
                    'successful retry'
            END) AS signup_attempt,
            
    ANY_VALUE(IFNULL(e.error_text, '')) AS error_message,
    ANY_VALUE(se.session_os) AS session_os,
    ANY_VALUE(CASE
                WHEN
                    se.session_os LIKE '%Android%'
                        OR se.session_os LIKE '%iOS%'
                THEN
                    'mobile'
                WHEN
                    se.session_os LIKE '%Windows%'
                        OR se.session_os LIKE '%Linux%'
                        OR se.session_os LIKE 'OS%'
                        OR se.session_os LIKE '%Ubuntu%'
                        OR se.session_os LIKE '%Chrome%'
                THEN
                    'desktop'
                ELSE 'other'
            END) AS device
 FROM
    actions a
        LEFT JOIN
    visitors v ON a.visitor_id = v.visitor_id
        LEFT JOIN
    students s ON v.user_id = s.user_id
        LEFT JOIN
    error_messages e ON a.error_id = e.error_id
        LEFT JOIN
    sessions se ON a.visitor_id = se.visitor_id

WHERE
    a.action_name LIKE '%sign%'
        AND a.action_name LIKE '%click%'
        AND (a.action_name LIKE '%success%'
        OR a.action_name LIKE '%fail%')
        AND v.first_visit_date >= '2022-07-01'
        AND a.action_date BETWEEN '2022-07-01' AND '2023-02-01'
GROUP BY a.visitor_id
HAVING signup_attempt IS NOT NULL
ORDER BY signup_date;



                
	
                                               
