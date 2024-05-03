package com.nnn.app.service;

import javax.servlet.http.HttpSession;

import com.nnn.app.vo.MemberVo;

public interface MemberDetailService {

	public MemberVo memberDetail(Integer midx) throws Exception;
}
