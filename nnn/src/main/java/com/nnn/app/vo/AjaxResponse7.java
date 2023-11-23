package com.nnn.app.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AjaxResponse7 {

	private String result;
	private List<UsersVo> usersall;
	private List<TargetVo> target;
	private List<AnswerVo> answer;
	
	
}
