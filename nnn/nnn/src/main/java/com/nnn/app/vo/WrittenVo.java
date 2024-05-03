package com.nnn.app.vo;

import java.sql.Date;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WrittenVo {
/*
CREATE TABLE `cs_data` (
	`cs_idx` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
	`cs_data_01` VARCHAR(50) NULL DEFAULT NULL COMMENT '성명' COLLATE 'utf8_general_ci',
	`cs_data_02` VARCHAR(50) NULL DEFAULT NULL COMMENT '등록번호' COLLATE 'utf8_general_ci',
	`cs_data_03` VARCHAR(50) NULL DEFAULT NULL COMMENT '입원병실' COLLATE 'utf8_general_ci',
	`cs_data_04` VARCHAR(50) NULL DEFAULT NULL COMMENT '성별' COLLATE 'utf8_general_ci',
	`cs_data_05` VARCHAR(50) NULL DEFAULT NULL COMMENT '생년월일' COLLATE 'utf8_general_ci',
	`cs_data_06` VARCHAR(50) NULL DEFAULT NULL COMMENT '휴대폰번호' COLLATE 'utf8_general_ci',
	`cs_data_07` VARCHAR(50) NULL DEFAULT NULL COMMENT '주보호자 성명' COLLATE 'utf8_general_ci',
	`cs_data_08` VARCHAR(50) NULL DEFAULT NULL COMMENT '주보호자 관계' COLLATE 'utf8_general_ci',
	`cs_data_09` VARCHAR(50) NULL DEFAULT NULL COMMENT '주보호자 주소' COLLATE 'utf8_general_ci',
	`cs_data_10` VARCHAR(50) NULL DEFAULT NULL COMMENT '주보호자 휴대폰번호' COLLATE 'utf8_general_ci',
	`cs_data_11` VARCHAR(50) NULL DEFAULT NULL COMMENT '주보호자 비용안내' COLLATE 'utf8_general_ci',
	`cs_data_12` VARCHAR(50) NULL DEFAULT NULL COMMENT '부보호자 성명' COLLATE 'utf8_general_ci',
	`cs_data_13` VARCHAR(50) NULL DEFAULT NULL COMMENT '부보호자 관계' COLLATE 'utf8_general_ci',
	`cs_data_14` VARCHAR(50) NULL DEFAULT NULL COMMENT '부보호자 주소' COLLATE 'utf8_general_ci',
	`cs_data_15` VARCHAR(50) NULL DEFAULT NULL COMMENT '부보호자 휴대폰번호' COLLATE 'utf8_general_ci',
	`cs_data_16` VARCHAR(50) NULL DEFAULT NULL COMMENT '부보호자 비용안내' COLLATE 'utf8_general_ci',
	`cs_data_17` VARCHAR(50) NULL DEFAULT NULL COMMENT '동의사유1' COLLATE 'utf8_general_ci',
	`cs_data_18` VARCHAR(50) NULL DEFAULT NULL COMMENT '동의사유2' COLLATE 'utf8_general_ci',
	`cs_data_19` VARCHAR(50) NULL DEFAULT NULL COMMENT '동의사유3' COLLATE 'utf8_general_ci',
	`cs_data_20` VARCHAR(50) NULL DEFAULT NULL COMMENT '동의사유4' COLLATE 'utf8_general_ci',
	`cs_data_21` VARCHAR(50) NULL DEFAULT NULL COMMENT '동의사유5' COLLATE 'utf8_general_ci',
	`cs_data_22` VARCHAR(50) NULL DEFAULT NULL COMMENT '상급병실' COLLATE 'utf8_general_ci',
	`cs_data_23` VARCHAR(50) NULL DEFAULT NULL COMMENT '병실호수' COLLATE 'utf8_general_ci',
	`cs_data_24` VARCHAR(50) NULL DEFAULT NULL COMMENT '특실' COLLATE 'utf8_general_ci',
	`cs_data_25` VARCHAR(50) NULL DEFAULT NULL COMMENT '1인실' COLLATE 'utf8_general_ci',
	`cs_data_26` VARCHAR(50) NULL DEFAULT NULL COMMENT '2인실' COLLATE 'utf8_general_ci',
	`cs_data_27` VARCHAR(50) NULL DEFAULT NULL COMMENT '비용 1일당' COLLATE 'utf8_general_ci',
	`cs_data_28` VARCHAR(50) NULL DEFAULT NULL COMMENT '신청인 관계' COLLATE 'utf8_general_ci',
	`cs_data_29` VARCHAR(50) NULL DEFAULT NULL COMMENT '신청인 성명' COLLATE 'utf8_general_ci',
	`cs_data_30` VARCHAR(20) NULL DEFAULT NULL COMMENT '임시저장=1/등록완료=2' COLLATE 'utf8_general_ci',
	`cs_data_31` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
	`cs_data_32` VARCHAR(10) NULL DEFAULT NULL COMMENT '입원서약서=1' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`cs_idx`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
*/

	private int cs_idx;
	private String cs_data_01;
	private String cs_data_02;
	private String cs_data_03;
	private String cs_data_04;
	private String cs_data_05;
	private String cs_data_06;
	private String cs_data_07;
	private String cs_data_08;
	private String cs_data_09;
	private String cs_data_10;
	private String cs_data_11;
	private String cs_data_12;
	private String cs_data_13;
	private String cs_data_14;
	private String cs_data_15;
	private String cs_data_16;
	private String cs_data_17;
	private String cs_data_18;
	private String cs_data_19;
	private String cs_data_20;
	private String cs_data_21;
	private String cs_data_22;
	private String cs_data_23;
	private String cs_data_24;
	private String cs_data_25;
	private String cs_data_26;
	private String cs_data_27;
	private String cs_data_28;
	private String cs_data_29;
	private String cs_data_30;
	private String cs_data_31;
	
	
}
