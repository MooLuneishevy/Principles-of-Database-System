select *
from course;

select title
from course;

select distinct title
from section;

select *
from student
limit 6;

select S.ID,S.name
from student as S
where not exists(
(select course_id
from course
where dept_name='Comp_Sci')
except
(select T.course_id
from takes as T
where S.ID=T.ID)
);

select distinct course_id
from section
where semester='Spring' and year=2019 and course_id not in(
select course_id
from section
where year=2018
);

select *,80-tot_cred as required_credits
from student
where dept_name='Comp_Sci' and tot_cred<80
order by tot_cred desc;

select max(cnt_of_takes) as max_cnt_of_takes
from(
select count(*) as cnt_of_takes
from takes
where semester='Spring' and year=2019
group by course_id
)subquery;

select dept_name,avg(salary) as avg_salary
from instructor
group by dept_name;

select S.name
from student as S
where S.ID not in(
select distinct T.ID
from takes as T
where T.semester='Spring' and T.year=2019
);

select sum(credits) as sum_of_credits
from course
where course_id in(
select course_id
from takes
where semester='Spring' and year=2019 and ID in(
select ID_stud
from guide
where ID_inst in(
select ID
from instructor
where name='    '
)
)
);

select year,count(*) as cnt_of_year
from section
where dept_name='Comp_Sci' and year between 2016 and 2018
group by year;

select course_id,title
from course
where course_id not in('004','007','013');

select *
from course
where title like 'D%e';

select *
from course
where title like '_%    %_';

select *
from student
where name like '_  %';

select *
from student
where name not like '  %';

select course_id
from section
where year=2018
group by course_id
having count(course_id)>=2;

select ID,name,tot_cred
from student
where ID in(
select distinct ID
from takes
where ID in (
select ID
from student
where dept_name='Comp_Sci'
)
and
course_id in(
select course_id
from section
where dept_name='Comp_Sci'
)
and
course_id in (
select course_id
from section
where ID in(
select ID
from instructor
where dept_name<>'Comp_Sci'
)
)
);

select course_id
from takes
where year=2019 and semester='Spring'
group by course_id
having count(course_id) between 15 and 25;

select count(*) as cnt_of_section
from section
where dept_name<>'Comp_Sci';

select course.*
from course
join (
select course_id,count(course_id) as cnt_of_takes
from takes
group by course_id
having count(course_id) between 15 and 25
) as sub
on course.course_id=sub.course_id
order by sub.cnt_of_takes desc;

select avg(salary) as avg_salary
from instructor
where dept_name<>'Comp_Sci' and building in (
select distinct building
from instructor
where dept_name='Comp_Sci'
);

update instructor
set salary=salary*1.5
where building='      ¥';

select dept_name,count(dept_name) as cnt_of_students
from student
group by dept_name;

select top 10 *
from student
where dept_name='Comp_Sci'
order by tot_cred desc;

select count(*) as cnt_of_section
from section
where year between 2017 and 2019 and ID in (
select ID
from instructor
where name='    '
);

select *
from instructor
where dept_name='Comp_Sci' and salary between
(select min(salary)
from instructor
where dept_name='Biology')
and
(select max(salary)
from instructor
where dept_name='Biology')
;

select
(select count(*) 
from section 
where year=2019 and dept_name='Comp_Sci')
-
(select count(*) 
from section
where year=2019 and dept_name='Biology')
as diff_courses;

select count(*) as cnt_of_course
from(
(select course_id
from section
where year=2019 and semester='Spring')
except
(select course_id
from takes
where year=2019 and semester='Spring')
) 
as tmp_course;

select name
from instructor
where ID in
(select distinct ID_inst
from guide
where ID_stud in
(select ID
from student
where dept_name='Comp_Sci')
);

update instructor
set budget=budget*1.2
where budget < (
select avg(budget) as avg_budget
from
(select distinct budget
from instructor)
as budget_of_dept
);

select count(*) as cnt_of_stu
from guide
where ID_inst =
(select ID
from instructor
where name='    ')
;

select *
from student as S
where not exists(
(select ID_pre
from prerequisite
where ID=
(select course_id
from course
where title='Database')
)
except
(select T.course_id
from takes as T
where S.ID=T.ID)
);

select S.name,I.name,SE.course_id
from takes as T
join student as S on T.ID=S.ID
join section as SE on T.course_id=SE.course_id and T.year=SE.year and T.semester=SE.semester
join instructor as I on SE.ID=I.ID
join guide as G on G.ID_inst=I.ID and G.ID_stud=S.ID
where T.year=2019 and T.semester='Spring';