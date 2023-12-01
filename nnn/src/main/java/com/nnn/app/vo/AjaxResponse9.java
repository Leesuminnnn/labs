package com.nnn.app.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class AjaxResponse9 {

	private String result;
	private List<UsersVo> usersall;
	private List<TargetVo> target;
	private List<AnswerVo> answer;
	private int targetsum;
	private int answersum;
	
	
}
