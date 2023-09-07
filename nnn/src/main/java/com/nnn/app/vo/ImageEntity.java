package com.nnn.app.vo;

import java.util.Date;

import javax.persistence.Lob;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageEntity {

	private int idx;
	private int cs_idx;
	@Lob
	private byte[] imageData;
	
//	private String imageData;
	
	private Date regdate;

	
}
