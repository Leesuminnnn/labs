package com.nnn.app.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SignVo {
/*
CREATE TABLE signImage (
    idx INT AUTO_INCREMENT PRIMARY KEY,
    canvasImg1 LONGBLOB NOT NULL,
    canvasImg2 LONGBLOB NOT NULL,
    canvasImg  LONGBLOB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cs_idx INT,
    FOREIGN KEY (cs_idx) REFERENCES users__(idx)
);
*/
	private int idx;
	private int cs_idx;
//	@Lob
	private byte[] canvasImg1;
//	@Lob
	private byte[] canvasImg2;
//	@Lob
	private byte[] canvasImg;
	private Date created_at;
	
	
	
}
