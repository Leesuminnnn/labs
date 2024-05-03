package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.TDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.GoogleuserVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.SubVo;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.UserVo;
import com.nnn.app.vo.UseroptionVo;
import com.nnn.app.vo.WhetherVo;

@Service
public class TService {

	private TDao tDao;

	@Autowired
	public TService(TDao tDao) {
		this.tDao = tDao;
	}

	public List<TestVo> list(TestVo vo) {
		return tDao.list(vo);
	}
	
	public List<TestVo> listsearch(Criteria cri) {
		return tDao.listsearch(cri);
	}
	
	public int insert(TestVo vo) {
		int result = 0;	//글쓰기 실패
		
		result = tDao.insert(vo);
		
		return result;
	}
	
	public int Cnt(Criteria cri) {
		return tDao.Cnt(cri);
	}

	public int login(TestusersVo vo) throws Exception {
		return tDao.login(vo);
	}
	
	public TestusersVo info2(TestusersVo vo) throws Exception {
		return tDao.info2(vo);
	}

	public TestusersVo info(Integer idx) {
		return tDao.info(idx);
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = tDao.pwdinsert(map);
		
		return flag;
	}

	public List<TestusersVo> evaluationtarget(Map<String, Object> map) {
		return tDao.evaluationtarget(map);
	}

	public List<TestusersVo> BTlist(Map<String, Object> map) {
		return tDao.BTlist(map);
	}

	public List<TestusersVo> BFlist(Map<String, Object> map) {
		return tDao.BFlist(map);
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return tDao.evList(map);
	}

	public int frominsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = tDao.frominsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map2) {
		int flag = 0;
		
		flag = tDao.whether(map2);
		
		return flag;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return tDao.noticeSelect(map);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = tDao.loginlog(map);
		return flag;
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return tDao.whetherSelect(map);
	}

	public int guserinsert(GoogleuserVo user) {
		int flag = 0;
		flag = tDao.guserinsert(user);		
		return flag;
	}

	
	
	
	public List<SubVo> subop(Map<String, Object> map) {
		return tDao.subop(map);
	}

	public List<UserVo> userall(Map<String, Object> map) {
		return tDao.userall(map);
	}

	public List<UseroptionVo> userop(Map<String, Object> map) {
		return tDao.userop(map);
	}

}
