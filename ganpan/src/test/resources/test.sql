drop table m_grade;
drop table member;
create table member(
   nickname varchar2(50) primary key,
   e_mail varchar2(100) unique not null,
   password varchar2(50) not null
)

drop table sign_board;
create table sign_board(
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   visibility number default 0 not null,
   creation_date date default sysdate not null,
   constraint fk_member_nickname foreign key(boss_nickname) references member(nickname),
   constraint pk_sign_board primary key(sign_board_name,boss_nickname)
)

drop table organization;
create table organization (
   worker_nickname varchar2(50) unique not null,
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   constraint fk_member_nickname2 foreign key(worker_nickname) references member(nickname),
   constraint fk_sign_board_pk_sign_board foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name,boss_nickname),
   constraint pk_organization primary key(worker_nickname ,sign_board_name,boss_nickname)
)



insert into member values('1','1','1');
insert into member values('2','2','2');
insert into member values('1','1','1');

insert into sign_board(sign_board_name, boss_nickname) values('1','1');
insert into sign_board(sign_board_name, boss_nickname) values('2','1');


drop table invitation_management;
create table invitation_management (
   nickname varchar2(50) not null,
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   invitation_date date default sysdate not null,
   constraint fk_member_nickname3 foreign key(nickname) references member(nickname),
   constraint fk_sign_board_pk_sign_board2 foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name, boss_nickname),
   constraint pk_invitation_management primary key(nickname ,sign_board_name, boss_nickname)
)

drop sequence seq_board_no;
create sequence seq_board_no;

drop table board_genre;
create table board_genre (
   sign_board_name varchar2(50) not null,
   boss_nickname varchar2(50) not null,
   board_no number not null,
   board_name varchar2(50) not null,
   constraint fk_sign_board_pk_sign_board3 foreign key(sign_board_name, boss_nickname) references sign_board(sign_board_name, boss_nickname),
   constraint pk_board_genre primary key(board_no ,sign_board_name, boss_nickname)
)

drop sequence seq_work_no;
create sequence seq_work_no;

drop table work
create table work(
    sign_board_name varchar2(50) not null,
    boss_nickname varchar2(50) not null,
    board_no number not null,
   work_no number primary key,
   work_name varchar2(50) not null,
   worker_nickname varchar2(50) not null,
   work_details clob not null,
   creation_date date default sysdate not null,
   change_date date default sysdate not null,
    constraint fk_board_genre_pk_board_genre foreign key(board_no, sign_board_name, boss_nickname) references board_genre(board_no, sign_board_name, boss_nickname),
    constraint fk_org_pk_organization foreign key(worker_nickname ,sign_board_name,boss_nickname) references organization(worker_nickname ,sign_board_name,boss_nickname)
)

drop table change_genre;
create table change_genre(
   change_no number primary key,
   change_name varchar2(50) not null
)

create sequence seq_change_management_no;

drop table change_management;
create table change_management(
   change_management_no number primary key,
   change_details clob not null,
   change_management_date date default sysdate not null,
   board_no number not null,
   work_no number not null,
   change_no number not null,
    constraint fk_change_genre_chane_no foreign key(change_no) references change_genre(change_no),
    constraint fk_work_work_no foreign key(work_no) references work(work_no)
)