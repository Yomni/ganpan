select * from member;

SELECT count(*), sign_board_name as singBoardName, boss_nickname as bossNickName
FROM sign_board

WHERE visibility = 0 and sign_board_name='test'


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