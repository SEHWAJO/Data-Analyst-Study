--문제1번) 각 제품 가격을 5 % 줄이려면 어떻게 해야 할까요?

select productname, retailprice *0.95 
from products

--문제2번) 고객이 주문한 목록을 주문 일자로 내림차순 정렬해서 보여주세요.

select ordernumber, orderdate, customerid 
from orders 
order by orderdate desc
