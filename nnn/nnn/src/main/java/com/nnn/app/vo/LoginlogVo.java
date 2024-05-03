package com.nnn.app.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginlogVo {
	
/*

CREATE TABLE `loginlog` (
	`id` VARCHAR(50) DEFAULT NULL COMMENT '로그인한 유저 사번' COLLATE 'utf8_general_ci',
	`d1` VARCHAR(50) DEFAULT NULL COMMENT '로그인한 유저명' COLLATE 'utf8_general_ci',
	`d2` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '로그인한 시간' COLLATE 'utf8_general_ci',
	`ip` VARCHAR(50) DEFAULT NULL COMMENT '로그인한 유저 ip' COLLATE 'utf8_general_ci'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


*/

	private String id;
	private String d1;
	private Date d2;
	private String ip;
}
