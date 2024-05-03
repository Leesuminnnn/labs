package com.nnn.app.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.nnn.app.vo.MemberVo;

public interface MemberLoginService {

	public String logincheck(MemberVo vo, HttpSession session)throws Exception;

	
	
	
}
