create database bbs;
use bbs;
use db_banchan;
select*from tbl_product;
select*from tbl_member;
select*from tbl_delivery;
select*from test;
use db_estore;
show tables;
select * from tbl_payment_gateway;
create database db_estore;
use db_estore;
select * from member;
select * from tbl_member;
select * from tbl_admin_member;
drop table tbl_admin_member;
drop table tbl_payment_gateway;
drop table tbl_delivery;
drop table tbl_order;
drop table tbl_order_detail;
drop table tbl_payment;


CREATE TABLE tbl_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_price DECIMAL(10, 0) NOT NULL,
    payment_method VARCHAR(100) NOT NULL,
    member boolean,
    FOREIGN KEY (member_id) REFERENCES tbl_member(code)
);

CREATE TABLE tbl_delivery (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    delivery_date DATETIME NOT NULL,
    recipient_name VARCHAR(255) NOT NULL,
    road_address VARCHAR(255),
    jibun_address VARCHAR(255),
    detail_address VARCHAR(255),
    zipcode VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES tbl_order(order_id)
);

CREATE TABLE tbl_order_detail (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    delivery_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 0) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES tbl_order(order_id),
    FOREIGN KEY (product_id) REFERENCES tbl_product(code),
    FOREIGN KEY (delivery_id) REFERENCES tbl_delivery(delivery_id)
);



INSERT INTO tbl_payment_gateway (cardNumber, expirationMM, expirationYY, cvc, cardHolderName) VALUES
('1234', 12, 24, '123', 'finn');


CREATE TABLE tbl_payment_gateway (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cardNumber VARCHAR(16) NOT NULL,
    expirationMM TINYINT NOT NULL,
    expirationYY SMALLINT NOT NULL,
    cvc VARCHAR(4),
    cardHolderName VARCHAR(255)
);

CREATE TABLE tbl_admin_member (
code int PRIMARY KEY auto_increment,
adminName VARCHAR(255) NOT NULL,
adminId VARCHAR(255)  NOT NULL,
adminPassword VARCHAR(64) NOT NULL,
adminEmail VARCHAR(255) NOT NULL,
adminPhone VARCHAR(255) ,
admin boolean
);
INSERT INTO tbl_admin_member (adminName, adminId, adminPassword, adminEmail, adminPhone, admin) VALUES
('finn', 'admin', '123', 'admin@test.com', '123-456-7890', 1);
drop table tbl_admin_member;
select * from tbl_admin_member;
drop table tbl_member;
select * from tbl_admin_member;
desc tbl_member;
CREATE TABLE tbl_member (
	code int PRIMARY KEY auto_increment,
    userName VARCHAR(255) NOT NULL,
    userId VARCHAR(255) NOT NULL,
    userPassword VARCHAR(64) NOT NULL,
    userEmail VARCHAR(255) NOT NULL,
    userPhone VARCHAR(255) ,
    admin BOOLEAN
);
use db_estore;
commit;
select * from tbl_admin_member;
INSERT INTO tbl_member (userName, userId, userPassword, userEmail, userPhone, admin) VALUES
('John Doe', 'asdf', '123', 'john@example.com', '123-456-7890', 0),
('Alice Smith', 'qwer', '123', 'alice@example.com', '987-654-3210', 0),
('Bob Johnson', 'zxcv', '123', 'bob@example.com', '111-222-3333', 0);




drop table member;
-- 테이블 생성
CREATE TABLE test (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  content VARCHAR(200)
);

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

CREATE TABLE tbl_notice_board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tbl_qna_board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tbl_faq_board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tbl_review_board (
  num INT AUTO_INCREMENT PRIMARY KEY,
  pass VARCHAR(30),
  username VARCHAR(30),
  email VARCHAR(30),
  title VARCHAR(50),
  content VARCHAR(1000),
  readcount INT DEFAULT 0,
  writedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table tbl_product;
CREATE TABLE tbl_product (
  code INT AUTO_INCREMENT PRIMARY KEY,
  productname VARCHAR(100),
  price DECIMAL(10),
  pictureurl VARCHAR(50),
  category DECIMAL(10),
  description VARCHAR(1000)
);
INSERT INTO tbl_notice_board(username, email, pass, title, content)
VALUES('성', 'pinksung@nate.com', '1234', '첫방문', '반갑습니다.');

INSERT INTO tbl_qna_board(username, email, pass, title, content)
VALUES('동', 'city@nate.com', '1234', '강원도', '눈이 많이 와요.');

INSERT INTO tbl_faq_board(username, email, pass, title, content)
VALUES('정', 'forest@nate.com', '1234', '경기도', '숲속공원이요');

INSERT INTO tbl_review_board(username, email, pass, title, content)
VALUES('보보', 'forest@nate.com', '1234', '경기도', '숲속공원이요');

INSERT INTO board(username, email, pass, title, content)
VALUES('장보고', 'sea@nate.com', '1234', '제주도', '바다가 보여요.');
commit;

INSERT INTO tbl_product (productname, price, pictureurl, description)
VALUES ('개념을 콕콕 잡아주는 데이터베이스', 27000, 'db.jpg', '데이터 베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');

INSERT INTO tbl_product (productname, price, pictureurl, description)
VALUES ('웹표준을 위한 HTML5', 25000, 'html5.jpg', 'HTML5 가이드 북, 홈페이지 제작을 위한 필수 선택 HTML 기본 문법');

INSERT INTO tbl_product (productname, price, pictureurl, description)
VALUES ('Dynamic Programming book 시리즈 -오라클 11g+PL/SQL', 25000, 'oracle.jpg', 'Dynamic 실무 코칭 프로그래밍의 Book의 첫번째 책으로 11g의 새로운...');
commit; -- 영구 저장

select * from tbl_admtbl_reviewtbl_faqin_member;
select * from tbl_faq;
select * from tbl_review_board;
select * from tbl_qna_board;
select * from tbl_notice_board;
select * from tbl_product;
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('유비', 'yoobi', '1234', 'gmd@naver.com', '010-1111-2222', 0);

-- 2 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('관우', 'guanyu', '1234', 'ha12@naver.com', '010-2222-8888', 0);

-- 3 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('장비', 'jangbi', '1234', 'youn1004@naver.com', '010-3333-6666', 1);

-- 4 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('손오공', 'ogong', '1234', 'youn1004@naver.com', '010-4444-9999', 0);
USE db_estore;
select *from tbl_product;
 
commit; -- 영구 저장

CREATE TABLE member (
  username VARCHAR(10),
  userid VARCHAR(10),
  pwd VARCHAR(10),
  email VARCHAR(20),
  phone CHAR(13),
  admin TINYINT DEFAULT 0, -- 0: 사용자, 1: 관리자
  PRIMARY KEY (userid)
);

CREATE TABLE tbl_inventory (
  id INT AUTO_INCREMENT PRIMARY KEY,
  productName int,
  stockQuantity int,
  salesQuantity int,
  orderedQuantity int,
  remarks VARCHAR(255)
);







-- 데이터 삽입
INSERT INTO test (title, content) VALUES ('첫 번째 글', '이것은 첫 번째 글의 내용입니다.');
INSERT INTO test (title, content) VALUES ('두 번째 글', '이것은 두 번째 글의 내용입니다.');

commit; 

select * from test;

-- 검색
SELECT * FROM test WHERE id = 19;

-- 검색
SELECT * FROM test WHERE title = '첫 번째 글';

-- 삭제
DELETE FROM test WHERE id= 1;

--  테이블 삭제 
drop table test;

show tables;

-- bbs DB 삭제해라 
DROP DATABASE IF EXISTS bbs;