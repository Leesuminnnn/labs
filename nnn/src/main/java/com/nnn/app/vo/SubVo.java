package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubVo {
/*
create table sub (
id VARCHAR(30) NOT NULL COMMENT '사원번호',
subcode varchar(20) not null comment '부서코드',
subname varchar(50) not null comment '부서명'
);
*/
	private String id;
	private String subcode;
	private String subname;
}
