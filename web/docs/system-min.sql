create table book(
bigfield varchar2(40) not null,
no varchar2(20) primary key,
smfield varchar2(40),
name varchar2(100) not null,
author varchar2(50) not null,
translator varchar2(50),
publisher varchar2(40) not null,
checkoutdate varchar2(10),
checkedout varchar2(20),
available varchar2(2));

create table member(
name varchar2(20) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11) not null);


select * from member;
select * from book;

alter user system identified by pass;

commit;

insert into book (no, bigfield, smfield, name, author, translator, publisher, checkoutdate, checkedout, available)
values ('B021', '���', 'JAVA', '�����̴��ڹ�õ��2', '������', '������', '��������', '2018.02.02', '������', 'y');

insert into book
values ('���', 'B022', 'JAVA', '�����̴��ڹ�õ��3', '������', '������', '��������', '2018.02.02', '������', 'y');
