select * from tbl_user;

select * from tbl_user where user_id = 'ㅗㅗ' and user_pw = 0000

select * from tbl_user;

drop table tbl_user cascade constraints;

CREATE TABLE tbl_user
(
    user_id           VARCHAR2(30)      NOT NULL, 
    user_pw           VARCHAR2(30)      NOT NULL, 
    user_name         VARCHAR2(30)      NOT NULL, 
    user_nick         VARCHAR2(20)      NOT NULL, 
    user_birthdate    DATE              DEFAULT SYSDATE NOT NULL, 
    user_gender       CHAR(1)           NOT NULL, 
    user_phone        VARCHAR2(20)      NOT NULL, 
    user_email        VARCHAR2(60)      NOT NULL, 
    user_profile      VARCHAR2(4000)    , 
    user_photo        VARCHAR2(300)     , 
    user_type         CHAR(1)           NOT NULL, 
    user_joindate     DATE              NOT NULL, 
     PRIMARY KEY (user_id)
     
);

select * from tbl_user;

drop table tbl_user cascade constraints;

CREATE TABLE tbl_user
(
    user_id           VARCHAR2(30)      NOT NULL, 
    user_pw           VARCHAR2(30)      NOT NULL, 
    user_name         VARCHAR2(30)      NOT NULL, 
    user_nick         VARCHAR2(20)      NOT NULL, 
    user_birthdate    DATE              DEFAULT SYSDATE NOT NULL, 
    user_gender       CHAR(1)           NOT NULL, 
    user_phone        VARCHAR2(20)      NOT NULL, 
    user_email        VARCHAR2(60)      NOT NULL, 
    user_profile      VARCHAR2(4000)    , 
    user_photo        VARCHAR2(300)     , 
    user_type         CHAR(1)           NOT NULL, 
    user_joindate     DATE              NOT NULL, 
     PRIMARY KEY (user_id)
     
);
ALTER TABLE tbl_user ADD CONSTRAINT uk_tbl_user_user_nick UNIQUE(user_nick);
select * from tbl_user;

SELECT*from ALL_CONSTRAINTS WHERE TABLE_NAME="tbl_user"

drop table tbl_user cascade constraints;

CREATE TABLE tbl_user
(
    user_id           VARCHAR2(30)      NOT NULL, 
    user_pw           VARCHAR2(30)      NOT NULL, 
    user_name         VARCHAR2(30)      NOT NULL, 
    user_nick         VARCHAR2(20)      NOT NULL, 
    user_birthdate    DATE              DEFAULT SYSDATE NOT NULL, 
    user_gender       CHAR(1)           NOT NULL, 
    user_phone        VARCHAR2(20)      NOT NULL, 
    user_email        VARCHAR2(60)      NOT NULL, 
    user_profile      VARCHAR2(4000)    , 
    user_photo        VARCHAR2(300)     , 
    user_type         CHAR(1)           NOT NULL, 
    user_joindate     DATE              NOT NULL, 
     PRIMARY KEY (user_id)
     
);
select * from tbl_user;

select * from tbl_party;






