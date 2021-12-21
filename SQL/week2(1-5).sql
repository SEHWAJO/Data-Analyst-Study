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