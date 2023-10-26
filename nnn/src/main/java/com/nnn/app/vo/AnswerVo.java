package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*

create table answer (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
d1 varchar(100) not null COMMENT '답안',
d2 int(11) not null comment '문제은행 idx',
d3 varchar(10) not null comment '평가자 사번',
d4 varchar(10) not null comment '평가 대상자 사번'
);

*/

@Getter
@Setter
@ToString
public class AnswerVo {
	private int idx;
	private String d1;
	private String d2;
	private String d3;
	private String d4;
}
