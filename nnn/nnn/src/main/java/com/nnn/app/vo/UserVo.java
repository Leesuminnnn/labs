package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo {
/*
create table users (
idx INT AUTO_INCREMENT PRIMARY KEY comment '순번',
c_name VARCHAR(30) NOT NULL COMMENT '기관명',
c_name2 VARCHAR(30) NOT NULL COMMENT '소속기관명',
subname varchar(30) not null comment '부서명',
id VARCHAR(30) NOT NULL COMMENT '사원번호',
pwd VARCHAR(100) NULL COMMENT '비밀번호',
position VARCHAR(30) NOT NULL COMMENT '직급/직책',
name VARCHAR(30) NOT NULL COMMENT '사원명',
reg_date DATETIME DEFAULT NOW() COMMENT '입사일자',
end_date datetime default null comment '퇴사일자'
);

*/
	private int idx;
	private String c_name;
	private String c_name2;
	private String subname;
	private String id;
	private String pwd;
	private String position;
	private String name;
	private Date reg_date;
	private Date end_date;
}
