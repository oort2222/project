create table grade(
	membernum	varchar2(3),
	member		varchar2(10),
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
1
create table p_result(
	membernum	varchar2(3),
	member		varchar2(10),
	result		number(3)
)
insert into p_result values(001,'김영리',60);
insert into p_result values(002,'강영리',62);
insert into p_result values(003,'수영리',93);

select membernum,member,math,eng,lang
from grade

select p.membernum, p.member, round((math+eng+lang)/ 3,0)  result 
from grade g, p_result p
where p.membernum = g.membernum and p.member = g.member
order by result desc

select p.membernum, p.member, round((math+eng+lang)/3 , 0) result from grade g, p_result p
group by p.membernum, p.member
select p.membernum,  round((math+eng+lang)/3 , 0) result from p_result p, grade g 

select round(math+eng+lang),0)/3 result from grade g
select round((math+eng+lang)/ 3,0)  result from grade g