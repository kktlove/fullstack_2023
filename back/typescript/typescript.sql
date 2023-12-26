USE teaspoon;

SHOW TABLES;

SELECT * FROM board;

DESC board;

CREATE TABLE notice(bnum INT(11) PRIMARY KEY,
id VARCHAR(100),
title VARCHAR(200),
content VARCHAR(1000),
writedate DATETIME);

CREATE TABLE file(bnum INT(11), 
savefile VARCHAR(200),
filetype VARCHAR(50),
writedate DATETIME);