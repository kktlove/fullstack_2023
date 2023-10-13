select * from custom;

alter table custom add column addr varchar(300);

alter table custom alter column tel TYPE varchar(13);
alter table custom alter column pw TYPE varchar(500);
alter table custom alter column birth TYPE varchar(20);


update custom set pw='PiaaQ0NRSE2oqCNJjnWMILh7I0NxM41bVTR9vU1Rp60Jy8aFU0UvVRrHZcSHKa2X3xBYxg==' where pw='1234';
update custom set pw='lT57o27KGFcAj7lOt7bR+E6M05qDBLEif0H6EJISfb1GtOib0Qxh94Mg3is9X6nfmoj2mw==' where pw='1004';
update custom set pw='0ick8VOF/t8cMPZQyF9E/uEUVqdwsXt4z4xdT2RTPNOERtNClP/e/yXWJt9ShtJdBdwpCg==' where pw='7979';

commit;

create table filetest(
uname varchar(200), 
subject varchar(300), 
content varchar(1000),
filename varchar(500)
);

select * from filetest;

create table filetest2(
uname varchar(200), 
subject varchar(300), 
content varchar(1000),
filename1 varchar(500),
filename2 varchar(500),
filename3 varchar(500)
);

select * from filetest2;


-- 상품 테이블 생성
create table product(pno serial primary key,
cate varchar(3) not null, prono varchar(10) not null,
pname varchar(100) not null, pcomment varchar(2000) not null,
plist varchar(2000), price integer default 1000,
imgsrc1 varchar(256) default 'noimg.jpg',
imgsrc2 varchar(256) default 'noimg.jpg',
imgsrc3 varchar(256) default 'noimg.jpg',
resdate timestamp default current_timestamp);			 

-- 상품 부가정보 테이블 생성
create table addinfo(ano serial primary key,
pno integer not null, title varchar(200) not null,
movie varchar(256) default 'sample1.mp4',
resdate timestamp default current_timestamp);

-- 입고 테이블 생성
create table receive(rno serial primary key,
pno integer not null, amount integer default 1,
rprice integer default 1000,
resdate timestamp default current_timestamp);

-- 출고 테이블 생성
create table serve(sno serial primary key,
pno integer not null, amount integer default 1,
sprice integer default 1000,
resdate timestamp default current_timestamp);

drop table delivery;

-- 배송 테이블 생성
create table delivery(
dno serial primary key,
sno integer not null, cid varchar(20) not null,
daddr varchar(300) not null, 
custel varchar(13) not null,
pcom varchar(100),
ptel varchar(13),
pstate integer default 0,	
sdate timestamp default current_timestamp,
rdate varchar(13),
bcode varchar(30)	
);

-- 결제 테이블 생성
create table payment(
sno serial primary key,
cid varchar(20) not null,
pno integer not null,
amount integer default 1,
pmethod varchar(100),
pcom varchar(100),
cnum varchar(100),
payprice integer default 1000,
dno varchar(100)	
);

-- 카테고리 테이블
create table category(
	cno varchar(4) primary key,
	cname varchar(100) not null
);

-- 카트 테이블 생성
create table cart(
	cartno serial primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer not null
);

create table review(
	rno serial primary key,
	sno integer not null,
	cid varchar(20) not null,
	content varchar(500) not null,
	star integer default 5,
	resdate timestamp default current_timestamp
);

-- 내가 만든 테이블 목록 보기
select * from pg_tables where schemaname='public';

-- 카테고리 등록
insert into category values('A', '초등교과서');
insert into category values('B', '초등참고서');
insert into category values('C', '초등문제집');
insert into category values('D', '초등기타');
insert into category values('E', '중등교과서');
insert into category values('F', '중등참고서');
insert into category values('G', '중등문제집');
insert into category values('H', '중등기타');
insert into category values('I', '고등교과서');
insert into category values('J', '고등참고서');
insert into category values('K', '고등문제집');
insert into category values('L', '고등기타');
insert into category values('M', '일반교과서');
insert into category values('N', '일반참고서');
insert into category values('O', '일반문제집');
insert into category values('P', '일반기타');
insert into category values('Q', '유아콘텐츠');
insert into category values('R', '유아놀이');
insert into category values('S', '유아기타');
insert into category values('T', '해외서적');
insert into category values('U', '해외콘텐츠');

drop view inventory;

-- 상품 목록
select * from product order by pno;
-- 신상품 목록
select * from product order by pno desc limit 5;
-- 베스트셀러 상품 목록
select * from product where pno in (select pno from payment group by pno order by sum(amount) desc limit 5);
-- 카테고리별 신상품 목록
select * from product where cate=? order by pno desc limit 3;
-- 카테고리별 베스트셀러 상품 목록
select * from product where pcode in (select pno from payment group by pno order by sum(amount)) and cate=? limit 3;

-- 상품 등록
insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, ?, default);
update product set prono = concat(cate, pno) where pno=?;

-- 상품 제거
delete from product where pno=?;

-- 상품 정보 변경
update product set pname=?, pcomment=?, plist=?, 
price=?, imgsrc1=?, imgsrc2=?, imgsrc3=? where pno=?;

select * from receive;

-- 입고 처리 패턴
insert into receive values (default, ?, ?, ?, default);
insert into receive(pno, amount, rprice) values (?, ?, ?);

select * from product;
select * from payment;
select * from serve;
select * from delivery;
select * from cart;

-- 출고 처리 패턴
insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '');
insert into serve values(default, ?, ?, ?, default);
insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','');
delete from cart where cartno=?;

-- 반품 처리 패턴(배송전이면 반품 가능)
delete from payment where sno=?;
insert into receive values (default, ?, ?, ?, default);
delete from serve where sno=?;
insert into cart values (default, ?, ?, ?);
delete from delivery where sno=?;

-- 배송처리
update delivery set pcom=?, ptel=?, pstate=1, 
sdate=current_timestamp, rdate=?, bcode=? where dno=?;

-- 배송 완료 처리
update delivery set pstate=2 where dno=?;

-- 재고 조회
select * from inventory;

-- 전체 이익 통계 뷰 작성
create view profit as (select pno, sum(sprice*amount) as tot from serve group by pno EXCEPT select pno, sum(rprice*amount) as tot from receive group by pno);

select * from profit;
select * from addinfo;
select * from receive;
select * from delivery;
select * from payment;
select * from custom;
select * from inventory;
select * from cart;
select * from serve;
select * from receive;
select * from review;
select * from notice order by resdate desc limit 5 offset 0;
select count(*) as cnt from notice where content like '%더미%' limit 5 offset 0;

-- 재고 처리 뷰 생성
create view inventory as (select a.pno as pno, (sum(a.amount)-sum(b.amount)) as amount from receive a, serve b where a.pno=b.pno group by a.pno, b.pno);

select * from inventory;




