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


