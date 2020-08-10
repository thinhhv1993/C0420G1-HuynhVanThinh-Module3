drop database if exists demo1;

CREATE DATABASE demo1;

USE demo1;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE delete_user_by_id(IN user_id INT)

BEGIN

    delete from users where    users.id = user_id;

    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE update_user_by_id(
IN user_id int,
IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50))

BEGIN

    update users

    set users.`name` = user_name, users.email =  user_email, users.country = user_country

    where users.id = user_id;

    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE get_user()

BEGIN

    SELECT *

    FROM users;


    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;


create table Permision(

id int(11) primary key ,

name varchar(50)

);

 alter table Permision modify id int(11) auto_increment;

create table User_Permision(

permision_id int(11),

user_id int(11)

);

alter table User_Permision add foreign key (permision_id) references Permision(id);
alter table User_Permision add foreign key (user_id) references users(id);

insert into Permision(name) values('add');

insert into Permision(name) values('edit');

insert into Permision(name) values('delete');

insert into Permision(name) values('view');