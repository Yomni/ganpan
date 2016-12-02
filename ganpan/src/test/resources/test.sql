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

