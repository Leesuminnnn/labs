package com.nnn.app.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class MemberVo {
/*
CREATE TABLE member (
midx INT AUTO_INCREMENT not NULL PRIMARY KEY,
m_regdate DATETIME DEFAULT NOW(),
m_delyn CHAR(1) DEFAULT 'N',
m_id VARCHAR(100),
m_name VARCHAR(100),
m_pw VARCHAR(100),
m_email VARCHAR(100),
m_status VARCHAR(6),
m_in VARCHAR(100),
m_de VARCHAR(100),
m_no VARCHAR(100)
);
*/

	private int midx;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_delyn;
	private String m_email;
	private Date m_regdate;
	private String m_status;
	private String m_in;
	private String m_de;
	private String m_no;
	private String m_point;
	


}
