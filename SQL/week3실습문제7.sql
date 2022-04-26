
-— 문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping sets)

SELECT store_id , count(*)
FROM inventory i 
GROUP BY GROUPING SETS ((store_id),())


-— 문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)

SELECT store_id , count(*)
FROM inventory i 
GROUP BY rollup (store_id)


—- 문제3번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (grouping sets)

SELECT country, city, sum(amount)
FROM payment p 
INNER JOIN customer c ON p.customer_id =c.customer_id 
INNER JOIN address a ON c.address_id = a.address_id 
INNER JOIN city c2 ON c2.city_id  = a.city_id 
INNER JOIN country c3 ON c2.country_id = c3.country_id 
GROUP BY grouping sets (country, city), (country), ()
ORDER BY country, city


—- 신기하게 이렇게 써도 된다.

SELECT c3.country, c2.city, sum(p.amount)
FROM payment p 
JOIN customer c USING (customer_id)
JOIN address a USING (address_id)
JOIN city c2 USING (city_id)
JOIN country c3 USING (country_id)
GROUP BY GROUPING SETS (country, city), (country), ()
ORDER BY country


—- 문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)

SELECT country, city, sum(amount)
FROM payment p 
INNER JOIN customer c ON p.customer_id =c.customer_id 
INNER JOIN address a ON c.address_id = a.address_id 
INNER JOIN city c2 ON c2.city_id  = a.city_id 
INNER JOIN country c3 ON c2.country_id = c3.country_id 
group by rollup (country, city)
ORDER BY country, city


-— 문제5번) 영화배우별로  출연한 영화 count 수 와,   모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.

SELECT actor_id, count(DISTINCT fa.film_id)
FROM film_actor fa 
GROUP by GROUPING SETS ((actor_id),())


-— 문제6번) 국가 (Country)별, 도시(City)별  고객의 수와 ,  전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)

SELECT country, city, count(customer_id)
FROM customer c
JOIN address a ON c.address_id = a.address_id 
JOIN city c2 ON a.city_id = c2.city_id 
JOIN country c3 ON c2.country_id = c3.country_id 
GROUP BY GROUPING SETS ((country, city), (country), ())


-— 문제7번) 영화에서 사용한 언어와  영화 개봉 연도 에 대한 영화  갯수와  , 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.

select language_id, release_year, count(film_id)
from film f 
group by grouping sets ((language_id, release_year), (release_year));


-- 문제8번) 연도별, 일별 결제  수량과,  연도별 결제 수량을 함께 보여주세요. 결제수량은 결제 의 id 갯수 를 의미합니다.
-- COALESCE('A','B') - null이 아닌 값을 리턴한다. 

SELECT to_char(payment_date, 'YYYY') AS "Year", 
       COALESCE (to_char(payment_date, 'MM-DD'), 'Total') AS "Date", 
       count(payment_id)
FROM payment
GROUP BY 
GROUPING SETS (to_char(payment_date, 'YYYY'), to_char(payment_date, 'MM-DD')), (to_char(payment_date, 'YYYY'))
ORDER BY "Date"


--문제9번) 지점 별, active 고객의 수와 , active 고객 수 를 함께 보여주세요. 지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
--grouping sets 를 이용해서 풀이해주세요.

select store_id, active, count(customer_id)
from customer c 
group by grouping sets((store_id, active), (active));
                        
--문제10번) 지점 별, active 고객의 수와 , active 고객 수 를 함께 보여주세요. 지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
-- * roll up으로 풀이해보면서, grouping sets 과의 차이를 확인해보세요.

select store_id, active, count(customer_id) as cnt
from customer c 
group by rollup(store_id, active)
;

