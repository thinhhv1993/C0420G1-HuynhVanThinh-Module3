drop database if exists i_notes;

create database i_notes;

use i_notes;

create table note_type(
id int primary key auto_increment,
`name` varchar(100),
`description` varchar(200)  
);

create table note(
id int primary key auto_increment,
title varchar(100),
content varchar(500),
type_id int
);

alter table note add foreign key (type_id) references note_type(id) on delete cascade;

DELIMITER $$

CREATE PROCEDURE get_note()

BEGIN

    SELECT n.id, n.title, n.content, nt.name

    FROM note n  join note_type nt on n.type_id = nt.id;

    END$$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE insert_note(

IN note_title varchar(100),

IN note_content varchar(500),

IN note_type_id int

)

BEGIN

    INSERT INTO note(title, content, type_id ) VALUES(note_title, note_content, note_type_id);

    END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_note(
In note_id int,

IN note_title varchar(100),

IN note_content varchar(500),

IN note_type_id int

)

BEGIN

    update  note
    set note.title = note_title, note.content = note_content, note.type_id = note_type_id
    where note.id= note_id;

    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE delete_note_by_id(IN note_id INT)

BEGIN

    delete from note where    note.id = note_id;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE get_note_by_id(IN note_id INT)

BEGIN

    SELECT note.title, note.content, note.type_id

    FROM note

    where note.id = note_id;

    END$$

DELIMITER ;

insert into note_type(name,description) values ('cá nhân','việc cá nhân');
insert into note_type(name,description) values ('công ty','việc công ty');
insert into note_type(name,description) values ('gia đình','việc gia đình');