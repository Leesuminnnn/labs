package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table evaluation (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
d1 varchar(100) not null COMMENT '문제',
d2 varchar(10) not null comment '문제 유형',
d3 varchar(10) not null comment '구분'
);
*/


@Getter
@Setter
@ToString
public class EvaluationVo {
	private int idx;
	private String d1;
	private String d2;
	private String d3;

}
