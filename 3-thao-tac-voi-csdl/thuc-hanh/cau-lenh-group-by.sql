use classicmodels;

-- muốn biết có bao nhiêu đơn đặt hàng trong mỗi trạng thái, chúng ta có thể sử dụng hàm COUNT với mệnh đề GROUP BY 
select status, COUNT(*) as 'So luong status'
from orders
group by status;

-- thực hiện tính tổng số tiền của các đơn hàng theo trạng thái đặt hàng
select status, sum(quantityOrdered * priceEach) as amount
from orders 
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status;

-- tính tổng tiền của từng đơn hàng thực hiện lệnh truy vấn
select orderNumber, sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;

-- tổng doanh thu của những năm lớn hơn năm 2003.
select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders 
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where status = 'shipped'
group by year
having year > 2003;