--- 문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)

select c.first_name, c.last_name 
from customer c
where c.customer_id in (select customer_id
from payment p 
group by customer_id
order by sum(amount) desc
limit 1)
