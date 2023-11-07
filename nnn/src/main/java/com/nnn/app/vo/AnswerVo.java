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
d1 varchar(100) null comment '문제답안'
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
}
