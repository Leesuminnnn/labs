package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HelpVo {
/*
CREATE TABLE help(
hidx INT AUTO_INCREMENT not NULL PRIMARY KEY,
h_regdate DATETIME DEFAULT NOW(),
h_delyn CHAR(1) DEFAULT 'N',
h_userId VARCHAR(20) NOT NULL REFERENCES member(m_id),
h_userName VARCHAR(20) NOT NULL,
h_startTime DATETIME DEFAULT NOW(),
h_endTime DATETIME,
h_name VARCHAR(20),
h_no VARCHAR(20),
h_number VARCHAR(20),
h_img VARCHAR(100),
h_imgName VARCHAR(100),
h_comm VARCHAR(200) DEFAULT "특이사항없음",
mdix INT NULL,
h_dayTime VARCHAR(10) NULL
);
*/

	private int hidx;
	private int midx;
	private Date h_regdate;
	private String h_delyn;
	private String h_userId;
	private String h_userName;
	private Date h_startTime;
	private Date h_endTime;
	private String h_name;
	private String h_no;
	private String h_number;
	private String h_img;
	private String h_imgName;
	private String h_comm;
	private String h_dayTime;
	private String mainpickItem;
	public Object getCount() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
}
