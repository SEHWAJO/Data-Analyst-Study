--문제1번) 각 제품 가격을 5 % 줄이려면 어떻게 해야 할까요?

select productname, retailprice *0.95 
from products

--문제2번) 고객이 주문한 목록을 주문 일자로 내림차순 정렬해서 보여주세요.

select ordernumber, orderdate, customerid 
from orders 
order by orderdate desc

--문제4번) customers 테이블을 이용하여,  고객의 이름과 성을 하나의 컬럼으로 전체 이름을 보여주세요 (이름, 성 의 형태로  full_name 이라는 이름으로 보여주세요)

select first_name ||', '|| last_name  as  full_name
from customer

--문제5번) orders 테이블을 활용하여, 고객번호가 1001 에 해당하는 사람이 employeeid 가 707인 직원으로부터  산 주문의 id 와 주문 날짜를 알려주세요.
-- 주문일자 빠른순으로 정렬하여, 보여주세요.
select ordernumber, orderdate
from orders
where customerid =1001
and employeeid=707
order by ordernumber ASC

--문제6번)  vendors 테이블을 이용하여, 벤더가 위치한 state 주가 어떻게 되는지, 확인해보세요.  중복된 주가 있다면, 중복제거 후에 알려주세요.
select distinct vendstate
from vendors v

--문제7번) 주문일자가  2017-09-02~ 09-03일 사이에 해당하는 주문 번호를 알려주세요.
select ordernumber
from orders
where orderdate between '2017-09-02' and '2017-09-03'
