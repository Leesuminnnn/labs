package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*

--  평가 진행 여부 확인 테이블
create table whether (
d1 varchar(10) null comment '평가자 사번',
d2 varchar(10) null comment '평가 대상자 사번',
d3 varchar(10) null comment '진행 여부'
);

*/


@Getter
@Setter
@ToString
public class WhetherVo {

	private int d1;
	private int d2;
	private String d3;
}
