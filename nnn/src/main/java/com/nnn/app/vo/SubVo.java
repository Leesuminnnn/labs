package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubVo {
/*
create table sub (
subcode varchar(20) not null comment '부서코드',
subname varchar(50) not null comment '부서명'
);
*/
	private String subcode;
	private String subname;
}
