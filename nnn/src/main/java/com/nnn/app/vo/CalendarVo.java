package com.nnn.app.vo;

import lombok.Data;

@Data
public class CalendarVo {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
    private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
    }
