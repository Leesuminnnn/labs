package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointplusVo {
/*
CREATE TABLE poips(
idx INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
p_regdate DATETIME DEFAULT NOW(),
midx INT NOT NULL,
userId VARCHAR(20) not null REFERENCES member(m_id),
p_plus INT NOT NULL,
p_status VARCHAR(20) DEFAULT "적립"
);
*/

	private int idx;
	private Date p_regdate;
	private int midx;
	private String userId;
	private int p_plus;
	private String p_status;
	private int hidx;
	
	private HelpVo helpvo;
	
	
	
	
	
	
}
