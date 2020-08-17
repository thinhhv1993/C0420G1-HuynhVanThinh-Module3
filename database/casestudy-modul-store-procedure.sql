use furama;

DELIMITER  //

CREATE PROCEDURE `delete_service_by_id`(IN service_id INT)
BEGIN

    delete from service where    service.service_id = service_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_service`()
BEGIN

    SELECT *
    FROM service s 
    join rent_type rt on rt.rent_type_id = s.rent_type_id
	join service_type st on st.service_type_id = s.service_type_id;
    
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_service_by_id`(IN service_id INT)
BEGIN

    SELECT *

    FROM service s 
    join rent_type rt on rt.rent_type_id = s.rent_type_id
	join service_type st on st.service_type_id = s.service_type_id
    where s.service_id = service_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_service_by_name`(IN service_name varchar(50))
BEGIN

    SELECT *

    FROM service s 
    join rent_type rt on rt.rent_type_id = s.rent_type_id
	join service_type st on st.service_type_id = s.service_type_id
    where s.service_name like  concat ('%',service_name,'%');

    END //
    
DELIMITER ;


DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_service`(
IN service_name varchar(50),
IN service_area int,
IN service_cost double,
IN service_max_people int,
IN standard_room varchar(45),
IN description_orther_conveniece varchar(45),
IN pool_area double,
IN number_of_floors int,
IN rent_type_id int,
IN service_type_id int
)
BEGIN
    INSERT INTO service(service_name,
    service_area, 
    service_cost,
    service_max_people,
    standard_room,
    description_orther_conveniece,
    pool_area,
    number_of_floors,
    rent_type_id,
    service_type_id )
    VALUES(service_name,
    service_area, 
    service_cost,
    service_max_people,
    standard_room,
    description_orther_conveniece,
    pool_area,
    number_of_floors,
    rent_type_id,
    service_type_id);

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_service`(
IN service_id int,
IN service_name varchar(50),
IN service_area int,
IN service_cost double,
IN service_max_people int,
IN standard_room varchar(45),
IN description_orther_conveniece varchar(45),
IN pool_area double,
IN number_of_floors int,
IN rent_type_id int,
IN service_type_id int
)
BEGIN

    update  service 
    set service.service_name =	service_name, service.service_area = service_area, service.service_cost = service_cost,
    service.service_max_people = service_max_people, service.rent_type_id = rent_type_id, service.service_type_id = service_type_id,
    service.standard_room = standard_room, service.description_orther_conveniece = description_orther_conveniece, service.pool_area = pool_area,
    service.number_of_floors = number_of_floors
    where service.service_id = service_id;

    END  //
    
DELIMITER ;

-----------------------------------------------------------------------------------

DELIMITER  //

CREATE PROCEDURE `delete_customer_by_id`(IN customer_id INT)
BEGIN

    delete from customer where   customer.customer_id = customer_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer`()
BEGIN

    SELECT *
    FROM customer c 
    join customer_type ct on ct.customer_type_id = c.customer_type_id;
    
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_by_id`(IN customer_id INT)
BEGIN

    SELECT *

    FROM customer c
	join customer_type ct on ct.customer_type_id = c.customer_type_id
    where c.customer_id = customer_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_by_name`(IN customer_name varchar(50))
BEGIN

    SELECT *

    FROM customer c
    join customer_type ct on ct.customer_type_id = c.customer_type_id
    where c.customer_name like  concat ('%',customer_name,'%');

    END //
    
DELIMITER ;


DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer`(
IN `customer_type_id` int,
IN `customer_name` varchar(45),
IN `customer_birthday` date,
IN `customer_gender` varchar(10),
IN `customer_id_card` varchar(45),
IN `customer_phone` varchar(45),
IN `customer_email` varchar(45),
IN `customer_address` varchar(45)
)
BEGIN
    INSERT INTO customer(customer_type_id,
    customer_name, 
    customer_birthday,
    customer_gender,
    customer_id_card,
    customer_phone,
    customer_email,
    customer_address)
    VALUES(customer_type_id,
    customer_name, 
    customer_birthday,
    customer_gender,
	customer_id_card,
    customer_phone,
    customer_email,
    customer_address);
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer`(
IN `customer_id` int,
IN `customer_type_id` int,
IN `customer_name` varchar(45),
IN `customer_birthday` date,
IN `customer_gender` varchar(10),
IN `customer_id_card` varchar(45),
IN `customer_phone` varchar(45),
IN `customer_email` varchar(45),
IN `customer_address` varchar(45)
)
BEGIN

    update  customer c
    set c.customer_type_id = customer_type_id, 
    c.customer_name = customer_name,
    c.customer_birthday = customer_birthday,
    c.customer_gender = customer_gender,
    c.customer_id_card = customer_id_card,
    c.customer_phone = customer_phone,
    c.customer_email = customer_email,
    c.customer_address= customer_address
    where c.customer_id = customer_id;

    END  //
    
DELIMITER ;

-- -----------------------------------------------------------

DELIMITER  //

CREATE PROCEDURE `delete_employee_by_id`(IN employee_id INT)
BEGIN

    delete from employee where   employee.employee_id = employee_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee`()
    
BEGIN

    SELECT *
    FROM employee e 
    join position p on p.position_id = e.position_id
    join education_degree ed on ed.education_degree_id = e.education_degree_id
    join division d on d.division_id = e.division_id;
    
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_by_id`(IN employee_id INT)
BEGIN

    SELECT *

	FROM employee e 
    join position p on p.position_id = e.position_id
    join education_degree ed on ed.education_degree_id = e.education_degree_id
    join division d on d.division_id = e.division_id
    where e.employee_id = employee_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_by_name`(IN employee_name varchar(50))
BEGIN

    SELECT *

	FROM employee e 
    join position p on p.position_id = e.position_id
    join education_degree ed on ed.education_degree_id = e.education_degree_id
    join division d on d.division_id = e.division_id
    where e.employee_name like  concat ('%',employee_name,'%');

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employee`(
IN `employee_name` varchar(45),
IN  `employee_birthday` date,
IN  `employee_id_card` varchar(45),
IN  `employee_salary` double,
IN  `employee_phone` varchar(45),
IN `employee_email` varchar(45),
IN  `employee_address` varchar(45),
IN  `position_id` int,
IN  `education_degree_id` int,
IN  `division_id` int
)
BEGIN
    INSERT INTO employee(
    employee_name, 
    employee_birthday,
    employee_id_card,
    employee_salary,
    employee_phone,
    employee_email,
    employee_address,
    position_id,
    education_degree_id,
    division_id)
    VALUES (
    employee_name, 
    employee_birthday,
    employee_id_card,
    employee_salary,
    employee_phone,
    employee_email,
    employee_address,
    position_id,
    education_degree_id,
    division_id);
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee`(
IN `employee_id` int,
IN `employee_name` varchar(45),
IN `employee_birthday` date,
IN `employee_id_card` varchar(45),
IN `employee_salary` double,
IN `employee_phone` varchar(45),
IN `employee_email` varchar(45),
IN `employee_address` varchar(45),
IN `position_id` int,
IN `education_degree_id` int,
IN `division_id` int
)
BEGIN

    update  employee e
    set 
    e.employee_name = employee_name,
    e.employee_birthday = employee_birthday,
    e.employee_id_card = employee_id_card,
    e.employee_salary = employee_salary,
    e.employee_phone = employee_phone,
    e.employee_email = employee_email,
    e.employee_address = employee_address,
    e.position_id= position_id,
    e.education_degree_id= education_degree_id,
    e.division_id= division_id
    where e.employee_id = employee_id;

    END  //
    
DELIMITER ;

-- --------------------------------------------------------
DELIMITER  //

CREATE PROCEDURE `delete_contract_by_id`(IN contract_id INT)
BEGIN

    delete from contract where   contract.contract_id = contract_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract`()
    
