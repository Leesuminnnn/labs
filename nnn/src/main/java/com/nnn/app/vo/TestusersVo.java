package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TestusersVo {
/*
CREATE TABLE `testusers` (
	`idx` INT(11) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`pwd` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8_general_ci',
	`reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`idx`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

*/

	private int idx;
	private Date reg_date;
	private String id;
	private String pwd;
	private String name;
	
	
	
	
	
	
	
}
