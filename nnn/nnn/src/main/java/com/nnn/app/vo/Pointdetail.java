package com.nnn.app.vo;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pointdetail {
/*
CREATE TABLE point_details(
idx INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
p_regdate DATETIME DEFAULT NOW(),
midx INT NOT NULL REFERENCES member(midx),
userId VARCHAR(20) NOT NULL REFERENCES member(m_id),
details INT NOT NULL,
p_status VARCHAR(20)
);
*/

	private int idx;
	private Date p_regdate;
	private int midx;
	private String userId;
	private int details;
	private String p_status;
	private int hidx;
	private HelpVo helpvo;
}