BEGIN

    SELECT *
    FROM contract c 
    join employee e on e.employee_id = c.employee_id
    join customer ct on ct.customer_id = c.customer_id
    join service s on s.service_id = c.service_id;
    
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract_by_id`(IN contract_id INT)
BEGIN

    SELECT *

	FROM contract c 
    join employee e on e.employee_id = c.employee_id
    join customer ct on ct.customer_id = c.customer_id
    join service s on s.service_id = c.service_id
    where c.contract_id = contract_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract_by_name`(IN contract_name varchar(50))
BEGIN

    SELECT *

	FROM contract c 
    join employee e on e.employee_id = c.employee_id
    join customer ct on ct.customer_id = c.customer_id
    join service s on s.service_id = c.service_id
    where e.employee_name like  concat ('%',contract_name,'%') 
    or ct.customer_name like concat ('%',contract_name,'%') 
    or s.service_name like concat ('%',contract_name,'%') ;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_contract`(
IN `contract_start_date` date,
IN  `contract_end_date` date,
IN  `contract_deposit` double,
IN  `contract_total_money` double,
IN  `employee_id` int,
IN  `customer_id` int,
IN  `service_id` int
)
BEGIN
    INSERT INTO contract(
    contract_start_date, 
    contract_end_date,
    contract_deposit,
    contract_total_money,
    employee_id,
    customer_id,
    service_id)
    VALUES (
    contract_start_date, 
    contract_end_date,
    contract_deposit,
    contract_total_money,
    employee_id,
    customer_id,
    service_id);
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_contract`(
IN `contract_id` int,
IN `contract_start_date` date,
IN  `contract_end_date` date,
IN  `contract_deposit` double,
IN  `contract_total_money` double,
IN  `employee_id` int,
IN  `customer_id` int,
IN  `service_id` int
)
BEGIN

    update  contract c
    set 
    c.contract_start_date = contract_start_date,
    c.contract_end_date = contract_end_date,
    c.contract_deposit = contract_deposit,
    c.contract_total_money = contract_total_money,
    c.employee_id = employee_id,
    c.customer_id = customer_id,
    c.service_id= service_id
    where   c.contract_id = contract_id;

    END  //
    
DELIMITER ;

-- --------------------------------------------------------

DELIMITER  //

CREATE PROCEDURE `delete_contract_detail_by_id`(IN contract_detail_id INT)
BEGIN

    delete from contract_detail where   contract_detail.contract_detail_id = contract_detail_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract_detail`()
    
BEGIN

    SELECT *
    FROM contract_detail cd
    join contract c on c.contract_id = cd.contract_id
    join attach_service a on a.attach_service_id = cd.attach_service_id;
    
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract_detail_by_id`(IN contract_detail_id INT)
BEGIN

    SELECT *

    FROM contract_detail cd
    join contract c on c.contract_id = cd.contract_id
    join attach_service a on a.attach_service_id = cd.attach_service_id
    where cd.contract_detail_id = contract_detail_id;

    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contract_detail_by_name`(IN contract_id int)
BEGIN

    SELECT *

	 FROM contract_detail cd
    join contract c on c.contract_id = cd.contract_id
    join attach_service a on a.attach_service_id = cd.attach_service_id
    where c.contract_id like  concat ('%',contract_id,'%') ;
  
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_contract_detail`(
IN  `contract_id` int ,
IN  `attach_service_id` int ,
IN  `quatity` int 
)
BEGIN
    INSERT INTO contract_detail(
    contract_id, 
    attach_service_id,
    quatity)
    VALUES (
    contract_id, 
    attach_service_id,
    quatity);
    END //
    
DELIMITER ;

DELIMITER //

    CREATE DEFINER=`root`@`localhost` PROCEDURE `update_contract_detail`(
IN  `contract_detail_id` int,
IN  `contract_id` int ,
IN  `attach_service_id` int ,
IN  `quatity` int 
)
BEGIN

    update  contract_detail c
    set 
    c.contract_id = contract_id,
    c.attach_service_id = attach_service_id,
    c.quatity = quatity
    where   c.contract_detail_id = contract_detail_id;

    END  //
    
DELIMITER ;

