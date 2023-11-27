package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CoopusersVo {
	/*

create table coopusers (
idx INT AUTO_INCREMENT PRIMARY KEY comment '순번',
c_name VARCHAR(30) NOT NULL COMMENT '기관명',
c_name2 VARCHAR(30) NOT NULL COMMENT '소속기관',
c_subname varchar(30) not null comment '부서명',
c_subcode VARCHAR(30) NOT NULL COMMENT '부서코드',
id VARCHAR(30) NOT NULL COMMENT '사원번호',
pwd VARCHAR(100) NULL COMMENT '비밀번호',
c_position VARCHAR(30) NOT NULL COMMENT '직급/직책',
name VARCHAR(30) NOT NULL COMMENT '사원명',
reg_date DATETIME DEFAULT NOW() COMMENT '입사일자',csworktools
end_date datetime default null comment '퇴사일자',
del_yn char(5) not null comment '평가제외 여부',
c_B VARCHAR(30) NOT NULL COMMENT '부서장 여부',
c_M VARCHAR(30) NOT NULL COMMENT '운영진간 평가',
down VARCHAR(30) NOT NULL COMMENT '상하평가',
none VARCHAR(30) NOT NULL COMMENT '변수)제외코드',
user_code VARCHAR(30) NOT NULL COMMENT '코드'
);
	
	*/
	
	private int idx;
	private String c_name;
	private String c_name2;
	private String c_subnabe;
	private String c_subcode;
	private String id;
	private String pwd;
	private String c_position;
	private String name;
	private Date reg_date;
	private Date end_date;
	private String del_yn;
	private String c_B;
	private String c_M;
	private String down;
	private String none;
	private String user_code;
	
	
}
