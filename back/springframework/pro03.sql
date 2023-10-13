create database teaspoon;

USE teaspoon;

CREATE table sample(NO INTEGER AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(100));
 
 
INSERT INTO sample VALUES (DEFAULT, '김기태');
INSERT INTO sample VALUES (DEFAULT, '한선');
INSERT INTO sample VALUES (DEFAULT, '이은영');
INSERT INTO sample VALUES (DEFAULT, '서광');
INSERT INTO sample VALUES (DEFAULT, '이소윤');

COMMIT;

SELECT * FROM sample;

create table board(seq int AUTO_INCREMENT primary key,
	title varchar(100) not null,
	content varchar(1000) not null,
	nickname varchar(20),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	visited INT DEFAULT 0
);

select * from board order by regdate desc LIMIT 3, 5;

insert into board values(default, '샘플 글 제목1입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', default, DEFAULT);
insert into board values(default, '샘플 글 제목2입니다.', '여기는 샘플 글2에 대한 내용입니다.', 'admin', default, DEFAULT);
insert into board values(default, '샘플 글 제목3입니다.', '여기는 샘플 글3에 대한 내용입니다.', 'admin', default, DEFAULT);
insert into board values(default, '샘플 글 제목4입니다.', '여기는 샘플 글4에 대한 내용입니다.', 'admin', default, DEFAULT);
insert into board values(default, '샘플 글 제목5입니다.', '여기는 샘플 글5에 대한 내용입니다.', 'admin', default, DEFAULT);
insert into board values(default, '샘플 글 제목6입니다.', '여기는 샘플 글6에 대한 내용입니다.', 'admin', default, default);


SELECT * FROM board;

UPDATE board SET title='샘플 글 제목7입니다.', content='여기는 샘플 글7에 대한 내용입니다.' WHERE seq=6; 


CREATE TABLE member(id VARCHAR(20) PRIMARY KEY,
pw varchar(300) not null,
name varchar(50),
email varchar(100) not null,
tel varchar(20) not null,
addr1 varchar(200),
addr2 varchar(100),
postcode varchar(10),
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
birth date,
pt int default 0,
visited int default 0
);

DESC MEMBER;

INSERT INTO member VALUES ('admin', '1234', '관리자',
'admin@teaspoon.co.kr', '0212341234', 
'서울특별시 금천구 디지털로9길 23 (마리오2 패션타워)',
'11층 1108호', '08511', DEFAULT, '2023-12-25',
DEFAULT, DEFAULT);
INSERT INTO member VALUES ('kim', '4321', '김천재',
'kim@teaspoon.co.kr', '01043214321', 
'서울특별시 금천구 가산로9길 54',
'천재교과서', '08513', DEFAULT, '1978-12-25',
DEFAULT, DEFAULT);
COMMIT;

UPDATE member SET pw='$2a$10$TMTp1e7vW8nx7l7B49a2d.0robqb2qUFTuBPntKHRvVILg0CmBkqW' WHERE id='admin';
UPDATE member SET pw='$2a$10$mpr36CRQpp903gPf.f76auK1CYzFkq.LD65JsGzdrBCiOluBotWYW' WHERE id='kim';
SELECT * FROM member;

create table free(bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) not null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT -- 추천수
);

DESC free;

CREATE TABLE fileinfo(NO INT AUTO_INCREMENT PRIMARY KEY,  -- 번호
articleno varchar(45) DEFAULT NULL,	-- 글번호
saveFolder varchar(45) DEFAULT NULL,	-- 저장 디렉토리
originFile varchar(45) DEFAULT NULL,	-- 
saveFile varchar(45) DEFAULT NULL
);

CREATE TABLE guestbook (
  articleno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid varchar(16) NOT NULL,
  subject varchar(100) NOT NULL,
  content varchar(2000) NOT NULL,
  regtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DESC guestbook;

CREATE TABLE fileobj (
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	postno INT NOT NULL,
	savefolder VARCHAR(400),
	originfile VARCHAR(400),
	savefile VARCHAR(800),
	filesize LONG,
	uploaddate VARCHAR(100)
);

CREATE TABLE fileboard (
	postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
	title VARCHAR(100) not null,   -- 글제목
	content VARCHAR(1500) not null,    -- 글내용
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
	visited INT DEFAULT 0   -- 조회수
);

DESC fileobj;

DESC fileboard;

SELECT * FROM fileobj;
SELECT * FROM fileboard;

UPDATE fileboard SET visited=0 WHERE postno=1;

ALTER TABLE fileboard MODIFY COLUMN visited INT DEFAULT 0;

  