DROP TRIGGER sb_signboardname_trigger;
DROP TRIGGER sb_bossnickname_trigger;
DROP TRIGGER org_bossnickname_trigger;
DROP TRIGGER org_signboardname_trigger;
DROP TRIGGER hb_bossnickname_trigger;
DROP TRIGGER hb_bossnickname_trigger;



CREATE OR REPLACE TRIGGER sb_signboardname_trigger
AFTER UPDATE OF sign_board_name ON sign_board FOR EACH ROW
BEGIN
  UPDATE organization
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
  UPDATE invitation_management
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
  UPDATE HAVE_BOARD
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

CREATE OR REPLACE TRIGGER sb_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON sign_board FOR EACH ROW
BEGIN
  UPDATE invitation_management
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
  UPDATE organization
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
  UPDATE have_board
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

CREATE OR REPLACE TRIGGER org_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON organization FOR EACH ROW
BEGIN
  UPDATE work
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

CREATE OR REPLACE TRIGGER org_signboardname_trigger
AFTER UPDATE OF sign_board_name ON organization FOR EACH ROW
BEGIN
  UPDATE work
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

CREATE OR REPLACE TRIGGER hb_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON have_board FOR EACH ROW
BEGIN
  UPDATE work
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

CREATE OR REPLACE TRIGGER hb_signboardname_trigger
AFTER UPDATE OF sign_board_name ON have_board FOR EACH ROW
BEGIN
  UPDATE work
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


















DROP TRIGGER sb_sbname_org_trigger;
DROP TRIGGER sb_sbname_invite_trigger;
DROP TRIGGER sb_sbname_have_trigger;
DROP TRIGGER sb_bossnickname_invite_trigger;
DROP TRIGGER sb_bossnickname_org_trigger;
DROP TRIGGER sb_bossnickname_have_trigger;
DROP TRIGGER hb_bossnickname_work_trigger;
DROP TRIGGER hb_sbname_work_trigger;
DROP TRIGGER org_bossnickname_work_trigger;
DROP TRIGGER org_sbname_work_trigger;

CREATE OR REPLACE TRIGGER sb_sbname_org_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE organization
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;

CREATE OR REPLACE TRIGGER sb_sbname_invite_trigger
AFTER UPDATE ON sign_board FOR EACH ROW
BEGIN
  UPDATE invitation_management
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


CREATE OR REPLACE TRIGGER sb_sbname_have_trigger
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

CREATE OR REPLACE TRIGGER hb_sbname_work_trigger
AFTER UPDATE ON have_board FOR EACH ROW
BEGIN
  UPDATE work
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;


CREATE OR REPLACE TRIGGER org_bossnickname_work_trigger
AFTER UPDATE ON organization FOR EACH ROW
BEGIN
  UPDATE work
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname;
END;

CREATE OR REPLACE TRIGGER org_sbname_work_trigger
AFTER UPDATE ON organization FOR EACH ROW
BEGIN
  UPDATE work
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name;
END;
