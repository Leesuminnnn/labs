package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*

--  평가 진행 여부 확인 테이블
create table whether (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
d1 varchar(10) null comment '평가자 사번',
d2 varchar(10) null comment '평가 대상자 사번',
d3 varchar(10) null comment '진행 여부',
team varchar(10) null comment '평가유형',
ev varchar(10) null comment '문제유형' 
);

*/


@Getter
@Setter
@ToString
public class CWhetherVo {
	
	private int idx;
	private int d1;
	private int d2;
	private String d3;
	private String ev;
	private String team;
	private String del_yn;
}
