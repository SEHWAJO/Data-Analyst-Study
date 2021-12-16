# 문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.

SELECT *
FROM rental
WHERE DATE(return_date)  - DATE(rental_date) +1 >= 10
