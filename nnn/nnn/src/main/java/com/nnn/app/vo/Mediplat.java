package com.nnn.app.vo;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

/*

create table mediplat_title (
idx int(11) not null AUTO_INCREMENT PRIMARY KEY,
col1 varchar(50) null comment '제목1',
col2 varchar(50) null comment '제목2',
col3 varchar(50) null comment '배경색상',
col4 varchar(50) null comment '글씨색상',
del_yn varchar(10) default 'N' comment '삭제여부',
on_yn varchar(10) default 'Y' comment '사용여부'
);


*/
@Getter
@Setter
@ToString
public class Mediplat {
	private int idx;
	private String col1;
	private String col2;
	private String col3;
	private String col4;
	private String del_yn;
	private String on_yn;

}
