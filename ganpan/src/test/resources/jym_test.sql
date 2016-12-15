show triggers;

select * from member;
select * from SIGN_BOARD;
select * from ORGANIZATION;
select * from INVITATION_MANAGEMENT;

SELECT count(*), sign_board_name as singBoardName, boss_nickname as bossNickName
FROM sign_board

WHERE visibility = 0 and sign_board_name='test'

insert into SIGN_BOARD(boss_nickname,sign_board_name,visibility)
values('sync','test','1')
select nickname,e_mail,password from member
WHERE (nickname='' or e_mail='kosta@naver.com') and password ='123123';

select hb.sign_board_name, hb.board_no, hb.boss_nickname, bg.board_name
from have_board hb, board_genre bg
where hb.board_no=bg.board_no

select * from organization;
insert into organization(worker_nickname,boss_nickname,sign_board_name)
values('java','sync','test');

insert into work(work_no,work_name, work_details, worker_nickname, sign_board_name,boss_nickname)
values(seq_work_no.nextval, '콘텐츠상세보기','콘텐츠상세보기','java','test','sync');

select * 
from HAVE_BOARD;

select * from work;
update work set board_no = 2 where work_no = 3;

DROP TRIGGER sb_signboardname_trigger;
DROP TRIGGER org_signboardname_trigger;
DROP TRIGGER sb_bossnickname_trigger;
DROP TRIGGER org_bossnickname_trigger;
DROP TRIGGER org_delete_member_trigger;

CREATE OR REPLACE TRIGGER sb_signboardname_trigger
AFTER UPDATE OF sign_board_name ON sign_board 
FOR EACH ROW
BEGIN
  UPDATE ORGANIZATION
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
  UPDATE INVITATION_MANAGEMENT
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
  UPDATE HAVE_BOARD
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

CREATE OR REPLACE TRIGGER org_signboardname_trigger
AFTER UPDATE OF sign_board_name ON ORGANIZATION
FOR EACH ROW
BEGIN
  UPDATE WORK
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

CREATE OR REPLACE TRIGGER sb_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON SIGN_BOARD FOR EACH ROW
BEGIN
  UPDATE INVITATION_MANAGEMENT
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
  UPDATE ORGANIZATION
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
  UPDATE HAVE_BOARD
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

CREATE OR REPLACE TRIGGER org_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON ORGANIZATION FOR EACH ROW
BEGIN
  UPDATE WORK
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

-- 회원 탈퇴 시 해당 회원이 가진 간판 삭제 시 work들도 같이 삭제되어야 한다.
CREATE OR REPLACE TRIGGER org_delete_member_trigger
AFTER DELETE ON SIGN_BOARD
FOR EACH ROW
BEGIN
	DELETE FROM WORK
	WHERE sign_board_name = :OLD.sign_board_name
			and boss_nickname = :OLD.boss_nickname;
END;

DELETE FROM MEMBER WHERE NICKNAME = 'sync';

update work set worker_nickname = null where boss_nickname = 'sync' and sign_board_name = 'test' and worker_nickname = '1';
delete from organization where boss_nickname = 'sync' and sign_board_name = 'test' and worker_nickname = '1';

select * from BOARD_GENRE;
select * from SIGN_BOARD;
select * from ORGANIZATION;
select * from HAVE_BOARD;
select * from work;
select * from CHANGE_MANAGEMENT;
delete from work;
select  *  from user_triggers;

DELETE FROM WORK;

SELECT worker_nickname from work where work_no = 1

insert into CHANGE_MANAGEMENT(change_management_no,change_worker,change_management_date,work_no,change_no)
		values(seq_change_management_no.nextval,(SELECT worker_nickname from work where work_no = 1),sysdate,1,2)
update work
		set work_name='업데이트',
			work_details='상세내용',
			change_date = sysdate 
		where work_no = 45