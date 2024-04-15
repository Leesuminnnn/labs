package com.nnn.app.vo;

import java.util.Date;

import javax.persistence.Lob;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageEntity {
/*

create Table image (
idx int(11) not null auto_increment primary key,
imageData longblob null,
regdate datetime default now(),
cs_idx int(11) null
);

*/	
	private int idx;
	private int cs_idx;
	@Lob
	private byte[] imageData;
	
//	private String imageData;
	
	private Date regdate;

	
}
