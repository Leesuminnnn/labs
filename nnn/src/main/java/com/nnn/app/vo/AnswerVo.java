package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*


create table answer (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
u1 varchar(30) not null COMMENT '기관명',
u2 varchar(10) null comment '평가자 사번',
t1 varchar(10) null comment '평가대상자 사번',
team varchar(5) not null comment '평가 유형',
d1 varchar(1000) null comment '문제답안'
);


*/

@Getter
@Setter
@ToString
public class AnswerVo {
	private int idx;
	private String u1;
	private String u2;
	private String t1;
	private String team;
	private String d1;
}
