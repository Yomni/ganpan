DROP TRIGGER sb_signboardname_trigger;
DROP TRIGGER org_signboardname_trigger;
DROP TRIGGER sb_bossnickname_trigger;
DROP TRIGGER org_bossnickname_trigger;
DROP TRIGGER sb_sbn_changemng_trigger;
DROP TRIGGER sb_bs_changemng_trigger;

-- 간판명 변경 시 다른 테이블도 수정
CREATE OR REPLACE TRIGGER sb_signboardname_trigger
AFTER UPDATE OF sign_board_name ON sign_board 
FOR EACH ROW
BEGIN
  UPDATE ORGANIZATION
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
  UPDATE INVITATION_MANAGEMENT
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
  UPDATE HAVE_BOARD
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
END;

-- WORK는 직접적으로 SIGN_BOARD와는 관계 맺지 않기 때문에 따로 트리거 생성
CREATE OR REPLACE TRIGGER org_signboardname_trigger
AFTER UPDATE OF sign_board_name ON ORGANIZATION
FOR EACH ROW
BEGIN
  UPDATE WORK
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
END;

-- 조장 변경 시 다른 테이블도 수정
CREATE OR REPLACE TRIGGER sb_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON SIGN_BOARD FOR EACH ROW
BEGIN
  UPDATE INVITATION_MANAGEMENT
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname and sign_board_name = :OLD.sign_board_name;
  UPDATE ORGANIZATION
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname and sign_board_name = :OLD.sign_board_name;
  UPDATE HAVE_BOARD
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname and sign_board_name = :OLD.sign_board_name;
END;

-- WORK는 직접적으로 SIGN_BOARD와는 관계 맺지 않기 때문에 따로 트리거 생성
CREATE OR REPLACE TRIGGER org_bossnickname_trigger
AFTER UPDATE OF boss_nickname ON ORGANIZATION FOR EACH ROW
BEGIN
  UPDATE WORK
  SET boss_nickname=:NEW.boss_nickname
  WHERE boss_nickname=:OLD.boss_nickname and sign_board_name = :OLD.sign_board_name;
END;

-- ++ 변경이력 관련 트리거 추가
CREATE OR REPLACE TRIGGER sb_sbn_changemng_trigger
AFTER UPDATE OF sign_board_name ON sign_board 
FOR EACH ROW
BEGIN
  UPDATE CHANGE_MANAGEMENT
  SET sign_board_name=:NEW.sign_board_name
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
END;


CREATE OR REPLACE TRIGGER sb_bs_changemng_trigger
AFTER UPDATE OF boss_nickname ON sign_board 
FOR EACH ROW
BEGIN
  UPDATE CHANGE_MANAGEMENT
  SET boss_nickname=:NEW.boss_nickname
  WHERE sign_board_name=:OLD.sign_board_name and boss_nickname=:OLD.boss_nickname;
END;

