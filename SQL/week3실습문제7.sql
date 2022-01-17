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


--문제5번) 영화배우별로 출연한 영화 count 수 와, 모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.

select actor_id, count(*)
from film_actor fa 
group by rollup(actor_id)
;

--문제6번) 국가 (Country)별, 도시(City)별 고객의 수와 , 전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)

select c2.country, ct.city, count(distinct customer_id)
from customer c 
inner join address a on a.address_id = c.address_id 
inner join city ct on ct.city_id = a.city_id 
inner join country c2 on c2.country_id = ct.country_id 
group by grouping sets ((c2.country, ct.city), (c2.country))
order by c2.country , ct.city;

--문제7번) 영화에서 사용한 언어와 영화 개봉 연도 에 대한 영화 갯수와 , 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.

select language_id, release_year , count(film_id)
from film f 
group by grouping sets ((language_id, release_year), (release_year) 
;
                        
--문제8번) 연도별, 일별 결제 수량과, 연도별 결제 수량을 함께 보여주세요.
* 결제수량은 결제 의 id 갯수 를 의미합니다.
* 
select substring(cast(payment_date as varchar), 1,4) as year,
substring(cast(payment_date as varchar),1,10) as date, 
count(payment_id) as cnt 
from payment p
group by grouping sets (
(substring(cast(payment_date as varchar), 1,4), substring(cast(payment_date as varchar), 1,10)), substring(cast(payment_date as varchar), 1,4));

--문제9번) 지점 별, active 고객의 수와 , active 고객 수 를 함께 보여주세요. 지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
--grouping sets 를 이용해서 풀이해주세요.

select store_id, active, count(customer_id)
from customer c 
group by grouping sets((store_id, active), (active));
