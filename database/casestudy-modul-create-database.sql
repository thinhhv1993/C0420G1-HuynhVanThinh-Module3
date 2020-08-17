drop database if exists furama;

create database furama;

use furama;

CREATE TABLE `rent_type` (
  `rent_type_id` int NOT NULL AUTO_INCREMENT,
  `rent_type_name` varchar(50) DEFAULT NULL,
  `rent_type_cost` double DEFAULT NULL,
  PRIMARY KEY (`rent_type_id`)
);

CREATE TABLE `service_type` (
  `service_type_id` int NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_type_id`)
);

CREATE TABLE `service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) DEFAULT NULL,
  `service_area` int DEFAULT NULL,
  `service_cost` double DEFAULT NULL,
  `service_max_people` int DEFAULT NULL,
  `rent_type_id` int DEFAULT NULL,
  `service_type_id` int DEFAULT NULL,
  `standard_room` varchar(45) DEFAULT NULL,
  `description_orther_conveniece` varchar(45) DEFAULT NULL,
  `pool_area` double DEFAULT NULL,
  `number_of_floors` int DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `rent_type_id` (`rent_type_id`),
  KEY `service_type_id` (`service_type_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`rent_type_id`) REFERENCES `rent_type` (`rent_type_id`) ON DELETE CASCADE,
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_type_id`) ON DELETE CASCADE
);

CREATE TABLE `customer_type` (
  `customer_type_id` int NOT NULL AUTO_INCREMENT,
  `customer_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_type_id`)
);

CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_type_id` int DEFAULT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_birthday` date DEFAULT NULL,
  `customer_gender` varchar(10) DEFAULT NULL,
  `customer_id_card` varchar(45) DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_type_id` (`customer_type_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`) ON DELETE CASCADE
);

CREATE TABLE `attach_service` (
  `attach_service_id` int NOT NULL AUTO_INCREMENT,
  `attach_service_name` varchar(45) DEFAULT NULL,
  `attach_service_cost` double DEFAULT NULL,
  `attach_service_unit` int DEFAULT NULL,
  `attach_service_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attach_service_id`)
);

CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
);

CREATE TABLE `education_degree` (
  `education_degree_id` int NOT NULL AUTO_INCREMENT,
  `education_degree_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`education_degree_id`)
);

CREATE TABLE `division` (
  `division_id` int NOT NULL AUTO_INCREMENT,
  `division_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`division_id`)
) ;

CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
);

CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
);

CREATE TABLE `user_role` (
  `role_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `username` (`username`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE
);

CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) DEFAULT NULL,
  `employee_birthday` date DEFAULT NULL,
  `employee_id_card` varchar(45) DEFAULT NULL,
  `employee_salary` double DEFAULT NULL,
  `employee_phone` varchar(45) DEFAULT NULL,
  `employee_email` varchar(45) DEFAULT NULL,
  `employee_address` varchar(45) DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `education_degree_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `username` (`username`),
  KEY `division_id` (`division_id`),
  KEY `education_degree_id` (`education_degree_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `division` (`division_id`) ON DELETE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`education_degree_id`) REFERENCES `education_degree` (`education_degree_id`) ON DELETE CASCADE,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE
);

CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `contract_start_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `contract_deposit` double DEFAULT NULL,
  `contract_total_money` double DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `service_id` (`service_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
);

CREATE TABLE `contract_detail` (
  `contract_detail_id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int DEFAULT NULL,
  `attach_service_id` int DEFAULT NULL,
  `quatity` int DEFAULT NULL,
  PRIMARY KEY (`contract_detail_id`),
  KEY `attach_service_id` (`attach_service_id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `contract_detail_ibfk_1` FOREIGN KEY (`attach_service_id`) REFERENCES `attach_service` (`attach_service_id`) ON DELETE CASCADE,
  CONSTRAINT `contract_detail_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`) ON DELETE CASCADE
);



