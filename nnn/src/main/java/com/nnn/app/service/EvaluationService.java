package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.EvaluationDao;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WhetherVo;


@Service
public class EvaluationService {

	private EvaluationDao evaluationDao;
	
	@Autowired
	public EvaluationService(EvaluationDao evaluationDao) {
		this.evaluationDao = evaluationDao;
	}
	
	public int login(UsersVo vo) throws Exception {
		return evaluationDao.login(vo);
	}
	
	public UsersVo info2(UsersVo vo) throws Exception {
		return evaluationDao.info2(vo);
	}

	public UsersVo info(Integer idx) {
		return evaluationDao.info(idx);
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = evaluationDao.pwdinsert(map);
		
		return flag;
	}

	public List<UsersVo> evaluationtarget(Map<String, Object> map) {
		return evaluationDao.evaluationtarget(map);
	}

	public List<UsersVo> BTlist(Map<String, Object> map) {
		return evaluationDao.BTlist(map);
	}

	public List<UsersVo> BFlist(Map<String, Object> map) {
		return evaluationDao.BFlist(map);
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return evaluationDao.evList(map);
	}

	public int frominsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = evaluationDao.frominsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map2) {
		int flag = 0;
		
		flag = evaluationDao.whether(map2);
		
		return flag;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return evaluationDao.noticeSelect(map);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = evaluationDao.loginlog(map);
		return flag;
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return evaluationDao.whetherSelect(map);
	}

	public int formcheck(Map<String, Object> map) throws Exception {
		int flag = 0;
		flag = evaluationDao.formcheck(map);
		return flag;
	}

	public int dbcheck(UsersVo vo) {
		int flag = 0;
		flag = evaluationDao.dbcheck(vo);
		return flag;
	}

	public List<UsersVo> users(Map<String, Object> map) {
		return evaluationDao.users(map);
	}
}
