drop user kosea3 cascade;

create user kosea3 identified by kosea2019a;

grant connect, resource, dba to kosea3;

alter user kosea3 account unlock;

conn kosea3/kosea2019a;

create table member_tbl_02 (
custno		number(6)	not null,
custname		varchar2(20),
phone		varchar2(13),
address		varchar2(60),
joindate		date,
grade		char(1),
city		char(2),
constraint	pk_member_tbl_02		primary key(custno)
);

create table money_tbl_02 (
custno		number(6)	not null,
salenol		number(8)	not null,
pcost		number(8),
amount		number(4),
price		number(8),
pcode		varchar2(4),
sdate		date,
constraint	pk_money_tbl_02		primary key(salenol),
constraint	fk_money_tbl_02		foreign key(custno)		references member_tbl_02(custno) on delete cascade
);




















