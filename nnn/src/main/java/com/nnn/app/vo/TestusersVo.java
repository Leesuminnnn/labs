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
CREATE TABLE `testusers` (
	`idx` INT(11) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`pwd` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	`code` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`idx`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;



*/

	private int idx;
	private Date reg_date;
	private String id;
	private String pwd;
	private String name;
	private String code;
	
	
	
	
	
	
	
}
