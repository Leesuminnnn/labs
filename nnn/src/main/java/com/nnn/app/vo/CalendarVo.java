package com.nnn.app.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
	private String start;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
	private String end;
	private Date regdate;
    private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	//운행구분
	private String run;
	//기관
	private String agency;
	//준비사항
	private String prepare;
	//환자 이름
	private String patientName;
	//환자 병실
	private String patientRoom;
	//환자 휴대폰번호
	private String patientNumber;
	
    }
