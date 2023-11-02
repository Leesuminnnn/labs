package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*


create table answer (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
u1 varchar(30) not null COMMENT '기관명',
u2 varchar(30) not null COMMENT '평가자 부서명',
u3 varchar(10) not null comment '평가자 직책',
u4 varchar(10) null comment '평가자 이름',
u5 varchar(10) null comment '평가자 사번',
t1 varchar(10) null comment '평가대상자 부서',
t2 varchar(10) null comment '평가대상자 직책',
t3 varchar(10) null comment '평가대상자 이름',
t4 varchar(10) null comment '평가대상자 사번',
ev varchar(5) not null comment '평가 유형',
d1 varchar(50) null comment '문제답안',
d2 varchar(50) null comment '문제답안',
d3 varchar(50) null comment '문제답안',
d4 varchar(50) null comment '문제답안',
d5 varchar(50) null comment '문제답안',
d6 varchar(50) null comment '문제답안',
d7 varchar(50) null comment '문제답안',
d8 varchar(50) null comment '문제답안',
d9 varchar(50) null comment '문제답안',
d10 varchar(50) null comment '문제답안',
d11 varchar(50) null comment '문제답안',
d12 varchar(50) null comment '문제답안',
d13 varchar(50) null comment '문제답안',
d14 varchar(50) null comment '문제답안',
d15 varchar(50) null comment '문제답안',
d16 varchar(50) null comment '문제답안',
d17 varchar(50) null comment '문제답안',
d18 varchar(50) null comment '문제답안',
d19 varchar(50) null comment '문제답안',
d20 varchar(50) null comment '문제답안',
d21 varchar(50) null comment '문제답안'
);


*/

@Getter
@Setter
@ToString
public class AnswerVo {
	private int idx;
	private String u1;
	private String u2;
	private String u3;
	private String u4;
	private String u5;
	private String t1;
	private String t2;
	private String t3;
	private String t4;
	private String ev;
	private String d1;
	private String d2;
	private String d3;
	private String d4;
	private String d5;
	private String d6;
	private String d7;
	private String d8;
	private String d9;
	private String d10;
	private String d11;
	private String d12;
	private String d13;
	private String d14;
	private String d15;
	private String d16;
	private String d17;
	private String d18;
	private String d19;
	private String d20;
	private String d21;
}
