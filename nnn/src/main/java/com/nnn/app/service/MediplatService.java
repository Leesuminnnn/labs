package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.MediplatDao;
import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;

@Service
public class MediplatService {

	private MediplatDao medi;
	
	@Autowired
	public MediplatService (MediplatDao medi) {
		this.medi = medi;
	}
	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return medi.noticeSelect(map);
	}

	public UsersVo info2(UsersVo vo) {
		return medi.info2(vo);
	}

	public int login(UsersVo vo) {
		return medi.login(vo);
	}

	public int dbcheck(UsersVo vo) {
		int flag = 0;
		flag = medi.dbcheck(vo);
		return flag;
	}

	public UsersVo info(Integer idx) {
		return medi.info(idx);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = medi.loginlog(map);
		return flag;
	}
	public List<Mediplat> mediTitleSelect() {
		return medi.mediTitleSelect();
	}

	public List<MediplatMenu> mediMenuSelect() {
		return medi.mediMenuSelect();
	}
	
}
