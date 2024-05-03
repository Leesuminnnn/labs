package com.nnn.app.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*

create table access (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
id VARCHAR(30) NOT NULL COMMENT '사원번호',
authhorize VARCHAR(30) NOT NULL COMMENT '권한관리'
);

*/

@Getter
@Setter
@ToString
public class Access {
	private int idx;
	private String col1;
	private String col2;
}
