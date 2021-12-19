--문제4번) 지불 내역 중에서, 지불 내역 번호가 17510 에 해당하는 , 고객의 지출 내역 (amount ) 는 얼마인가요?

SELECT amount
FROM payment
WHERE payment_id = 17510
