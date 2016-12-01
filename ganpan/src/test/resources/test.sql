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

create table member(
   nickname varchar2(50) primary key,
   e_mail varchar2(100) unique not null,
   password varchar2(50) not null
)
select * from member
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

create table invitation_management (
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   nickname varchar2(50) not null,
   invitation_date date default sysdate not null,
   constraint fk_member_nickname3 foreign key(nickname) references member(nickname),
   constraint fk_sign_board_pk_sign_board2 foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name, boss_nickname),
   constraint pk_invitation_management primary key(sign_board_name, boss_nickname,nickname)
)

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

