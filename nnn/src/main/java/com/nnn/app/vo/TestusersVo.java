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
pwd VARCHAR(50) NULL COMMENT '유저 비밀번호',
name VARCHAR(30) NOT NULL  COMMENT '유저 이름',
reg_date DATETIME DEFAULT NOW() COMMENT '생성일',
hspt_name VARCHAR(30) NOT NULL COMMENT '속한 병원',
hspt_sub VARCHAR(30) NOT NULL COMMENT '속한 부서',
hspt_position VARCHAR(30) NOT NULL COMMENT '직책'
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
	
	
	
	
	
	
	
}
