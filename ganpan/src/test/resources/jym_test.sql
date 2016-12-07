select * from member;

SELECT count(*), sign_board_name as singBoardName, boss_nickname as bossNickName
FROM sign_board

WHERE visibility = 0 and sign_board_name='test'


select nickname,e_mail,password from member
WHERE (nickname='' or e_mail='kosta@naver.com') and password ='123123';

select hb.sign_board_name, hb.board_no, hb.boss_nickname, bg.board_name
		from have_board hb, board_genre bg
		where hb.board_no=bg.board_no

		
