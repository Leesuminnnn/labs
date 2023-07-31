package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PointminusVo {
/*
CREATE TABLE poims(
idx INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
p_regdate DATETIME DEFAULT NOW(),
midx INT NOT NULL,
userId VARCHAR(20) not null REFERENCES member(m_id),
p_minus INT NOT NULL,
p_status VARCHAR(20) DEFAULT "사용"
);
*/

	private int idx;
	private Date p_regdate;
	private int midx;
	private String userId;
	private int p_minus;
	private String p_status;
	
	
	
	
	
	
	
}
