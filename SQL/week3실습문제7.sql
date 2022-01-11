--문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping set)

select store_id, count(*)
from inventory i 
group by grouping sets ((store_id), ());

--문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)

select store_id, count(*)
from inventory i 
group by rollup (store_id);

--문제3번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (grouping set)

select c3.country, c2.city, sum(p.amount)  
from payment p 
inner join customer c on p.customer_id = c.customer_id 
inner join address a on a.address_id = c.address_id 
inner join city c2 on c2.city_id = a.city_id 
inner join country c3 on c3.country_id = c2.country_id
group by grouping sets ((c3.country, c2.city) , (c3.country) , () )
order by c3.country, c2.city
;

--문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)

select c3.country, c2.city, sum(p.amount)  
from payment p 
inner join customer c on p.customer_id = c.customer_id 
inner join address a on a.address_id = c.address_id 
inner join city c2 on c2.city_id = a.city_id 
inner join country c3 on c3.country_id = c2.country_id
group by rollup (c3.country, c2.city)
order by c3.country, c2.city
;
