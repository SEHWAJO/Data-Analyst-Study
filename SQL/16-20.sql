
# 문제16번) langugage 테이블에 있는 id, name 컬럼을 확인해보세요 .

SELECT language_id, name
FROM language


# 문제17번) film 테이블을 활용하여, rental_duration 이 7일 이상 대여가 가능한 film 에 대해서 film_id, title, description 컬럼을 확인해보세요.

SELECT film_id, title, description
FROM film
WHERE rental_duration >= 7


# 문제18번) film 테이블을 활용하여, rental_duration 대여가 가능한 일자가 3일 또는 5일에 해당하는 film_id, title, desciption 을 확인해주세요.

SELECT film_id, title, description
FROM film
WHERE rental_duration = 3
OR rental_duration = 5


# 문제19번) Actor 테이블을 이용하여, 이름이 Nick 이거나 성이 Hunt 인 배우의 id 와 이름, 성을 확인해주세요.

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = ‘Nick’
OR last_name = ‘Hunt’


#문제20번) Actor 테이블을 이용하여, Actor 테이블의 first_name 컬럼과 last_name 컬럼을 , firstname, lastname 으로 컬럼명을 바꿔서 보여주세요

SELECT first_name AS first name, last_nam AS last name
FROM actor
