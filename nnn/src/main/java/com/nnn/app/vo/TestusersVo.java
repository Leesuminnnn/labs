package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestusersVo {
/*
CREATE TABLE testusers (
idx INT AUTO_INCREMENT PRIMARY KEY,
id VARCHAR(30) NOT NULL COMMENT '유저 사번',
pwd VARCHAR(100) NULL COMMENT '유저 비밀번호',
name VARCHAR(30) NOT NULL COMMENT '유저 이름',
reg_date DATETIME DEFAULT NOW() COMMENT '생성일',
hspt_name VARCHAR(30) NOT NULL COMMENT '속한 기관',
hspt_sub VARCHAR(30) NOT NULL COMMENT '부서코드',
hspt_position VARCHAR(30) NOT NULL COMMENT '직책',
hspt_V VARCHAR(30) NOT NULL COMMENT '경혁팀 여부',
hspt_k VARCHAR(30) NOT NULL COMMENT '경혁팀장 여부',
hspt_B VARCHAR(30) NOT NULL COMMENT '부서장 여부',
hspt_X VARCHAR(30) NOT NULL COMMENT '1인부서 여부',
hspt_Z VARCHAR(30) NOT NULL COMMENT '진료팀장 여부',
user_code VARCHAR(30) NOT NULL COMMENT '코드'
);
*/
	private int idx;
	private Date reg_date;
	private String id;
	private String pwd;
	private String name;
	private String hspt_name;
	private String hspt_sub;
	private String hspt_position;
	private String hspt_V;
	private String hspt_K;
	private String hspt_B;
	private String hspt_X;
	private String hspt_Z;
	private String user_code;
	
	private int d1;
	private int d2;
	private String d3;
	
}
