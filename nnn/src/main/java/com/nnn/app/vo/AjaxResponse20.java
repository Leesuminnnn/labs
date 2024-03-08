package com.nnn.app.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AjaxResponse20 {

	private String result;
	private List<UsersVo> users;
	private List<Access> access;
}
