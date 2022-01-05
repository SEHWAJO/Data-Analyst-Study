-- 문제1번) 영화 배우가, 영화 180분 이상의 길이 의 영화에 출연하거나, 영화의 rating 이 R 인 등급에 해당하는 영화에 출연한 영화 배우에 대해서, 영화 배우 ID 와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
-- * film_actor 테이블와 film 테이블을 이용하세요.
-- * union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
-- * actor_id 가 동일한 flag 값 이 여러개 나오지 않도록 해주세요. - UNION을 쓰면 두 테이블을 합쳐줌 (중복된 값은 하나로 보여줌)

select actor_id, 'length_over_180' as flag
from film_actor fa 
where film_id in (select film_id 
				  from film
				  where length >= 180)

union 

select actor_id, 'rating_R' as flag
from film_actor fa
where film_id in (select film_id
				  from film 
				  where rating = 'R')
order by —actor_id 내가 보기 편하려고 추가함



-- 문제2번) R등급의 영화에 출연했던 배우이면서, 동시에, Alone Trip의 영화에 출연한 영화배우의 ID 를 확인해주세요.
-- * film_actor 테이블와 film 테이블을 이용하세요.
-- * union, unionall, intersect, except 중 상황에 맞게 사용해주세요.

-- INTERSECT는 교집합을 구한다.

select actor_id
from film_actor fa 
where film_id in
(select film_id
from film f
where rating = 'R')

INTERSECT

select actor_id 
from film_actor fa
where film_id in
(select film_id
from film f
where title = 'Alone Trip')


-- 문제3번) G 등급에 해당하는 필름을 찍었으나, 영화를 20편이상 찍지 않은 영화배우의 ID 를 확인해주세요.
-- * film_actor 테이블와 film 테이블을 이용하세요.
-- * union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
select actor_id
from film_actor fa 
where film_id in
(select film_id
from film f
where rating = 'G')

except

select actor_id
from film_actor fa
group by actor_id
having count(DISTINCT film_id) < 20


-- 문제4번) 필름 중에서, 필름 카테고리가 Action, Animation, Horror 에 해당하지 않는 필름 아이디를 알려주세요.
-- * category 테이블을 이용해서 알려주세요.

select film_id
from film

except

select film_id
from film_category fc 
where category_id in
(select category_id 
from category c 
where name in ('Action', 'Animation', 'Horror'))



-- 문제5번) Staff 의 id , 이름, 성 에 대한 데이터와 , Customer 의 id, 이름 , 성에 대한 데이터를 하나의 데이터셋의 형태로 보여주세요.
-- * 컬럼 구성 : id, 이름 , 성, flag (직원/고객여부) 로 구성해주세요.

select staff_id, s.first_name, s.last_name, '직원' as flag
from staff s

union ALL

select customer_id, c.first_name, c.last_name, '고객' as flag
from customer c


-- 문제6번) 직원과 고객의 이름이 동일한 사람이 혹시 있나요? 있다면, 해당 사람의 이름과 성을 알려주세요.

select s.first_name, s.last_name 
from staff s
INTERSECT
select c.first_name, c.last_name 
from customer c


-- 문제7번) 반납이 되지 않은 대여점(store)별 영화 재고 (inventory)와 전체 영화 재고를 같이 구하세요. (union all)

select null as null,count(*) cnt
from rental r inner join inventory i 
on r.inventory_id = i.inventory_id 
where return_date is null 
union all
select i.store_id, count(*) cnt
from rental r inner join inventory i 
on r.inventory_id = i.inventory_id 
where return_date is null 
group by i.store_id


-- 문제8번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (union all)

select c3.country, c2.city, sum(p.amount)
from payment p 
inner join customer c on p.customer_id = c.customer_id 
inner join address a on c.address_id = a.address_id 
inner join city c2 on a.city_id = c2.city_id 
inner join country c3 on c2.country_id = c3.country_id 
group by c3.country, c2.city
union all
select c3.country, null, sum(p.amount)
from payment p 
inner join customer c on p.customer_id = c.customer_id 
inner join address a on c.address_id = a.address_id 
inner join city c2 on a.city_id = c2.city_id 
inner join country c3 on c2.country_id = c3.country_id 
group by c3.country
union all
select null, null, sum(p.amount)
from payment p 
inner join customer c on p.customer_id = c.customer_id 
inner join address a on c.address_id = a.address_id 
inner join city c2 on a.city_id = c2.city_id 
inner join country c3 on c2.country_id = c3.country_id 
order by 1,2;
