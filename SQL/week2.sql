-- 2주차 실습문제 (3)


-- 문제1번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
-- join은 inner join과 같다.

select c.customer_id, c.first_name, c.last_name, c.email, a.address, a.district, a.postal_code, a.phone 
from customer c left outer join address a 
on c.address_id = a.address_id 


-- 문제2번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone , city 를 함께 알려주세요. 

select c.customer_id, c.first_name, c.last_name, c.email, a.address, a.district, a.postal_code, a.phone, c2.city 
from customer c left outer join address a 
on c.address_id = a.address_id
Left outer join city c2 
on a.city_id = c2.city_id 

-- 문제3번) Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요.

SELECT c.first_name, c.last_name, c.email, a.phone 
FROM customer c 
Left outer join address a on c.address_id = a.address_id
Left outer join city c2 on a.city_id = c2.city_id 
WHERE c2.city = 'Lima'

-- 문제4번) rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.

select r.*,
c.first_name , c.last_name ,
s.first_name , s.last_name
from rental r
left outer join customer c on r.customer_id  =  c.customer_id
left outer join staff s on r.staff_id  = s.staff_id

-- 문제5번) seth.hannon@sakilacustomer.org 이메일 주소를 가진 고객의 주소 address, address2, postal_code, phone, city 주소를 알려주세요.

select a.address , a.address2 , a.postal_code , a.phone, c2.city_id 
from customer c
left outer join address a on c.address_id = a.address_id 
left outer join city c2 on a.city_id = c2.city_id 
where c.email = 'seth.hannon@sakilacustomer.org'

-- 문제6번) Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를 확인하려고 합니다.
-- payment_id, 고객 이름 과 성, rental_id, amount, staff 이름과 성을 알려주세요.

SELECT p.payment_id, c.first_name, c.last_name, p.rental_id, p.amount, s.first_name, s.last_name 
FROM staff s left outer join payment p 
on s.staff_id = p.staff_id 
left outer join customer c 
on p.customer_id = c.customer_id 
where s.first_name = 'Jon'and s.last_name = 'Stephens'


-- 문제7번) 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length 를 알려주세요.

select f.film_id, f.title, f.release_year, f.rental_rate, f.length 
from film f left outer join film_actor f2
on f.film_id = f2.film_id 
where actor_id is Null

-- 문제8번) store 상점 id별 주소 (address, address2, distict) 와 해당 상점이 위치한 city 주소를 알려주세요.

select s.store_id, a.address, a.address2, a.district, c.city 
from store s left outer join address a 
on s.address_id = a.address_id
left outer join city c 
on a.city_id = c.city_id 

-- 문제9번) 고객의 id 별로 고객의 이름 (first_name, last_name), 이메일, 고객의 주소 (address, district), phone번호, city, country 를 알려주세요.

select c.first_name, c.last_name, c.email, a.address, a.district, a.phone, c2.city, c3.country 
from customer c left outer join address a 
on c.address_id = a.address_id
left outer join city c2 
on a.city_id = c2.city_id 
left outer join country c3 
on c2.country_id = c3.country_id 

-- 문제10번) country 가 china 가 아닌 지역에 사는, 고객의 이름(first_name, last_name)과 , email, phonenumber, country, city 를 알려주세요

select c.first_name, c.last_name, c.email, a.phone, c2.city, c3.country 
from customer c left outer join address a 
on c.address_id = a.address_id
left outer join city c2 
on a.city_id = c2.city_id 
left outer join country c3 
on c2.country_id = c3.country_id
where c3.country not in ('China')

-- 문제11번) Horror 카테고리 장르에 해당하는 영화의 이름과 description 에 대해서 알려주세요

select f.title, f.description 
from category c left outer join film_category fc 
on c.category_id = fc.category_id 
left outer join film f 
on fc.film_id = f.film_id 
where name = 'Horror'

-- 문제12번) Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length 를 알려주세요.
* 영화 길이가 짧은 순으로 정렬해서 알려주세요.

select  title, description, length 
from category c left outer join film_category fc 
on c.category_id = fc.category_id 
left outer join film f 
on fc.film_id = f.film_id 
where name = 'Music'
and f.length between 60 and 180
order by length


-- 문제13번) actor 테이블을 이용하여, 배우의 ID, 이름, 성 컬럼에 추가로 'Angels Life' 영화에 나온 영화 배우 여부를 Y , N 으로 컬럼을 추가 표기해주세요. 해당 컬럼은 angelslife_flag로 만들어주세요.

select actor_id, first_name, last_name, case when a.actor_id in (select actor_id
from film f
inner join film_actor fa 
on f.film_id  = fa.film_id
where f.title ='Angels Life') then 'Y'
else 'N'
end as Angelslife_flag
from actor a;

-- 문제14번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 이거나 고객의 이름이 (이름 성) ='Gloria Cook' 에 해당 하는 rental 의 모든 정보를 알려주세요.
* 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.

select r.*,
c.first_name , c.last_name ,
s.first_name , s.last_name
from rental r 	
left outer join customer as c on r.customer_id  =  c.customer_id
left outer join staff s on r.staff_id  = s.staff_id
where 
(s.first_name || ' ' || s.last_name = 'Mike Hillyer'
or c.first_name || ' ' || c.last_name = 'Gloria Cook')
and date(rental_date) between '2005-06-01' and '2005-06-14'

-- 문제15번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 에 해당 하는 직원에게 구매하지 않은 rental 의 모든 정보를 알려주세요.
* 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.


select r.*, 
c.first_name , c.last_name ,
s.first_name , s.last_name
from rental r left outer join customer c 
on r.customer_id = c.customer_id 
left outer join staff s 
on r.staff_id = s.staff_id 
where s.first_name || ' ' || s.last_name not in ('Mike Hillyer')
and date(rental_date) between '2005-06-01' and '2005-06-14'


-- 2주차 실습문제 (4)

-- 문제1번) store 별로 staff는 몇명이 있는지 확인해주세요.

select store_id, count(*)
from staff
group by store_id;


-- 문제2번) 영화등급(rating) 별로 몇개 영화film을 가지고 있는지 확인해주세요.

select rating, count(film_id)
from film
group by rating

-- 문제3번) 출현한 영화배우(actor)가 10명 초과한 영화명은 무엇인가요?

select f.title, fc.count
from 
(
select fa.film_id , count(actor_id) as count
from film_actor fa
group by fa.film_id
having count(actor_id) > 10
) fc
inner join film f
on fc.film_id = f.film_id 
;


-- 문제4번) 영화 배우(actor)들이 출연한 영화는 각각 몇 편인가요?
-- 영화 배우의 이름 , 성 과 함께 출연 영화 수를 알려주세요.

select a.first_name, a.last_name, fa.count
from 
(select actor_id , count(film_id) as count
from film_actor
group by actor_id) fa
inner join actor a
on fa.actor_id = a.actor_id;

-- 문제5번) 국가(country)별 고객(customer) 는 몇명인가요?

select c3.country, count(c.customer_id) 
from customer c 
inner join address a on c.address_id = a.address_id 
inner join city c2 on a.city_id = c2.city_id
inner join country c3 on c2.country_id = c3.country_id 
group by c3.country



