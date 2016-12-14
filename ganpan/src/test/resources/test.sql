drop table change_management;
drop sequence seq_change_management_no;
drop table change_genre;
drop table work;
drop sequence seq_work_no;
drop table board_genre;
drop table invitation_management;
drop table organization;
drop table sign_board;
drop table member;

delete from work where work_no='1';
select * from work;

SELECT worker_nickname
		FROM organization 
		WHERE boss_nickname='우주선' and sign_board_name='간판';

insert into member(nickname,e_mail,password) values('민영','kosta111@kosta.com','1234');


create table member(
   nickname varchar2(50) primary key,
   e_mail varchar2(100) unique not null,
   password varchar2(50) not null
)
create table sign_board(
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   visibility number default 0 not null,
   creation_date date default sysdate not null,
   constraint fk_member_nickname foreign key(boss_nickname) references member(nickname),
   constraint pk_sign_board primary key(sign_board_name,boss_nickname)
)
select s.sign_board_name, m.nickname as boss_nickname
from sign_board s, member m
where s.boss_nickname=m.nickname and sign_board_name='간판';

SELECT sign_board_name, boss_nickname
FROM sign_board
WHERE sign_board_name = '간판';

create table organization (
   worker_nickname varchar2(50) unique not null,
   boss_nickname varchar2(50) not null,
   sign_board_name varchar2(50) not null,
   constraint fk_member_nickname2 foreign key(worker_nickname) references member(nickname),
   constraint fk_sign_board_pk_sign_board foreign key(sign_board_name, boss_nickname) references sign_board(boss_nickname,sign_board_name),
   constraint pk_organization primary key(worker_nickname ,boss_nickname ,sign_board_name)
)

insert into organization values('엄민영', '우주선', '간판2');
insert into organization values('엄민영', '우주선', '1234');
select * from organization;

create table invitation_management (
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   nickname varchar2(50) not null,
   invitation_date date default sysdate not null,
   constraint fk_member_nickname3 foreign key(nickname) references member(nickname),
   constraint fk_sign_board_pk_sign_board2 foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name, boss_nickname),
   constraint pk_invitation_management primary key(sign_board_name, boss_nickname,nickname)
)
insert into invitation_management(sign_board_name, boss_nickname, nickname)
values('간판', '우주선', '민영');
insert into invitation_management(sign_board_name, boss_nickname, nickname)
values('간판2', '우주선', '민영');

Delete invitation_management 
Where sign_board_name='간판' and boss_nickname='우주선' and nickname='민영'
 	

SELECT sign_board_name, boss_nickname, nickname, invitation_date
FROM invitation_management
WHERE nickname = '민영'

--board no : TODO(1) / DOING(2) / DONE(3)
create table board_genre (
   sign_board_name varchar2(50) not null,
   board_no number not null,
   boss_nickname varchar2(50) not null,
   board_name varchar2(50) not null,
   constraint fk_sign_board_pk_sign_board3 foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name, boss_nickname),
   constraint pk_board_genre primary key(sign_board_name,board_no,boss_nickname)
)

create sequence seq_work_no;
create table work(
   work_no number primary key,
   work_name varchar2(50) not null,
   work_details clob not null,
   creation_date date default sysdate not null,
   change_date date default sysdate not null,
   board_no number not null,
   worker_nickname varchar2(50) not null,
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
    constraint fk_board_genre_pk_board_genre foreign key(board_no, sign_board_name, boss_nickname) references board_genre(board_no, sign_board_name, boss_nickname),
    constraint fk_org_pk_organization foreign key(worker_nickname ,sign_board_name,boss_nickname) references organization(worker_nickname ,sign_board_name,boss_nickname)
)

create table change_genre(
   change_no number primary key,
   change_name varchar2(50) not null
)

create sequence seq_change_management_no;
create table change_management(
   change_management_no number primary key,
   change_details clob not null,
   change_management_date date default sysdate not null,
   board_no number not null,
   work_no number not null,
   change_no number not null,
    constraint fk_change_genre_change_no foreign key(change_no) references change_genre(change_no),
    constraint fk_work_work_no foreign key(work_no) references work(work_no)
)


-- InvitationMngVO has a MemberVO ( composition )
SELECT sb.sign_board_name, sb.boss_nickname, m.nickname, im.invitation_date
FROM invitation_management im, member m, sign_board sb
WHERE im.sign_board_name = sb.sign_board_name and im.boss_nickname = sb.boss_nickname and im.nickname = m.nickname;

-- BoardGenreVO has a WorkVO ( aggregation )
SELECT bg.sign_board_name, bg.boss_nickname, bg.board_no, w.work_no, w.work_name, w.work_details, w.creation_date, w.change_date, o.worker_nickname
FROM board_genre bg, work w, organization o
WHERE bg.sign_board_name = w.sign_board_name and bg.board_no = w.board_no and bg.boss_nickname = w.boss_nickname 
and o.worker_nickname = w.worker_nickname;

