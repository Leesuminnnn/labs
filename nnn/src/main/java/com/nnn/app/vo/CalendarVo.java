package com.nnn.app.vo;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CalendarVo {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
	private String start;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
	private String end;
	
    private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
    }
