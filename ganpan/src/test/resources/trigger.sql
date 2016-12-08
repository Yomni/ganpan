<!--
CREATE 부터 END 하나씩 까지 끌어서
시작프로그램 -> Database 홈페이지로 이동 -> final / project 입력 후
SQL -> SQL명령에서 실행해 주세요
-->

DROP TRIGGER sign_board_org_trigger;
DROP TRIGGER sb_sbname_invite_trigger;
DROP TRIGGER sb_sbname_have_trigger;
DROP TRIGGER sb_bossnickname_invite_trigger;
DROP TRIGGER sb_bossnickname_org_trigger;
DROP TRIGGER sb_bossnickname_have_trigger;
DROP TRIGGER hb_bossnickname_work_trigger;
DROP TRIGGER org_bossnickname_work_trigger


CREATE OR REPLACE TRIGGER sb_sbname_org_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE organization
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


CREATE OR REPLACE TRIGGER sign_board_invite_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE invitation_management
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


CREATE OR REPLACE TRIGGER sign_board_have_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE HAVE_BOARD
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


CREATE OR REPLACE TRIGGER sb_bossnickname_invite_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE invitation_management
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;


CREATE OR REPLACE TRIGGER sb_bossnickname_org_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE organization
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;


CREATE OR REPLACE TRIGGER sb_bossnickname_have_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE have_board
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;


CREATE OR REPLACE TRIGGER hb_bossnickname_work_trigger
AFTER UPDATE ON have_board FOR EACH ROW
BEGIN
  UPDATE work
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;


CREATE OR REPLACE TRIGGER org_bossnickname_work_trigger
AFTER UPDATE ON organization FOR EACH ROW
BEGIN
  UPDATE work
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

