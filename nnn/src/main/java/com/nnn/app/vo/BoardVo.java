package com.nnn.app.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVo {
/*
create table board (
bidx int auto_increment not null primary key,
b_title varchar(50) not null,
b_content varchar(500) not null,
b_file varchar(100) null,
b_filename VARCHAR(100) NULL,
b_regdate datetime default now(),
b_writer varchar(10) not null,
b_delyn char(1) default 'N',
midx INT NOT null
);

*/

	private int bidx;
	private String b_title;
	private String b_content;
	private MultipartFile b_file;
	private String b_filename;
	private Date b_regdate;
	private String b_writer;
	private String b_delyn;
	private int midx;
	
	
	
	
	
	
}
