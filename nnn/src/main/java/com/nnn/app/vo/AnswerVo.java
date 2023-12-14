package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


/*

create table answer (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
u1 varchar(30) not null COMMENT '기관명',
u2 varchar(10) null comment '평가자 사번',
t1 varchar(10) null comment '평가대상자 사번',
team varchar(10) not null comment '평가 유형',
ev varchar(10) not null comment '문제유형',
d1 varchar(1000) null comment '문제답안',
regdate datetime default now() comment '답안 시간'
);

*/

@Getter
@Setter
public class AnswerVo {
	private int idx;
	private String u1;
	private String u2;
	private String t1;
	private String team;
	private String ev;
	private String d1;
	private Date regdate;
}
