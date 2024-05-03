package com.nnn.app.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AjaxResponse16 {

	private String result;
	private List<UsersVo> usersall;
	private List<TargetVo> target;
	private List<CAnswerVo> answer;
	private int targetsum;
	private int answersum;
}
