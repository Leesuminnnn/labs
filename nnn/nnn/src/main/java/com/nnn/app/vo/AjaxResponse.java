package com.nnn.app.vo;

import java.util.List;

public class AjaxResponse {

	private String result;
	private List<HelpVo> helplist;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public List<HelpVo> getHelplist() {
		return helplist;
	}
	public void setHelplist(List<HelpVo> helplist) {
		this.helplist = helplist;
	}
	
	
}
