-- DROP TABLE
DROP TABLE CHANGE_MANAGEMENT;
DROP TABLE CHANGE_GENRE;
DROP TABLE INVITATION_MANAGEMENT;
DROP TABLE WORK;
DROP TABLE HAVE_BOARD;
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
         REFERENCES SIGN_BOARD(sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT pk_organization PRIMARY KEY(worker_nickname ,boss_nickname ,sign_board_name)
);

CREATE TABLE INVITATION_MANAGEMENT (
   sign_board_name VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   nickname VARCHAR2(50) NOT NULL,
   invitation_date DATE DEFAULT SYSDATE NOT NULL,
   
   CONSTRAINT fk_invitation_management FOREIGN KEY(nickname) 
         REFERENCES MEMBER(nickname) ON DELETE CASCADE,
   CONSTRAINT fk_invitation_management_sign FOREIGN KEY(sign_board_name, boss_nickname) 
         REFERENCES SIGN_BOARD(sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT pk_invitation_management PRIMARY KEY(sign_board_name, boss_nickname,nickname)
);
   
CREATE TABLE BOARD_GENRE (
   BOARD_NO NUMBER PRIMARY KEY,
   BOARD_NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE HAVE_BOARD (
   sign_board_name VARCHAR2(50) NOT NULL,
   board_no NUMBER NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   
   CONSTRAINT fk_HAVE_BOARD_sign_board FOREIGN KEY(sign_board_name, boss_nickname) 
         REFERENCES SIGN_BOARD(sign_board_name, boss_nickname) ON DELETE CASCADE,
   CONSTRAINT fk_have_board_genre FOREIGN KEY(board_no) 
         REFERENCES BOARD_GENRE(board_no) ON DELETE CASCADE,
   CONSTRAINT pk_HAVE_BOARD PRIMARY KEY(sign_board_name,board_no,boss_nickname)
);

CREATE TABLE WORK(
   work_no NUMBER PRIMARY KEY,
   work_name VARCHAR2(50) NOT NULL,
   work_details clob NOT NULL,
   creation_DATE DATE DEFAULT SYSDATE NOT NULL,
   change_DATE DATE DEFAULT SYSDATE NOT NULL,
   board_no NUMBER default 1 NOT NULL,
   worker_nickname VARCHAR2(50),
   sign_board_name VARCHAR2(50) NOT NULL,
   boss_nickname VARCHAR2(50) NOT NULL,
   
   CONSTRAINT fk_work_BOARD_GENRE FOREIGN KEY(board_no) 
         REFERENCES BOARD_GENRE(board_no) ON DELETE CASCADE,
   CONSTRAINT fk_org_pk_organization FOREIGN KEY(worker_nickname,sign_board_name, boss_nickname) 
         REFERENCES ORGANIZATION(worker_nickname,sign_board_name, boss_nickname)
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
   
   CONSTRAINT fk_change_management_change FOREIGN KEY(change_no) 
         REFERENCES CHANGE_GENRE(change_no) ON DELETE CASCADE,
   CONSTRAINT fk_change_management_work FOREIGN KEY(work_no) 
         REFERENCES WORK(work_no)
);

-- INSERT MEMBER(테스트용 입니다.)
INSERT INTO MEMBER VALUES('sync','test1', '1');
INSERT INTO MEMBER VALUES('java','test2', '1');
INSERT INTO MEMBER VALUES('test','test3', '1');

-- INSERT BOARD_GENRE
INSERT INTO BOARD_GENRE VALUES(1, 'TO_DO');
INSERT INTO BOARD_GENRE VALUES(2, 'DOING');
INSERT INTO BOARD_GENRE VALUES(3, 'DONE');

-- INSERT CHANGE_GENRE(추가 수정 삭제 이동)
INSERT INTO CHANGE_GENRE VALUES(0, '추가');
INSERT INTO CHANGE_GENRE VALUES(1, '수정');
INSERT INTO CHANGE_GENRE VALUES(2, '삭제');
INSERT INTO CHANGE_GENRE VALUES(3, '이동');