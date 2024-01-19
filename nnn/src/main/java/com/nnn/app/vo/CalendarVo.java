package com.nnn.app.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVo {
	private int id;
	private String amb;
	private String writer;
	private String sub;
	private String content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
	private Date regdate;
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
	
	// 시작 시간
	private String starttime;
	// 종료시간
	private String endtime;
	// 시작 날짜
	private String startdate;
	// 종료 날짜
	private String enddate;
	
	
    }
