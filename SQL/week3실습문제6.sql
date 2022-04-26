--- 문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)

select first_name, last_name 
from customer c 
where customer_id in
(
select customer_id
from payment p 
group by customer_id 
order by sum(amount) desc
limit 1
);

--- 문제2번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)

select c.name
from category c 
where exists (
select fc.category_id 
from rental as r
join inventory as i on r.inventory_id = i.inventory_id 
join film_category fc on i.film_id = fc.film_id
)

--- 문제3번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다) - '=ANY' 이거랑 'IN' 이거랑 같은 결과

select name
from category c 
where category_id = any
(
select fc.category_id
from rental r
inner join inventory i ON r.inventory_id = i.inventory_id 
inner join film_category fc on i.film_id = fc.film_id 
);



--- 문제4번) 대여가 가장 많이 진행된 카테고리는 무엇인가요? (Any, All 조건 중 하나를 사용하여 풀어봅시다)

select c.category_id, c.name
from category c 
where category_id =any (
select fc.category_id
from rental r
inner join inventory i ON r.inventory_id = i.inventory_id 
inner join film_category fc on i.film_id = fc.film_id
group by fc.category_id
order by count(rental_id) desc 
limit 1
);

--- 문제5번) dvd 대여를 제일 많이한 고객 이름은? (subquery 활용)

select first_name, last_name
from customer c 
where customer_id in
(select customer_id
from rental r 
group by customer_id 
order by count(rental_id) desc 
limit 1);

--- 문제6번) 영화 카테고리값이 존재하지 않는 영화가 있나요?

SELECT *
FROM  film f 
WHERE film_id not in (
SELECT film_id 
FROM film_category fc);

/* 참고사항 */
    * IN, EXISTS 는 함수는 다르나 동일한 결과물을 내는 것이라고 생각해도 된다.
    * 하지만 NOT IN, NOT EXISTS 는 NULL 에 의한 차이가 존재한다.
    
in = exists
not in != not exists   (전제조건은 null,  null 이 데이터셋에 들어있을때는 같지않음. 단 NULL이없으면 같다.)
not in  + null   = not exists

