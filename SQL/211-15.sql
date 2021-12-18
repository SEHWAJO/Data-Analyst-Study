# 문제11번) 영화배우의 이름 (이름+' '+성) 에 대해서, 대문자로 이름을 보여주세요. 단 고객의 이름이 동일한 사람이 있다면, 중복 제거하고, 알려주세요.
# || 는 문자열이나 컬럼을 합쳐주는 역할을 한다.

SELECT DISTINCT upper(first_name ||’ ‘|| last_name)
FROM actor


# 문제12번) 고객 중에서, active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.

SELECT COUNT(DISTINCT customer_id)
FROM customer
WHERE active == 0


# 문제13번) Customer 테이블을 활용하여, store_id = 1 에 매핑된 고객의 수는 몇명인지 확인해보세요.

SELECT COUNT(DISTINCT customer_id)
FROM customer
WHERE store_id = 1


# 문제14번) rental 테이블을 활용하여, 고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental 의 갯수가 몇개였는지 확인해보세요.

SELECT COUNT(DISTINCT rental_id)
FROM rental
WHERE return_date = ‘2005-06–20’


# 문제15번) film 테이블을 활용하여, 2006년에 출시가 되고 rating 이 'G' 등급에 해당하며, 대여기간이 3일에 해당하는 것에 대한 film 테이블의 모든 컬럼을 알려주세요.

WHERE *
FROM film
WHERE release_year = 2006 
AND rating = ‘G’ 
AND rental_duration = 3
