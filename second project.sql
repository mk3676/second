create database db;
use db;

select @@global.time_zone, @@session.time_zone;
SET GLOBAL time_zone='Asia/Seoul';
SET time_zone='Asia/Seoul';
commit;

create table userInfo(
	cnt int(100) not null auto_increment primary key,
	username varchar(100),
    phone varchar(100),
    email varchar(150),
    pwd varchar(100), 
    imageName varchar(500),
    structureName varchar(100),
    tiltName varchar(100),
    pointer varchar(50),
    status varchar(100) default "열람가능",
    creDate datetime default now()
);
commit;
select * from userInfo;

select count(loc.DATE) from aa26398_tilt as tilt inner join aa26398_loc as loc
			on tilt.opdatetime = loc.DATE;