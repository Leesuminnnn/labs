package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*

create table notice (
idx int(11) AUTO_INCREMENT not null PRIMARY KEY,
d1 varchar(50) null comment '공지사항구분',
d2 varchar(50) null comment '공지사항제목',
d3 varchar(100) null comment '공지사항내용'
);

*/

@Getter
@Setter
@ToString
public class NoticeVo {
	private int idx;
	private String d1;
	private String d2;
	private String d3;
}
