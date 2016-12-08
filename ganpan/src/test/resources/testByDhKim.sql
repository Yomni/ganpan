-- member table member insert
insert into member values('kosta1','kosta1@kosta.com','1234');
insert into member values('kosta2','kosta2@kosta.com','1234');
insert into member values('kosta3','kosta3@kosta.com','1234');
insert into member values('kosta4','kosta4@kosta.com','1234');
insert into member values('kosta5','kosta5@kosta.com','1234');
insert into member values('kosta6','kosta6@kosta.com','1234');
insert into member values('kosta7','kosta7@kosta.com','1234');
insert into member values('kosta8','kosta8@kosta.com','1234');
insert into member values('kosta9','kosta9@kosta.com','1234');
insert into member values('kosta10','kosta10@kosta.com','1234');
-- sign_board table signboard insert
insert into sign_board values('ganpan1','kosta1',0,sysdate);

-- organization table organization insert
insert into organization values('kosta3','kosta1','ganpan1');
insert into organization values('kosta4','kosta1','ganpan1');
insert into organization values('kosta5','kosta1','ganpan1');
insert into organization values('kosta6','kosta1','ganpan1');

-- invitation_management
insert into invitation_management values('ganpan1','kosta1','kosta2',sysdate);

-- board_genre
insert into board_genre values(1,'todo');
insert into board_genre values(2,'doing');
insert into board_genre values(3,'done');

-- have_board
insert into have_board values('ganpan1',1,'kosta1');
insert into have_board values('ganpan1',2,'kosta1');
insert into have_board values('ganpan1',3,'kosta1');

-- work
insert into work values(seq_work_no.nextval,'work1','상세정보1',sysdate,sysdate,1,'kosta3','ganpan1','kosta1');
insert into work values(seq_work_no.nextval,'work2','상세정보2',sysdate,sysdate,1,'kosta4','ganpan1','kosta1');
insert into work values(seq_work_no.nextval,'work3','상세정보3',sysdate,sysdate,1,'kosta5','ganpan1','kosta1');
insert into work values(seq_work_no.nextval,'work4','상세정보4',sysdate,sysdate,1,'kosta6','ganpan1','kosta1');

-- change_genre
insert into change_genre values(0,'추가');
insert into change_genre values(1,'수정');
insert into change_genre values(2,'삭제');
insert into change_genre values(3,'이동');

-- change_management
insert into change_management values(1,'kosta3',sysdate,1,1,0);
insert into change_management values(2,'kosta4',sysdate,1,2,0);


-- test
select * from member;
select * from organization;
select * from work;

-- null로 업데이트
update work
set worker_nickname=null
where worker_nickname='kosta6'
and boss_nickname='kosta1'
and sign_board_name='ganpan1';

--다시 업데이트
update work
set worker_nickname='kosta6'
where work_no=4
and boss_nickname='kosta1'
and sign_board_name='ganpan1';

-- organization 에서 delete
select * from organization;
delete from organization
where worker_nickname='kosta6'

insert into organization values('kosta6','kosta1','ganpan1');




