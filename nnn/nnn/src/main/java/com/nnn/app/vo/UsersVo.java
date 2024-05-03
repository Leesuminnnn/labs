package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UsersVo {
/*

create table users__ (
idx INT AUTO_INCREMENT PRIMARY KEY comment '순번',
hspt_name VARCHAR(30) NOT NULL COMMENT '기관명',
hspt_subname varchar(30) not null comment '부서명',
hspt_subcode VARCHAR(30) NOT NULL COMMENT '부서코드',
id VARCHAR(30) NOT NULL COMMENT '사원번호',
pwd VARCHAR(100) NULL COMMENT '비밀번호',
hspt_position VARCHAR(30) NOT NULL COMMENT '직급/직책',
name VARCHAR(30) NOT NULL COMMENT '사원명',
reg_date DATETIME DEFAULT NOW() COMMENT '입사일자',
end_date datetime default null comment '퇴사일자',
hspt_V VARCHAR(30) NOT NULL COMMENT '경혁팀 여부',
hspt_K VARCHAR(30) NOT NULL COMMENT '경혁팀장 여부',
hspt_B VARCHAR(30) NOT NULL COMMENT '부서장 여부',
hspt_X VARCHAR(30) NOT NULL COMMENT '1인부서 여부',
hspt_Z VARCHAR(30) NOT NULL COMMENT '진료팀장 여부',
hspt_S varchar(30) not null comment '(변수) 부서원평가 여부',
hspt_T varchar(30) not null comment '(변수) 부서장대행 여부',
hspt_J varchar(30) not null comment '(변수) 경혁팀 평가 여부',
user_code VARCHAR(30) NOT NULL COMMENT '코드'
);


 */
	

	private int idx;
	private String hspt_name;
	private String hspt_subname;
	private String hspt_subcode;
	private String id;
	private String pwd;
	private String hspt_position;
	private String name;
	private Date reg_date;
	private Date end_date;
	private String hspt_V;
	private String hspt_K;
	private String hspt_B;
	private String hspt_X;
	private String hspt_Z;
	private String hspt_S;
	private String hspt_T;
	private String hspt_J;
	private String user_code;
	
	private double subscore;
	
	
}