-- SignBoardVO has a MemberVO & has a BoardGenreVO
SELECT sb.sign_board_name, sb.boss_nickname, sb.visibility, sb.creation_date, bg.board_name, m.nickname as boss_nickname
FROM sign_board sb, board_genre bg, member m
WHERE sb.sign_board_name = bg.sign_board_name and sb.boss_nickname = m.nickname;

-- ChangeMngVO has a ChangeGenreVO & has a WorkVO
SELECT cm.change_management_no, cm.change_details, cm.change_management_date, cm.board_no, w.work_no, cg.change_no
FROM change_management cm, change_genre cg, work w
WHERE w.work_no = cm.work_no and cg.change_no = cm.change_no; 

-- WorkVO has a OrganizationVO
SELECT w.work_name, w.work_details, w.creation_date, w.change_date, bg.board_no, o.worker_nickname, bg.sign_board_name 
as bgboardname, bg.boss_nickname as bgboss, o.sign_board_name as o, o.boss_nickname as oboss
FROM work w, organization o, board_genre bg
WHERE w.board_no = bg.board_no and w.sign_board_name = bg.sign_board_name and w.boss_nickname = bg.boss_nickname 
and w.worker_nickname = o.worker_nickname and w.sign_board_name = o.sign_board_name and w.boss_nickname = o.boss_nickname;

insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판','우주선','0');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판2','우주선','0');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판3','우주선','1');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판','민영','0');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판2','민영','1');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판3','민영','0');
insert into SIGN_BOARD(sign_board_name,boss_nickname,visibility) values('간판4','민영','1');


insert into ORGANIZATION(worker_nickname,boss_nickname,sign_board_name) values('kosta','우주선','간판');
insert into ORGANIZATION(worker_nickname,boss_nickname,sign_board_name) values('민영','우주선','간판2');

insert into ORGANIZATION(worker_nickname,boss_nickname,sign_board_name) values('kosta','kosta1','ganpan1');

select * from organization;

SELECT sb.sign_board_name, sb.boss_nickname
FROM sign_board sb, organization o 
WHERE sb.sign_board_name = o.sign_board_name and sb.boss_nickname = o.boss_nickname and worker_nickname = '민영';
	
SELECT sb.sign_board_name, sb.boss_nickname
FROM sign_board sb, organization o 
WHERE sb.sign_board_name = o.sign_board_name and sb.boss_nickname = o.boss_nickname and worker_nickname = '민영'
	
SELECT sign_board_name, boss_nickname, visibility
FROM sign_board
WHERE sign_board_name = 'test' and boss_nickname = '우주선'
				
UPDATE sign_board
SET sign_board_name = '간판1'
WHERE sign_board_name = '간판' and boss_nickname = '우주선'

UPDATE sign_board
SET visibility = 1
WHERE sign_board_name = '간판1' and boss_nickname = ''

INSERT into invitation_management(sign_board_name, boss_nickname, nickname) 
VALUES ('ganpan1','kosta1','dja')
 		

		SELECT worker_nickname
		FROM organization 
		WHERE boss_nickname='kosta3' and sign_board_name='ganpan3';
		
		
		
		/*************************member 값*************************************************************/

insert into member(nickname,e_mail,password) values('kosta1','kosta1@kosta.com','1234');
insert into member(nickname,e_mail,password) values('kosta2','kosta2@kosta.com','1234');
insert into member(nickname,e_mail,password) values('kosta3','kosta3@kosta.com','1234');
insert into member(nickname,e_mail,password) values('kosta4','kosta4@kosta.com','1234');
insert into member(nickname,e_mail,password) values('kosta5','kosta5@kosta.com','1234');

/*************************sign_board값*************************************************************/
insert into sign_board(sign_board_name,boss_nickname,visibility,creation_date) 
values('ganpan1','kosta1','1',to_date('2016/12/01 9:00','YYYY/MM/DD HH24:MI'));

insert into sign_board(sign_board_name,boss_nickname,visibility,creation_date) 
values('ganpan2','kosta2','0',to_date('2016/12/02 12:00','YYYY/MM/DD HH24:MI'));

insert into sign_board(sign_board_name,boss_nickname,visibility,creation_date) 
values('ganpan3','kosta3','1',to_date('2016/12/03 12:00','YYYY/MM/DD HH24:MI'));

insert into sign_board(sign_board_name,boss_nickname,visibility,creation_date) 
values('ganpan4','kosta4','0',to_date('2016/12/04 12:00','YYYY/MM/DD HH24:MI'));

insert into sign_board(sign_board_name,boss_nickname,visibility,creation_date) 
values('ganpan5','kosta5','1',to_date('2016/12/05 12:00','YYYY/MM/DD HH24:MI'));

/*********************************organization 값 *********************************/
select * from member;
delete from member where nickname='minseo';
select * from sign_board;
select * from organization;

insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta1','kosta3','ganpan3');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta2','kosta4','ganpan4');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta3','kosta5','ganpan5');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta4','kosta2','ganpan2');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta5','kosta1','ganpan1');

