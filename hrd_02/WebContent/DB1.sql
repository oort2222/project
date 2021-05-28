create table grade(
	membernum	varchar2(30),
	member		varchar2(30),
	math		number(3),
	eng			number(3),
	lang		number(3),
	constraint grade_1 primary key(membernum,member)
)
insert into grade values(001,'김영리',91,50,41);
insert into grade values(002,'강영리',91,55,42);
insert into grade values(003,'수영리',94,97,90);

drop table grade;
drop table p_result;

create table p_result(
	membernum	varchar2(3),
	member		varchar2(10),
	result		number(3)
)
insert into p_result values(001,'김영리',60);
insert into p_result values(002,'강영리',62);
insert into p_result values(003,'수영리',93);
select * from P_RESULT
select membernum,member,math,eng,lang
from grade

select membernum, member, round((math+eng+lang)/ 3,0)  result 
from grade g
order by membernum desc

select nvl(max(membernum),0)+1 max
from GRADE

select *
from GRADE