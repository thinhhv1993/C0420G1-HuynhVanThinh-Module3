select *
from instructor i 
	left join instructor_teach_class itc
    on i.id = itc.instructor_id
where instructor_id is null;

select c.name, count(itc.class_id) as 'instructor'
from instructor_teach_class itc
	right join class c on itc.class_id = c.id
-- where count(s.class_id) = 0
group by c.id;
-- having count(s.class_id) = 0;

select * from instructor_teach_class ;

-- hiển thị lớp và số học viên 
select c.name, count(s.class_id)
from student s
	right join class c on s.class_id = c.id
-- where count(s.class_id) = 0
group by c.id
-- having count(s.class_id) = 0;
