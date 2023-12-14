package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UseroptionVo {
/*
create table useroption (
id VARCHAR(30) NOT NULL COMMENT '사원번호',
k varchar(10) not null default 'F' comment '경혁팀장여부',
v varchar(10) not null default 'F' comment '경혁팀여부',
b varchar(10) not null default 'F' comment '부서장여부',
x varchar(10) not null default 'F' comment '1인부서여부',
z varchar(10) not null default 'F' comment '진료팀장여부',
a varchar(10) not null default 'F' comment '진료부여부',
del_yn char(5) not null default 'N' comment '평가제외 여부'
);

*/
	private String id;
	private String k;
	private String v;
	private String b;
	private String x;
	private String z;
	private String a;
	private String del_yn;
}
