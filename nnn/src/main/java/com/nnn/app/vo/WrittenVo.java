package com.nnn.app.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
    `hos_contract_year` VARCHAR(50) NULL DEFAULT NULL COMMENT '년' COLLATE 'utf8_general_ci',
    `hos_contract_month` VARCHAR(50) NULL DEFAULT NULL COMMENT '월' COLLATE 'utf8_general_ci',
    `hos_contract_day` VARCHAR(50) NULL DEFAULT NULL COMMENT '일' COLLATE 'utf8_general_ci',
    
    `hos_year` VARCHAR(50) NULL DEFAULT NULL COMMENT '입원년' COLLATE 'utf8_general_ci',
    `hos_month` VARCHAR(50) NULL DEFAULT NULL COMMENT '입원월' COLLATE 'utf8_general_ci',
    `hos_day` VARCHAR(50) NULL DEFAULT NULL COMMENT '입원일' COLLATE 'utf8_general_ci',
    
    `hos_number` VARCHAR(50) NULL DEFAULT NULL COMMENT 'No' COLLATE 'utf8_general_ci',
    `hos_po` VARCHAR(50) NULL DEFAULT NULL COMMENT '특이사항' COLLATE 'utf8_general_ci',
    `hos_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '이름' COLLATE 'utf8_general_ci',
    
    `insurance` VARCHAR(50) NULL DEFAULT NULL COMMENT '보험' COLLATE 'utf8_general_ci',
    `salary` VARCHAR(50) NULL DEFAULT NULL COMMENT '급여' COLLATE 'utf8_general_ci',
    `self_insurance` VARCHAR(50) NULL DEFAULT NULL COMMENT '자보' COLLATE 'utf8_general_ci',
	`accident` VARCHAR(50) NULL DEFAULT NULL COMMENT '산재' COLLATE 'utf8_general_ci',
    `general` VARCHAR(50) NULL DEFAULT NULL COMMENT '일반' COLLATE 'utf8_general_ci',

    `hos_code1` VARCHAR(50) NULL DEFAULT NULL COMMENT '상병명1' COLLATE 'utf8_general_ci',
	`hos_code2` VARCHAR(50) NULL DEFAULT NULL COMMENT '상병명2' COLLATE 'utf8_general_ci',
    
    `hos_department` VARCHAR(50) NULL DEFAULT NULL COMMENT '과' COLLATE 'utf8_general_ci',
	`hos_ward` VARCHAR(50) NULL DEFAULT NULL COMMENT '병실' COLLATE 'utf8_general_ci',
	`hos_room` VARCHAR(50) NULL DEFAULT NULL COMMENT '인실' COLLATE 'utf8_general_ci',
    
	`check1` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인1' COLLATE 'utf8_general_ci',
    `check2` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인2' COLLATE 'utf8_general_ci',
    `check3` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인3' COLLATE 'utf8_general_ci',
    `check4` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인4' COLLATE 'utf8_general_ci',
    `check5` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인5' COLLATE 'utf8_general_ci',
    `check6` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인6' COLLATE 'utf8_general_ci',
    `check7` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인7' COLLATE 'utf8_general_ci',
    `check8` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인8' COLLATE 'utf8_general_ci',
    `check9` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인9' COLLATE 'utf8_general_ci',
    
    `check10` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인10' COLLATE 'utf8_general_ci',
    `check11` VARCHAR(50) NULL DEFAULT NULL COMMENT '확인11' COLLATE 'utf8_general_ci',
    
    `yesrs` VARCHAR(50) NULL DEFAULT NULL COMMENT '본인부담액' COLLATE 'utf8_general_ci',
	`payment` VARCHAR(50) NULL DEFAULT NULL COMMENT '만원' COLLATE 'utf8_general_ci',
    
	`medicine` VARCHAR(50) NULL DEFAULT NULL COMMENT '비급여치료재료' COLLATE 'utf8_general_ci',
	`nutrients` VARCHAR(50) NULL DEFAULT NULL COMMENT '영양제' COLLATE 'utf8_general_ci',
	`transport` VARCHAR(50) NULL DEFAULT NULL COMMENT '이송료' COLLATE 'utf8_general_ci',
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
	
	private String hos_contract_year;
	private String hos_contract_month;
	private String hos_contract_day;
	private String hos_year;
	private String hos_month;
	private String hos_day;
	private String hos_number;
	private String hos_po;
	private String hos_name;
	private String insurance;
	private String salary;
	private String self_insurance;
	private String accident;
	private String general;
	private String hos_code1;
	private String hos_code2;
	private String hos_department;
	private String hos_ward;
	private String hos_room;
	private String check1;
	private String check2;
	private String check3;
	private String check4;
	private String check5;
	private String check6;
	private String check7;
	private String check8;
	private String check9;
	private String check10;
	private String check11;
	private String yesrs_pay;
	private String payment;
	private String medicine;
	private String nutrients;
	private String transport;
	
	private byte[] canvasImg;
	private byte[] canvasImg1;
	private byte[] canvasImg2;
	
	
	
}
