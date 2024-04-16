use db_estore;
select * from tbl_product;

CREATE TABLE board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `tbl_member` (
  userName VARCHAR(10),
  userId VARCHAR(10),
  userPassword VARCHAR(10),
  userEmail VARCHAR(20),
  userPhone CHAR(13),
  `admin` TINYINT DEFAULT 0, -- 0: 사용자, 1: 관리자
  PRIMARY KEY (userid)
);
show tables;
select * from board;
drop table board;
drop table `tbl_member`;

select * from tbl_producttbl_product;
select * from tbl_board;

CREATE TABLE tbl_board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 1 레코드 삽입
INSERT INTO tbl_member (userName, userId, userPassword, userEmail, userPhone, `admin`)
VALUES ('유비', 'yoobi', '1234', 'gmd@naver.com', '010-1111-2222', 0);

-- 2 레코드 삽입
INSERT INTO tbl_member (userName, userId, userPassword, userEmail, userPhone, `admin`)
VALUES ('관우', 'guanyu', '1234', 'ha12@naver.com', '010-2222-8888', 0);

INSERT INTO board(username, email, pass, title, content)
VALUES('성윤정', 'pinksung@nate.com', '1234', '첫방문', '반갑습니다.');

INSERT INTO board(username, email, pass, title, content)
VALUES('홍길동', 'city@nate.com', '1234', '강원도', '눈이 많이 와요.');

INSERT INTO board(username, email, pass, title, content)
VALUES('임꺽정', 'forest@nate.com', '1234', '경기도', '숲속공원이요');

INSERT INTO board(username, email, pass, title, content)
VALUES('장보고', 'sea@nate.com', '1234', '제주도', '바다가 보여요.');

commit;


-- 검색
SELECT * FROM board WHERE num = 1;


-- update
UPDATE board SET email = 'dino@naver.com'  WHERE num = 2;


-- 정렬
SELECT * FROM board ORDER BY username;
SELECT * FROM board ORDER BY email;

-- 이름역순 정렬
SELECT * FROM board ORDER BY title DESC;

-- 삭제
DELETE FROM board WHERE num = 5 ;

--  테이블 삭제 