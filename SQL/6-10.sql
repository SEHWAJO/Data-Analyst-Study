-- 문제6번) film 테이블을 활용하여, rating 등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요.

SELECT DISTINCT (rating)
FROM film


-- 문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.

SELECT *
FROM rental
WHERE DATE(return_date)  - DATE(rental_date) +1 >= 10


-- 문제8번) 고객의 id 가 50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서, 회원 가입 감사 이벤트를 진행하려고합니다. 고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서 확인해주세요.
-- MOD 함수를 이용하면 나머지를 구할 수 있습니다.

SELECT customer_id, first_name, last_name
FROM customer_id
WHERE MOD(customer_id, 50) = 0


-- 문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.

SELECT title
FROM film
WHERE length(title) = 8

   
-- 문제10번) city 테이블의 city 갯수는 몇개인가요?

SELECT COUNT(*)
FROM city
