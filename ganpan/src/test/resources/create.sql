-- DROP TABLE
DROP TABLE CHANGE_MANAGEMENT;
DROP TABLE CHANGE_GENRE;
DROP TABLE WORK;
DROP TABLE INVITATION_MANAGEMENT;
DROP TABLE BOARD_GENRE;
DROP TABLE ORGANIZATION;
DROP TABLE SIGN_BOARD;
DROP TABLE MEMBER;

-- DROP SEQUENCE
DROP SEQUENCE seq_change_management_no;
DROP SEQUENCE seq_work_no;

-- CREATE SEQUENCE
CREATE SEQUENCE seq_change_management_no;
CREATE SEQUENCE seq_work_no;

-- CREATE TABLE
CREATE TABLE MEMBER(
   nickname VARCHAR2(50) PRIMARY KEY,
   e_mail VARCHAR2(100) UNIQUE NOT NULL,
   password VARCHAR2(50) NOT NULL
);

CREATE TABLE SIGN_BOARD(
   sign_board_name VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   visibility NUMBER DEFAULT 0 NOT NULL,
   -- visibility : 0 공개, 1 비공개  	
   creation_date DATE DEFAULT SYSDATE NOT NULL,
   
   CONSTRAINT fk_boss_nickname FOREIGN KEY(boss_nickname) 
   		REFERENCES MEMBER(nickname) ON DELETE CASCADE,
   CONSTRAINT pk_sign_board PRIMARY KEY(sign_board_name, boss_nickname)
);

CREATE TABLE ORGANIZATION (
   worker_nickname VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   sign_board_name VARCHAR2(50) NOT NULL,
   
   CONSTRAINT fk_organization_worker FOREIGN KEY(worker_nickname) 
   		REFERENCES MEMBER(nickname) ON DELETE CASCADE,
   CONSTRAINT fk_organization_sing_board FOREIGN KEY(sign_board_name, boss_nickname) 
   		REFERENCES SIGN_BOARD(boss_nickname,sign_board_name) ON DELETE CASCADE,
   CONSTRAINT pk_organization PRIMARY KEY(worker_nickname ,boss_nickname ,sign_board_name)
);

CREATE TABLE INVITATION_MANAGEMENT (
   sign_board_name VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   nickname VARCHAR2(50) NOT NULL,
   invitation_date DATE DEFAULT SYSDATE NOT NULL,
   
   CONSTRAINT fk_invitation_management_nickname FOREIGN KEY(nickname) 
   		REFERENCES MEMBER(nickname) ON DELETE CASCADE,
   CONSTRAINT fk_invitation_management_sign_board FOREIGN KEY(sign_board_name, boss_nickname) 
   		REFERENCES SIGN_BOARD(sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT pk_invitation_management PRIMARY KEY(sign_board_name, boss_nickname,nickname)
);

CREATE TABLE BOARD_GENRE (
   sign_board_name VARCHAR2(50) NOT NULL,
   board_no NUMBER NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   board_name VARCHAR2(50) NOT NULL,
   
   CONSTRAINT fk_board_genre_sign_board FOREIGN KEY(sign_board_name, boss_nickname) 
   		REFERENCES SIGN_BOARD(sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT pk_board_genre PRIMARY KEY(sign_board_name,board_no,boss_nickname)
);
INSERT INTO 

CREATE TABLE WORK(
   work_no NUMBER PRIMARY KEY,
   work_name VARCHAR2(50) NOT NULL,
   creation_DATE DATE DEFAULT SYSDATE NOT NULL,
   change_DATE DATE DEFAULT SYSDATE NOT NULL,
   board_no NUMBER NOT NULL,
   worker_nickname VARCHAR2(50) NOT NULL,
   sign_board_name VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   
   CONSTRAINT fk_work_board_genre FOREIGN KEY(board_no, sign_board_name, boss_nickname) 
   		REFERENCES BOARD_GENRE(board_no, sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT fk_org_pk_organization FOREIGN KEY(worker_nickname ,sign_board_name,boss_nickname) 
   		REFERENCES ORGANIZATION(worker_nickname ,sign_board_name,boss_nickname) ON DELETE CASCADE
);


CREATE TABLE CHANGE_GENRE(
   change_no NUMBER PRIMARY KEY,
   change_name VARCHAR2(50) NOT NULL
);

CREATE TABLE CHANGE_MANAGEMENT(
   change_management_no NUMBER PRIMARY KEY,
   change_worker VARCHAR2(50) NOT NULL,
   change_management_DATE DATE DEFAULT SYSDATE NOT NULL,
   board_no NUMBER NOT NULL,
   work_no NUMBER NOT NULL,
   change_no NUMBER NOT NULL,
   
   CONSTRAINT fk_change_management_change_genre FOREIGN KEY(change_no) 
   		REFERENCES CHANGE_GENRE(change_no) ON DELETE CASCADE,
   CONSTRAINT fk_change_management_work FOREIGN KEY(work_no) 
   		REFERENCES WORK(work_no)
);

-- INSERT MEMBER(테스트용 입니다.)
INSERT INTO MEMBER VALUES('sync','kosta@naver.com', '1234');

--board no : TODO(1) / DOING(2) / DONE(3)
-- INSERT BOARD_GENRE