----------------------invitation_management-----------------------------------------------------------
select * from invitation_management;

insert into invitation_management (sign_board_name,boss_nickname,nickname,invitation_date) 
values ('ganpan1','kosta1','kosta2',to_date('2016/11/01 12:00','YYYY/MM/DD HH24:MI'));

insert into invitation_management (sign_board_name,boss_nickname,nickname,invitation_date) 
values ('ganpan2','kosta2','kosta3',to_date('2016/11/02 12:00','YYYY/MM/DD HH24:MI'));

insert into invitation_management (sign_board_name,boss_nickname,nickname,invitation_date) 
values ('ganpan3','kosta3','kosta4',to_date('2016/11/03 12:00','YYYY/MM/DD HH24:MI'));

insert into invitation_management (sign_board_name,boss_nickname,nickname,invitation_date) 
values ('ganpan4','kosta4','kosta5',to_date('2016/11/04 12:00','YYYY/MM/DD HH24:MI'));

------------------------board_genre-----------------------------
select * from board_genre;

insert into board_genre(sign_board_name,board_no,boss_nickname,board_name) values('ganpan1','1','kosta1','todo');
insert into board_genre(sign_board_name,board_no,boss_nickname,board_name) values('ganpan2','2','kosta2','doing');
insert into board_genre(sign_board_name,board_no,boss_nickname,board_name) values('ganpan3','3','kosta3','done');
insert into board_genre(sign_board_name,board_no,boss_nickname,board_name) values('ganpan4','1','kosta4','todo');
insert into board_genre(sign_board_name,board_no,boss_nickname,board_name) values('ganpan5','2','kosta5','doing');

-----------------------------------------work-------------------------------------
   
insert into work(work_no,work_name,work_details,creation_date,change_date,board_no,worker_nickname,sign_board_name,boss_nickname)
values('1','work1','detail1',to_date('2016/11/05 12:00','YYYY/MM/DD HH24:MI'),to_date('2016/11/06 12:00','YYYY/MM/DD HH24:MI'),
'1','kosta2','ganpan1','kosta1');

---------------------------------change_genre-----------------------------------
select * from change_genre;

insert into change_genre(change_no,change_name) values('0','생성');
insert into change_genre(change_no,change_name) values('1','수정');
insert into change_genre(change_no,change_name) values('2','삭제');
insert into change_genre(change_no,change_name) values('3','이동');

----------------------------change_management----------------------------------
select * from change_management;
 
insert into change_management(change_management_no,change_worker,change_management_date,board_no,work_no,change_no)
values('111','kosta1',to_date('2016/11/05 12:00','YYYY/MM/DD HH24:MI'),'1','1','0');

SELECT worker_nickname
		FROM organization 
		WHERE boss_nickname='kosta3' and sign_board_name='ganpan3'

		SELECT sb.sign_board_name, sb.boss_nickname
		FROM sign_board sb, organization o 
		WHERE sb.sign_board_name = o.sign_board_name and sb.boss_nickname = o.boss_nickname and worker_nickname = '민영'

		
		SELECT sign_board_name, boss_nickname, visibility
		FROM sign_board
		WHERE sign_board_name = '간판' and boss_nickname = '우주선'

SELECT im.nickname as nickName, m.e_mail as eMail, im.invitation_date as invitationDate
FROM member m, invitation_management im
WHERE m.nickname=im.nickname and boss_nickname='dja' and sign_board_name='ggg'

delete member;
insert into member values('ㅈㅅ','bubjalsdud@naver.com','1');
CREATE OR REPLACE TRIGGER test_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE organization
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

select * from member;
select * from organization;

 UPDATE sign_board
 SET boss_nickname = 'kosta1'
 WHERE sign_board_name = 'kosta1꺼' and boss_nickname = 'ㅈㅅ'
 
SELECT count(*)
FROM organization
WHERE boss_nickname = 'ㅈㅅ' and sign_board_name = 'kosta1꺼' and worker_nickname = 'kosta1'
 

UPDATE sign_board
SET boss_nickname = '주선'
WHERE sign_board_name = 'java꺼' and boss_nickname = 'sync'

SELECT * FROM member;
SELECT * FROM sign_board;
SELECT * FROM invitation_management;
SELECT * FROM organization;
SELECT * FROM have_board;
SELECT * FROM work;

INSERT INTO MEMBER VALUES('java','test2', '1');
INSERT INTO MEMBER VALUES('test','test3', '1');


insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta16@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta17@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta18@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta19@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta20@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta21@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta22@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta23@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta24@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta25@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta26@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta27@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta28@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta29@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta30@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta31@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta32@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta33@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta34@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta35@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta36@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta37@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta38@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta39@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta40@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta41@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta42@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta43@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta44@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta45@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta46@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta47@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta48@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta49@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta50@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta51@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta52@naver.com','kosta1','엄');
insert into organization(worker_nickname,boss_nickname,sign_board_name) values('kosta53@naver.com','kosta1','엄');

