--- 문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)

select c.first_name, c.last_name 
from customer c
where c.customer_id in (select customer_id
from payment p 
group by customer_id
order by sum(amount) desc
limit 1)

--- 문제2번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)

select c.name
from category c 
where exists (
select fc.category_id 
from rental as r
join inventory as i on r.inventory_id = i.inventory_id 
join film_category fc on i.film_id = fc.film_id
)

--- 문제3번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다)

select c.name 
from category c 
where category_id = any (
select fc.category_id
from rental as r
join inventory i on r.inventory_id = i.inventory_id 
join film_category fc on i.film_id = fc.film_id 
)
