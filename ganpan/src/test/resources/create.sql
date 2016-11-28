
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

create table organization (
	worker_nickname varchar2(50) not null,
	sign_board_name varchar2(50) not null,
	boss_nickname varchar2(50) not null,
	constraint fk_
)


